import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/steps/education_info.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/steps/resume_upload_page.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/progress_bar.dart';
import 'first_step.dart';
import 'steps/onboarding_complete_page.dart';
import 'widgets/continue_button.dart';
import 'index.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final int totalPages = 9;

  /// 👉 NEXT
  void nextPage() {
    if (currentPage < totalPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// 👉 BACK (IMPORTANT FIX)
  void onBack() {
    if (currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // optional: exit onboarding
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔥 PROGRESS
            ProgressBar(currentPage: currentPage, total: totalPages),

            /// 🔥 PAGES
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => currentPage = i),
                children: [
                  ResumeUploadPage(),

                  BasicPage(onBack: onBack),
                  EducationPage(onBack: onBack),
                  LinksPage(onBack: onBack),
                  CareerPage(onBack: onBack),
                  SkillsDomainPage(onBack: onBack),
                  WorkPrefPage(onBack: onBack),
                  AchievementsPage(onBack: onBack),
                  OnboardingCompletePage(onBack: onBack),
                ],
              ),
            ),

            /// 🔥 BUTTON
            if (currentPage != totalPages - 1) ContinueButton(onTap: nextPage),
          ],
        ),
      ),
    );
  }
}
