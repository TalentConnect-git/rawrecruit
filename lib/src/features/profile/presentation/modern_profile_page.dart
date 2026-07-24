import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/jobs/utils/enums.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show MyProfileViewModel;
import 'package:rawrecruit/src/features/profile/presentation/support_page.dart';
import 'package:rawrecruit/src/features/profile/presentation/add_edit_profile_view.dart';
import 'package:rawrecruit/src/features/profile/presentation/edit_profile_sections_page.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/widgets/profile_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/models/education.dart';
import '../../../core/models/experience.dart';
import '../../scheduled_interviews/presentation/view_model/scheduled_interview_view_model.dart'
    show InterviewViewModel;
import 'career_insight_page.dart';
import 'resume_view_page.dart';

class ModernProfilePage extends StatefulWidget {
  const ModernProfilePage({super.key});

  @override
  State<ModernProfilePage> createState() => _ModernProfilePageState();
}

class _ModernProfilePageState extends State<ModernProfilePage> {
  final MyProfileViewModel vm = MyProfileViewModel();
  final InterviewViewModel interviewVm = InterviewViewModel();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appState = getIt<AppStateProvider>();

      /// 🔥 First get user (important)
      final userResult = await vm.getUser();

      /// 🔥 Then call correct API based on user type
      final results = await Future.wait([
        vm.getCareerInsights(),
        if (appState.isProfessional)
          vm.getReferralMetrics()
        else ...[
          vm.getCandidateStats(),
          interviewVm.getInterviews(),
        ],
      ]);

