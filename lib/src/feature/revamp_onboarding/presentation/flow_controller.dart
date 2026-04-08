import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/data/data_source/revamp_on_boarding_data_source_impl.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/data/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/steps/education_info.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/steps/resume_upload_page.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/progress_bar.dart';

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

  /// 🔥 SHARED DATA
  final User data = User();

  /// 🔥 REPO
  final repo = RevampOnboardingRepositoryImpl(
    onboardingDataSource: RevampOnboardingDataSourceImpl(),
  );

  /// 👉 NEXT
  void nextPage() {
    if (currentPage < totalPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// 👉 BACK
  void onBack() {
    if (currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  /// 🚀 FINAL SUBMIT
  Future<void> submitOnboarding() async {
    try {
      final body = data.toJson();

      final result = await repo.submitOnboardingUser(body: body);

      result.fold(
        (failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(failure.message ?? '')));
        },
        (profile) {
          context.pushReplacementNamed(
            RouteNames.dashboard,
            extra: getIt<AppStateProvider>().userType,
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔥 PROGRESS BAR
            ProgressBar(currentPage: currentPage, total: totalPages),

            /// 🔥 PAGES
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => currentPage = i),
                children: [
                  /// (skip resume for now or keep simple)
                  ResumeUploadPage(),

                  /// 🔥 ALL PAGES CONNECTED TO DATA
                  BasicPage(onBack: onBack, data: data),
                  EducationPage(onBack: onBack, data: data),
                  LinksPage(onBack: onBack, data: data),
                  CareerPage(onBack: onBack, data: data),
                  SkillsDomainPage(onBack: onBack, data: data),
                  WorkPrefPage(onBack: onBack, data: data),
                  AchievementsPage(onBack: onBack, data: data),

                  /// 🔥 FINAL PAGE
                  OnboardingCompletePage(
                    onBack: onBack,
                    onSubmit: submitOnboarding,
                  ),
                ],
              ),
            ),

            /// 🔥 CONTINUE BUTTON
            if (currentPage != totalPages - 1) ContinueButton(onTap: nextPage),
          ],
        ),
      ),
    );
  }
}
