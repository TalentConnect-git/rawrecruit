import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';
import '../../../../core/index.dart';
import '../../../../core/models/experience.dart';
import '../widgets/input_widgets.dart';

class ResumeUploadPage extends StatelessWidget {
  final VoidCallback onNext;

  const ResumeUploadPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Resume",
      children: [
        AppHeader(
          title: "Upload your",
          highlight: "resume",
        ),

        const SizedBox(height: 10),

        const Text(
          "We'll auto-fill your profile and match you with referrers",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 20),

        /// 📄 UPLOAD BOX
        _uploadBox(context),

        const SizedBox(height: 20),

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
              "Skip for now",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  /// 🔥 USE EXISTING PROFILE METHOD
Future<void> _handleUpload(BuildContext context) async {
  bool isDialogOpen = false;

  try {
    /// 🔥 SHOW LOADER
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
    isDialogOpen = true;

    /// 🔥 CALL PARSE METHOD
    final parsedData = await parseResumeAndFill();

    /// 🔥 CLOSE LOADER SAFELY
    if (isDialogOpen && Navigator.canPop(context)) {
      Navigator.pop(context);
      isDialogOpen = false;
    }

    /// ❌ IF FAILED → SHOW MESSAGE (NO CRASH)
    if (parsedData == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Resume upload failed")),
      );
      return;
    }

    /// 🔥 UPDATE GLOBAL STATE
    final currentUser =
        context.read<AppStateProvider>().data ?? User();
final education = parsedData['education'] as List?;

final firstEducation =
    education != null && education.isNotEmpty
        ? education.first
        : null;

context.read<AppStateProvider>().data =
    currentUser.copyWith(
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

  /// 🔥 EDUCATION
  college: firstEducation?['institution'],
  degree: firstEducation?['degree'],
  specialization:
      firstEducation?['field_of_study'],
  cgpa: firstEducation?['cgpa'],
  yearOfGraduation:
      firstEducation?['year'],
      experiences: (parsedData['work_experience'] as List?)
    ?.map(
      (e) => Experience(
        company: e['organization'],
        role: e['title'],
        startDate: e['start_date'],
        endDate: e['end_date'],
        description:
            (e['description'] as List?)
                ?.join('\n'),
        isCurrent:
            e['end_date']
                    ?.toString()
                    .toLowerCase() ==
                'present',
      ),
    )
    .toList(),
    currentCompany:
    (parsedData['work_experience'] as List?)
            ?.isNotEmpty ==
        true
    ? parsedData['work_experience'][0]['organization']
    : null,
    
);
await Future.delayed(
  const Duration(milliseconds: 200),
);
    /// 🚀 GO NEXT PAGE
    onNext();

  } catch (e) {
    /// 🔥 CLOSE LOADER SAFELY
    if (isDialogOpen && Navigator.canPop(context)) {
      Navigator.pop(context);
      isDialogOpen = false;
    }

    /// ❌ SHOW ERROR (NO CRASH)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Something went wrong")),
    );

    debugPrint("UPLOAD ERROR: $e");
  }
}
Future<Map<String, dynamic>?> parseResumeAndFill() async {
  try {
    debugPrint("Starting resume parsing...");

    /// 📂 PICK FILE
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null) return null;

    final file = result.files.single;

    if (file.path == null) return null;

    /// 🔥 DIRECT DIO (same as profile)
    final dio = Dio(
      BaseOptions(
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      ),
    );

    final formData = FormData.fromMap({
      'resume': await MultipartFile.fromFile(
        file.path!,
        filename: file.name, // 🔥 IMPORTANT
      ),
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
        validateStatus: (status) => true, // 🔥 prevents crash
      ),
    );

    debugPrint("STATUS: ${response.statusCode}");
    debugPrint("DATA: ${response.data}");

    /// ❌ HANDLE FAILURE (NO CRASH)
    if (response.statusCode != 200 ||
        response.data == null ||
        response.data['success'] == false) {
      debugPrint("UPLOAD FAILED: ${response.data}");
      return null;
    }

    /// ✅ SUCCESS
    final data = response.data["data"] ?? response.data;

    return data;

  } catch (e, s) {
    debugPrint("RESUME ERROR: $e");
    debugPrint("STACK: $s");
    return null;
  }
}
  /// 📄 UPLOAD BOX
  Widget _uploadBox(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.kGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.upload, color: AppColors.kGreen),
          ),

          const SizedBox(height: 12),

          const Text(
            "Drop your resume here",
            style: TextStyle(color: Colors.white),
          ),

          const SizedBox(height: 4),

          const Text(
            "PDF • Max 5MB",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),

          const SizedBox(height: 12),

          /// 🔥 BUTTON CONNECTED
          OutlinedButton(
            onPressed: () => _handleUpload(context),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.kBorder),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Browse Files"),
          ),
        ],
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