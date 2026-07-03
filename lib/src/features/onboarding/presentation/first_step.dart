import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show AppHeader, OnboardingLocalService;
import 'package:rawrecruit/src/features/onboarding/presentation/view_model/first_step_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/index.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({
    this.isLogging = false,
    this.isLinkedinLogging = false,
    super.key,
  });

  final bool isLogging;
  final bool isLinkedinLogging;

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final FirstStepViewModel firstStepViewModel = FirstStepViewModel();

  int selectedIndex = 0;
  UserType _mapIndexToUserType(int index) {
    switch (index) {
      case 0:
        return UserType.student;
      case 1:
        return UserType.fresher;
      case 2:
        return UserType.professional;
      default:
        return UserType.student;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: firstStepViewModel,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// HEADER
                      AppHeader(
                        title: "How do you want to",
                        highlight: "use Referd?",
                        //  onBack: () => {},
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Choose your primary goal — you can always switch later",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),

                      const SizedBox(height: 24),

                      /// CARD 1
                      _optionCard(
                        index: 0,
                        icon: Icons.school,
                        title: "Student",
                        subtitle:
                            "Currently studying & exploring opportunities",
                      ),
                      SizedBox(height: 15),

                      _optionCard(
                        index: 1,
                        icon: Icons.person_outline,
                        title: "Fresher",
                        subtitle: "Recently graduated, looking for first job",
                      ),
                      SizedBox(height: 15),
                      _optionCard(
                        index: 2,
                        icon: Icons.work,
                        title: "Professional",
                        subtitle: "Working professional seeking growth",
                      ),
                      const SizedBox(height: 16),

                      // /// FOOTER TEXT
                      // Row(
                      //   children: const [
                      //     Icon(Icons.people, color: Colors.green, size: 16),
                      //     SizedBox(width: 6),
                      //     Text(
                      //       "12,400+ professionals joined this month",
                      //       style: TextStyle(color: Colors.grey, fontSize: 12),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),

              /// CONTINUE BUTTON
              Selector<FirstStepViewModel, bool>(
                selector: (_, vm) => vm.isLoading,
                builder: (_, isLoading, _) => isLoading
                    ? AppLoadingIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.kGreen,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              final userType = _mapIndexToUserType(
                                selectedIndex,
                              );

                              if (widget.isLogging) {
                                Failure? failure;
                                if (widget.isLinkedinLogging) {
                                  failure = await firstStepViewModel
                                      .linkedInLogin(userType: userType);
                                } else {
                                  failure = await firstStepViewModel.google(
                                    userType: userType,
                                  );
                                }
                                Toasts.showSuccessOrFailureToast(
                                  context,
                                  failure: failure,
                                  successMsg: 'Logged in Successful!',
                                  popOnSuccess: false,
                                  successCallback: () async {
                                    await getIt<AppStateProvider>()
                                        .getUserDetails();

                                    final onboardingService =
                                        getIt<OnboardingLocalService>();

                                    await onboardingService.clear();

                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setBool(
                                      'onboarding_completed',
                                      false,
                                    );
                                    if (getIt<AppStateProvider>()
                                        .isProfileComplete) {
                                      context.pushReplacementNamed(
                                        RouteNames.dashboard,
                                        extra: {
                                          'userType': getIt<AppStateProvider>()
                                              .userType,
                                        },
                                      );
                                    } else {
                                      context.pushReplacementNamed(
                                        RouteNames.onboarding,
                                      );
                                    }
                                  },
                                );
                              } else {
                                getIt<AppStateProvider>().selectedUserType =
                                    userType;

                                /// 👉 GO TO REGISTER
                                context.pushNamed(RouteNames.register);
                              }
                            },
                            child: const Text(
                              "Continue >",
                              style: TextStyle(color: Colors.black),
                            ),
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

  /// 🔥 OPTION CARD
  Widget _optionCard({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
    String? badge,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.kGreen : AppColors.kBorder,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            /// ICON
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.kGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.kGreen, size: 20),
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kGreen.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              color: AppColors.kGreen,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),

            /// CHECK ICON
            if (isSelected) Icon(Icons.check_circle, color: AppColors.kGreen),
          ],
        ),
      ),
    );
  }
}
