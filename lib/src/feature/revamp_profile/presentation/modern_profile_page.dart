import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_jobs/utils/enums.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/edit_profile_sections_page.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/widgets/profile_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../features/scheduled_interviews/presentation/view_model/scheduled_interview_view_model.dart'
    show InterviewViewModel;
import '../../revamp_onboarding/presentation/index.dart';
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
        backgroundColor: Colors.black,
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

                    /// 🔥 MENU LIST
                    _menuItem(
                      "Edit Profile",
                      Icons.edit,
                      onTap: () async {
                        final result = await Navigator.push(
  context,

  MaterialPageRoute(
    builder: (_) =>
        EditProfileSectionsPage(
          user: vm.user!,
        ),
  ),
);

                        if (result == true) {
                          final failure = await vm.getUser();
                          if (mounted) failure?.showError(context);
                        }
                      },
                    ),
                    if (getIt<AppStateProvider>().isProfessional) ...[
                      _menuItem(
                        "My Posted Jobs",
                        Icons.work,
                        onTap: () {
                          context.goNamed(
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
                          context.goNamed(
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
                        context.goNamed(RouteNames.shortlist);
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
                      "Notifications",
                      Icons.notifications,
                      onTap: () {
                        context.pushNamed(RouteNames.notification);
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.kBorder),
      ),
child: Column(
  children: [
    Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// GITHUB
          if ((p?.github ?? '').isNotEmpty)
            GestureDetector(
              onTap: () async {
  final raw = p?.github ?? '';

  if (raw.isEmpty) return;

  final formattedUrl = raw.startsWith('http://') ||
          raw.startsWith('https://')
      ? raw
      : 'https://$raw';

  await launchUrl(
    Uri.parse(formattedUrl),
    mode: LaunchMode.externalApplication,
  );
},
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image.asset(
                  'assets/images/github.png',
                  height: 20,
                  width: 20,
                ),
              ),
            ),

          /// LINKEDIN
          if ((p?.linkedin ?? '').isNotEmpty)
            GestureDetector(
             onTap: () async {
  final raw = p?.linkedin ?? '';

  if (raw.isEmpty) return;

  final formattedUrl = raw.startsWith('http://') ||
          raw.startsWith('https://')
      ? raw
      : 'https://$raw';

  await launchUrl(
    Uri.parse(formattedUrl),
    mode: LaunchMode.externalApplication,
  );
},
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image.asset(
                  'assets/images/linkedin.png',
                  height: 20,
                  width: 20,
                ),
              ),
            ),

          /// PORTFOLIO
          if ((p?.portfolio ?? '').isNotEmpty)
            GestureDetector(
             onTap: () async {
  final raw = p?.portfolio ?? '';

  if (raw.isEmpty) return;

  final formattedUrl = raw.startsWith('http://') ||
          raw.startsWith('https://')
      ? raw
      : 'https://$raw';

  await launchUrl(
    Uri.parse(formattedUrl),
    mode: LaunchMode.externalApplication,
  );
},
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image.asset(
                  'assets/images/portfolio.png',
                  height: 20,
                  width: 20,
                ),
              ),
            ),

          /// RESUME
          if ((p?.resume ?? '').isNotEmpty)
            GestureDetector(
             onTap: () async {
  final raw = p?.resume ?? '';

  if (raw.isEmpty) return;

  final formattedUrl = raw.startsWith('http://') ||
          raw.startsWith('https://')
      ? raw
      : 'https://$raw';

  await launchUrl(
    Uri.parse(formattedUrl),
    mode: LaunchMode.externalApplication,
  );
},
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image.asset(
                  'assets/images/cv.png',
                  height: 20,
                  width: 20,
                ),
              ),
            ),
        ],
      ),
    ),
          /// Avatar
          SizedBox(
            height: 64,
            width: 64,
            child: ProfileImage(
              imagePath: p?.profileImage ?? '',
              onImageSelected: null,
            ),
          ),
          const SizedBox(height: 10),

          /// Name
          Text(
            p?.name ?? "-",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),
          if (getIt<AppStateProvider>().isProfessional)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: AppColors.white, width: 0.5),
                color: const Color(0xff222222),
              ),
              child: Text(
                p?.emailVerified ?? false
                    ? 'Verified'
                    : 'Unverified Professional',
                style: AppTextStyles.s12W400.copyWith(color: AppColors.white),
              ),
            ),
          const SizedBox(height: 12),

          /// 🔥 Resume Button
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.download, color: Colors.black, size: 16),
                    SizedBox(width: 6),
                    Text(
                      "View Resume",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 10),

          /// Role (you can map from backend later)
          /// Info Section
         Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [

    /// ROLE • COMPANY
    Text(
      getIt<AppStateProvider>().isProfessional
          ? '${p?.jobRoles?.firstOrNull ?? p?.designation ?? 'Role'} • ${p?.currentCompany ?? '-'}'
          : '${p?.degree ?? 'Student'} • ${p?.college ?? '-'}',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: 12,
      ),
    ),

    const SizedBox(height: 4),

    /// LOCATION
    Text(
      p?.locations?.join(', ') ?? '-',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey[500],
        fontSize: 11,
      ),
    ),

    const SizedBox(height: 4),

    /// COLLEGE
    if (getIt<AppStateProvider>().isProfessional)
      Text(
        'College: ${p?.college ?? '-'}',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 11,
        ),
      ),
  ],
),
          const SizedBox(height: 12),

          /// Skills Chips
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: (p?.skills ?? ["React", "Node.js"]).map<Widget>((s) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  s,
                  style: TextStyle(color: AppColors.kGreen, fontSize: 11),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 12),
        ],
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
  Widget _skillsImpactSection(p) {
    final skills = p?.skills ?? [];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Skills & Impact",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          /// 🔥 dynamic + fallback static
          if (skills.isNotEmpty)
            ...skills.map((s) => _skillRow(s, "Added", AppColors.kGreen))
          else ...[
            _skillRow("React", "High Demand", Colors.green),
            _skillRow("TypeScript", "High Demand", Colors.green),
          ],
        ],
      ),
    );
  }

  Widget _skillRow(String skill, String tag, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(skill, style: const TextStyle(color: Colors.white)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(tag, style: TextStyle(color: color, fontSize: 11)),
          ),
        ],
      ),
    );
  }

  Widget _iconBox(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.grey, size: 18),
    );
  }

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
