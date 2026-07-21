import 'dart:async';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show Wrapper, AppHeader;

import '../../../core/index.dart';
import '../../../core/models/education.dart';
import '../../../core/models/experience.dart';

class ResumeUploadPage extends StatelessWidget {
  final VoidCallback onNext;

  const ResumeUploadPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.topLeft,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () async {
              final shouldGoBack = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Go Back?"),
                  content: const Text(
                    "Are you sure you want to go back to the login page?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(false),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => context.pop(true),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );

              if (shouldGoBack == true) {
                context.pushNamed(RouteNames.login);
              }
            },
          ),
        ),
        AppHeader(title: "Drop your", highlight: "resume"),

        const SizedBox(height: 10),

        Text.rich(
          TextSpan(
            style: TextStyle(color: Colors.grey),
            children: [
              TextSpan(text: "Let AI do the stalking. 🕵️ We'll "),
              TextSpan(
                text:
                    "build your profile, map your alumni network and career insights",
                style: TextStyle(color: AppColors.kGreen),
              ),
              TextSpan(text: "."),
            ],
          ),
        ),
        const SizedBox(height: 20),

        /// 📄 UPLOAD BOX
        _uploadBox(context),

        const SizedBox(height: 16),

        /// INFO
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.kCard,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: const [
              Icon(Icons.flash_on, color: Colors.green, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Profiles with resumes get 3x more referrals",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        /// ⏭ SKIP (FIXED)
        Center(
          child: TextButton(
            onPressed: onNext, // ✅ JUST MOVE NEXT
            child: const Text(
              "Skip and Fill Manually",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> _handleUpload(BuildContext context) async {
    bool isDialogOpen = false;

    try {
      /// 📂 Pick file first
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      /// User cancelled
      if (result == null) return;

      final file = result.files.single;

      if (file.path == null) return;

      /// 🔥 Show cycling loader AFTER file selection
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const _ParsingLoader(),
      );
      isDialogOpen = true;

      /// Upload & Parse
      final parsedData = await parseResumeAndFill(file);

      /// Hide loader
      if (isDialogOpen && Navigator.canPop(context)) {
        Navigator.pop(context);
        isDialogOpen = false;
      }

      if (parsedData == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Resume Parsing failed but resume uploaded successfully",
            ),
          ),
        );
        return;
      }

      /// 🔥 UPDATE GLOBAL STATE
      final currentUser = context.read<AppStateProvider>().data ?? User();
      final education = parsedData['education'] as List?;

      context.read<AppStateProvider>().data = currentUser.copyWith(
        name: parsedData['name'],
        email: parsedData['email'],
        phone: parsedData['phone'],
        gender: parsedData['gender'],
        about: parsedData['about'],
        linkedin: parsedData['linkedin_url'],
        github: parsedData['github_url'],
        portfolio: parsedData['portfolio_url'],
        skills: (parsedData['skills'] as List?)
            ?.map((e) => e.toString())
            .toList(),
        educations: education
            ?.map(
              (e) => Education(
                college: e['institution'],
                degree: e['degree'],
                specialization: e['field_of_study'],
                cgpa: e['cgpa']?.toString(),
                yearOfGraduation: e['year']?.toString(),
                educationType: "bachelors",
                isCurrent: false,
              ),
            )
            .toList(),
        experiences: (parsedData['work_experience'] as List?)
            ?.map(
              (e) => Experience(
                company: e['organization'],
                role: e['title'],
                startDate: e['start_date'],
                endDate: e['end_date'],
                description: (e['description'] as List?)?.join('\n'),
                isCurrent: e['end_date']?.toString().toLowerCase() == "present",
              ),
            )
            .toList(),
        currentCompany:
            (parsedData['work_experience'] as List?)?.isNotEmpty == true
            ? parsedData['work_experience'][0]['organization']
            : null,
      );

      /// 🎉 Success popup
      if (context.mounted) {
        await _showSuccessDialog(context);
      }

      onNext();
    } catch (e) {
      if (isDialogOpen && Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Something went wrong")));

      debugPrint("UPLOAD ERROR: $e");
    }
  }

  Future<Map<String, dynamic>?> parseResumeAndFill(PlatformFile file) async {
    try {
      debugPrint("Starting resume parsing...");

      if (file.path == null) return null;

      final dio = Dio(
        BaseOptions(
          receiveTimeout: const Duration(seconds: 120),
          sendTimeout: const Duration(seconds: 120),
        ),
      );

      final formData = FormData.fromMap({
        'resume': await MultipartFile.fromFile(file.path!, filename: file.name),
      });

      final token = await SecretRepo.getString('auth_token');

      final response = await dio.post(
        'https://api.rawrecruit.in/api/upload/resume',
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
          validateStatus: (status) => true,
        ),
      );

      debugPrint("STATUS: ${response.statusCode}");
      debugPrint("DATA: ${response.data}");

      /// Too many requests
      if (response.statusCode == 429) {
        debugPrint("RATE LIMITED");
        return null;
      }

      if (response.statusCode != 200 ||
          response.data == null ||
          response.data['success'] == false) {
        debugPrint("UPLOAD FAILED: ${response.data}");
        return null;
      }

      return response.data["data"] ?? response.data;
    } catch (e, s) {
      debugPrint("RESUME ERROR: $e");
      debugPrint("STACK: $s");
      return null;
    }
  }

  /// 🎉 SUCCESS DIALOG
  Future<void> _showSuccessDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: AppColors.kCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("🎉", style: TextStyle(fontSize: 44)),
              const SizedBox(height: 16),
              const Text(
                "Boom. Your network just got bigger.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Here's who you know (and didn't know you knew)",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kGreen,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "See my network",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 📄 UPLOAD BOX
  Widget _uploadBox(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleUpload(context),

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),

        decoration: BoxDecoration(
          color: AppColors.kCard,

          borderRadius: BorderRadius.circular(18),

          border: Border.all(color: AppColors.kBorder),
        ),

        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: AppColors.kGreen.withOpacity(.12),

                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.upload_file_rounded,
                color: AppColors.kGreen,
                size: 28,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Upload Your Resume",

              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "PDF • Max 5MB",

              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

/// ⏳ CYCLING PARSING LOADER
class _ParsingLoader extends StatefulWidget {
  const _ParsingLoader();

  @override
  State<_ParsingLoader> createState() => _ParsingLoaderState();
}

class _ParsingLoaderState extends State<_ParsingLoader> {
  static const _messages = [
    "AI is reading between the lines...",
    "Mapping your alumni network...",
    "Finding your people...",
    "Almost there — decoding your career DNA...",
  ];

  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      setState(() => _index = (_index + 1) % _messages.length);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.kCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColors.kGreen),
            const SizedBox(height: 24),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Text(
                _messages[_index],
                key: ValueKey(_index),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResumePoint extends StatelessWidget {
  final String title;

  const _ResumePoint(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: AppColors.kGreen, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
