import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';
import '../widgets/input_widgets.dart';

class ResumeUploadPage extends StatelessWidget {

  const ResumeUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Resume",
      children: [
        /// 🔙 HEADER
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
        _uploadBox(),

        const SizedBox(height: 20),

        /// OR DIVIDER
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.kBorder)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("or", style: TextStyle(color: Colors.grey)),
            ),
            Expanded(child: Divider(color: AppColors.kBorder)),
          ],
        ),

        const SizedBox(height: 20),

        /// 🔗 LINKEDIN OPTION
        _linkedInCard(),

        const SizedBox(height: 20),

        /// ⚡ FOOTER INFO
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

        /// ⏭ SKIP
        Center(
          child: TextButton(
            onPressed: () {},
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

  /// 📄 UPLOAD UI
  Widget _uploadBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.kBorder,
          style: BorderStyle.solid, // dashed needs custom painter if needed
        ),
      ),
      child: Column(
        children: [
          /// ICON
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
            "PDF, DOC, DOCX • Max 5MB",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),

          const SizedBox(height: 12),

          /// BUTTON
          OutlinedButton(
            onPressed: () {},
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

  /// 🔗 LINKEDIN CARD
  Widget _linkedInCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.deepPurple),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Autofill from LinkedIn",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  "Import profile in one click",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios,
              color: Colors.grey, size: 14),
        ],
      ),
    );
  }
}