      if (mounted) {
        userResult?.showError(context);
        results[0]?.showError(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Scaffold(
        backgroundColor: AppColors.kBg,
        body: SafeArea(
          child: Consumer<MyProfileViewModel>(
            builder: (_, vm, __) {
              if (vm.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final p = vm.user;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    /// 🔹 HEADER
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         InkWell(
                    //           onTap: context.pop,
                    //           child: const Icon(
                    //             Icons.arrow_back,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //         const SizedBox(width: 12),
                    //         const Text(
                    //           "Profile",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     const Icon(Icons.settings, color: Colors.grey),
                    //   ],
                    // ),
                    const SizedBox(height: 20),

                    /// 🔥 PROFILE CARD
                    _topProfileSection(p),

                    const SizedBox(height: 16),

                    /// 🔥 STATS GRID
                    _statsGrid(vm),

                    const SizedBox(height: 16),
                    if (!getIt<AppStateProvider>().isProfessional)
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),

                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: AppColors.kCard,

                          borderRadius: BorderRadius.circular(16),

                          border: Border.all(
                            color: AppColors.kGreen.withOpacity(.2),
                          ),
                        ),

                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  const Text(
                                    "Switch to Professional",

                                    style: TextStyle(
                                      color: Colors.white,

                                      fontWeight: FontWeight.bold,

                                      fontSize: 15,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    "Add experience & unlock professional profile",

                                    style: TextStyle(
                                      color: Colors.grey[400],

                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Switch(
                              value: false,

                              activeColor: AppColors.kGreen,

                              onChanged: (value) {
                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (_) => AddEditProfileView(
                                      user: vm.user,

                                      initialStep: 4,

                                      isSwitchingToProfessional: true,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                    /// 🔥 MENU LIST
                    _menuItem(
                      "Edit Profile",
                      Icons.edit,
                      onTap: () async {
                        final result = await Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                                EditProfileSectionsPage(user: vm.user!),
                          ),
                        );

                        if (result == true) {
                          /// 🔥 CALL onboarding/me AGAIN
                          final failure = await getIt<AppStateProvider>()
                              .getUserDetails();

                          /// 🔥 UPDATE LOCAL VM
                          vm.user = getIt<AppStateProvider>().user;

                          if (mounted) {
                            setState(() {});

                            failure?.showError(context);
                          }
                        }
                      },
                    ),
                    if (getIt<AppStateProvider>().isProfessional) ...[
                      _menuItem(
                        "My Posted Jobs",
                        Icons.work,
                        onTap: () {
                          context.pushNamed(
                            RouteNames.application,
                            extra: {
                              'userType': UserType.professional,
                              'jobType': ProfessionalJobType.posted,
                            },
                          );
                        },
                      ),

                      _menuItem(
                        "Referrals",
                        Icons.share,
                        onTap: () {
                          context.pushNamed(
                            RouteNames.referrer,
                            extra: {'userType': UserType.professional},
                          );
                        },
                      ),
                    ],

                    _menuItem(
                      "Alumni Network",
                      Icons.group,
                      onTap: () {
                        context.pushNamed(RouteNames.shortlist);
                      },
                    ),
                    _menuItem(
                      "Career Insights",
                      Icons.trending_up,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CareerInsightsPage(),
                          ),
                        );
                      },
                    ),
                    _menuItem(
                      "Support",
                      Icons.trending_up,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SupportPage(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    /// 🔥 SIGN OUT
                    _signOut(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// 🔥 TOP SECTION (CONNECTED TO BACKEND)
  Widget _topProfileSection(User? p) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [
            const Color(0xFF111827),
            const Color(0xFF0B1220),
            AppColors.kCard,
          ],
        ),

        border: Border.all(color: AppColors.kGreen.withOpacity(.15)),

        boxShadow: [
          BoxShadow(
            color: AppColors.kGreen.withOpacity(.02),
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),

      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(22),

            child: Column(
              children: [
                /// PROFILE IMAGE
                Container(
                  padding: const EdgeInsets.all(3),

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    // border: Border.all(
                    //   color: AppColors.kGreen,
                    //   width: 2,
                    // ),
                  ),

                  child: SizedBox(
                    height: 78,
                    width: 78,

                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ProfileImage(
                          imagePath: p?.profileImage ?? '',
                          onImageSelected: (image) async {
                            final failure = await vm.updateProfileImage(image);

                            if (failure != null && context.mounted) {
                              failure.showError(context);
                            }
                          },
                        ),

                        if (vm.isUploadingProfileImage)
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.4),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// NAME + VERIFIED
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddEditProfileView(
                                user: vm.user,
                                initialStep: 0, // Basic section
                              ),
                            ),
                          );

                          if (result == true) {
                            await vm.getUser();
                          }
                        },
                        child: Text(
                          p?.name ?? "-",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),

                    if (p?.emailVerified ?? false) ...[
                      const SizedBox(width: 6),

                      const Icon(Icons.verified, color: Colors.blue, size: 20),
                    ],
                  ],
                ),

                const SizedBox(height: 12),

                /// COMPANY / ROLE
                Builder(
                  builder: (_) {
                    Experience? currentExp;

                    if (p?.experiences?.isNotEmpty ?? false) {
                      for (final e in p!.experiences!) {
                        if (e.isCurrent == true) {
                          currentExp = e;
                          break;
                        }
                      }
                    }

                    String displayText = "";

                    if (currentExp != null) {
                      final company = (p?.currentCompany ?? '').trim();
                      final role = currentExp.role?.trim() ?? '';

                      displayText = company.isNotEmpty
                          ? (role.isNotEmpty ? '$company • $role' : company)
                          : role;
                    } else {
                      final status = p?.status?.type?.trim() ?? '';

                      if (status.isNotEmpty) {
                        displayText = status
                            .replaceAll('_', ' ')
                            .split(' ')
                            .map(
                              (e) => e.isEmpty
                                  ? e
                                  : '${e[0].toUpperCase()}${e.substring(1).toLowerCase()}',
                            )
                            .join(' ');
                      }
                    }

                    if (displayText.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddEditProfileView(
                                  user: vm.user,
                                  initialStep: 3, // Experience section
                                ),
                              ),
                            );

                            if (result == true) {
                              await vm.getUser();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.05),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white.withOpacity(.06),
                              ),
                            ),
                            child: Text(
                              displayText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 10),

                /// LOCATION
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddEditProfileView(
                          user: vm.user,
                          initialStep: 6, // Employee Preferences
                        ),
                      ),
                    );

                    if (result == true) {
                      await vm.getUser();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey[400],
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          p?.locations?.join(', ') ?? '-',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if ((p?.educations?.isNotEmpty ?? false)) ...[
                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddEditProfileView(
                            user: vm.user,
                            initialStep: 14, // Education
                          ),
                        ),
                      );

                      if (result == true) {
                        await vm.getUser();
                      }
                    },
                    child: Text(
                      '🎓 ${(() {
                        final education = p?.educations?.firstWhere((e) => e.isCurrent == true, orElse: () => p.educations?.isNotEmpty == true ? p.educations!.first : Education());

                        return education?.college ?? '-';
                      })()}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                  ),
                ],
                const SizedBox(height: 20),

                /// VIEW RESUME
                if ((p?.resume ?? '').isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      final url = p!.resume!;

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) => ResumeViewerPage(url: url),
                        ),
                      );
                    },

                    child: Container(
                      width: double.infinity,

                      padding: const EdgeInsets.symmetric(vertical: 14),

                      decoration: BoxDecoration(
                        color: AppColors.kGreen,

                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kGreen.withOpacity(.25),

                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),

                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Icon(Icons.download, color: Colors.black, size: 18),

                          SizedBox(width: 8),

                          Text(
                            "View Resume",

                            style: TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.bold,

                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                /// SOCIALS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    if ((p?.github ?? '').isNotEmpty)
                      _socialBox('assets/images/github.png', () async {
                        final raw = p?.github ?? '';

                        final formatted = raw.startsWith('http')
                            ? raw
                            : 'https://$raw';

                        await launchUrl(
                          Uri.parse(formatted),

                          mode: LaunchMode.platformDefault,
                        );
                      }),

                    if ((p?.linkedin ?? '').isNotEmpty)
                      _socialBox('assets/images/linkedin.png', () async {
                        final raw = p?.linkedin ?? '';

                        final formatted = raw.startsWith('http')
                            ? raw
                            : 'https://$raw';

                        await launchUrl(
                          Uri.parse(formatted),

                          mode: LaunchMode.platformDefault,
                        );
                      }),

                    if ((p?.portfolio ?? '').isNotEmpty)
                      _socialBox('assets/images/portfolio.png', () async {
                        final raw = p?.portfolio ?? '';

                        final formatted = raw.startsWith('http')
                            ? raw
                            : 'https://$raw';

                        await launchUrl(
                          Uri.parse(formatted),

                          mode: LaunchMode.platformDefault,
                        );
                      }),

                    // if ((p?.resume ?? '')
                    //     .isNotEmpty)
                    //   _socialBox(
                    //     'assets/images/cv.png',
                    //     () async {
                    //       final raw =
                    //           p?.resume ?? '';

                    //       final formatted =
                    //           raw.startsWith(
                    //                 'http',
                    //               )
                    //               ? raw
                    //               : 'https://$raw';

                    //       await launchUrl(
                    //         Uri.parse(
                    //           formatted,
                    //         ),

                    //         mode: LaunchMode
                    //             .externalApplication,
                    //       );
                    //     },
                    //   ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialBox(String asset, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),

        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),

          borderRadius: BorderRadius.circular(14),

          border: Border.all(color: Colors.white.withOpacity(.06)),
        ),

        child: Image.asset(asset, height: 20, width: 20),
      ),
    );
  }

  Widget _statsGrid(MyProfileViewModel vm) {
    final appState = getIt<AppStateProvider>();

    final stats = appState.isProfessional
        ? [
            ["${vm.referralSuccessRate}%", "Referral Success"],
            ["${vm.responseRate}%", "Response Rate"],
            ["${vm.totalReferrals}", "Referrals Posted"],
            ["${vm.referredToCompany}", "Referred"],
            ["${vm.totalApplications}", "Applications"],
            ["${vm.acceptedByCompany}", "Accepted"],
          ]
        : [
            ["${vm.savedJobs}", "Saved Jobs"],
            ["${vm.totalApps}", "Applications"],
            ["${vm.referralApps}", "Referral Apps"],
            ["${vm.resumeScore}%", "Resume Score"],
            ["${vm.hiringScore}%", "Hiring Score"],
            ["${interviewVm.interviews.length}", "Interviews"],
          ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // ✅ SAME UI
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (_, i) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.kCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.kBorder),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stats[i][0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stats[i][1],
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
        );
      },
    );
  }

  /// 🔥 SKILLS (CONNECTED)
  // Widget _skillsImpactSection(p) {
  //   final skills = p?.skills ?? [];

  //   return Container(
  //     width: double.infinity,
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: AppColors.kCard,
  //       borderRadius: BorderRadius.circular(16),
  //       border: Border.all(color: AppColors.kBorder),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "Skills & Impact",
  //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //         ),
  //         const SizedBox(height: 12),

  //         /// 🔥 dynamic + fallback static
  //         if (skills.isNotEmpty)
  //           ...skills.map((s) => _skillRow(s, "Added", AppColors.kGreen))
  //         else ...[
  //           _skillRow("React", "High Demand", Colors.green),
  //           _skillRow("TypeScript", "High Demand", Colors.green),
  //         ],
  //       ],
  //     ),
  //   );
  // }

  // Widget _skillRow(String skill, String tag, Color color) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 6),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(skill, style: const TextStyle(color: Colors.white)),
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  //           decoration: BoxDecoration(
  //             color: color.withOpacity(0.15),
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: Text(tag, style: TextStyle(color: color, fontSize: 11)),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _iconBox(IconData icon) {
  //   return Container(
  //     padding: const EdgeInsets.all(8),
  //     decoration: BoxDecoration(
  //       color: Colors.white.withOpacity(0.05),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Icon(icon, color: Colors.grey, size: 18),
  //   );
  // }

  Widget _menuItem(String title, IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.kBorder),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.kGreen),
            const SizedBox(width: 12),
            Expanded(
              child: Text(title, style: const TextStyle(color: Colors.white)),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _signOut() {
    return Center(
      child: TextButton(
        onPressed: () async {
          final failure = await getIt<AppStateProvider>().logout();
          Toasts.showSuccessOrFailureToast(
            context,
            failure: failure,
            popOnSuccess: false,
            successMsg: 'Logout Successful!',
            successCallback: () {
              context.goNamed(RouteNames.login);
            },
          );
        },
        child: Text(
          "Sign Out",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
