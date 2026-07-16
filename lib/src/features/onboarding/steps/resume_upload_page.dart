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
      title: "Resume",
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
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
        AppHeader(title: "Upload your", highlight: "resume"),

        const SizedBox(height: 10),

        const Text(
          "Lets us automatically build your profile and improve job matching accuracy",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 20),

        /// 📄 UPLOAD BOX
        _uploadBox(context),

        // const SizedBox(height: 16),

        // Container(
        //   padding: const EdgeInsets.all(16),
        //   decoration: BoxDecoration(
        //     color: AppColors.kCard,
        //     borderRadius: BorderRadius.circular(16),
        //     border: Border.all(color: AppColors.kBorder),
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const Text(
        //         "We'll extract:",
        //         style: TextStyle(
        //           color: Colors.grey,
        //           fontSize: 13,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),

        //       const SizedBox(height: 12),

        //       Row(
        //         children: [
        //           Expanded(
        //             child: Column(
        //               children: const [
        //                 _ResumePoint("Skills"),
        //                 SizedBox(height: 10),
        //                 _ResumePoint("Experience"),
        //                 SizedBox(height: 10),
        //                 _ResumePoint("Education"),
        //               ],
        //             ),
        //           ),

        //           Expanded(
        //             child: Column(
        //               children: const [
        //                 _ResumePoint("Certifications"),
        //                 SizedBox(height: 10),
        //                 _ResumePoint("Projects"),
        //                 SizedBox(height: 10),
        //                 _ResumePoint("Resume Score"),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(height: 16),

        // /// OR
        // Row(
        //   children: [
        //     Expanded(child: Divider(color: AppColors.kBorder)),
        //     const Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 8),
        //       child: Text("or", style: TextStyle(color: Colors.grey)),
        //     ),
        //     Expanded(child: Divider(color: AppColors.kBorder)),
        //   ],
        // ),

        // const SizedBox(height: 20),

        // _linkedInCard(),

        // const SizedBox(height: 20),

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

      /// 🔥 Show loader AFTER file selection
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
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

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Resume uploaded successfully")),
      );

      await Future.delayed(const Duration(milliseconds: 200));

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

  // /// 🔗 LINKEDIN CARD
  // Widget _linkedInCard() {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: AppColors.kCard,
  //       borderRadius: BorderRadius.circular(16),
  //       border: Border.all(color: AppColors.kBorder),
  //     ),
  //     child: Row(
  //       children: const [
  //         Icon(Icons.auto_awesome, color: Colors.deepPurple),
  //         SizedBox(width: 12),
  //         Expanded(
  //           child: Text(
  //             "Autofill from LinkedIn",
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
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
