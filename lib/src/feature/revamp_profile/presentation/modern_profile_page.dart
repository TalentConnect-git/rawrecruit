import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../../revamp_onboarding/presentation/index.dart';
import 'career_insight_page.dart';

class ModernProfilePage extends StatefulWidget {
  const ModernProfilePage({super.key});

  @override
  State<ModernProfilePage> createState() => _ModernProfilePageState();
}

class _ModernProfilePageState extends State<ModernProfilePage> {
  final MyProfileViewModel vm = MyProfileViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final results = await Future.wait([vm.getUser(), vm.getCareerInsights()]);

      if (mounted) {
        results[0]?.showError(context);
        results[1]?.showError(context);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: context.pop,
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.settings, color: Colors.grey),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔥 PROFILE CARD
                    _topProfileSection(p),

                    const SizedBox(height: 16),

                    /// 🔥 STATS GRID
                    _statsGrid(),

                    const SizedBox(height: 16),

                    /// 🔥 MENU LIST
                    _menuItem(
                      "Edit Profile",
                      Icons.edit,
                      onTap: () async {
                        final result = await context.pushNamed(
                          RouteNames.addEditProfileView,
                          extra: vm.user,
                        );

                        if (result == true) {
                          final failure = await vm.getUser();
                          if (mounted) failure?.showError(context);
                        }
                      },
                    ),
                    _menuItem(
  "My Posted Jobs",
  Icons.work,
  onTap: () {
    context.goNamed(
      RouteNames.application,
      extra: UserType.professional,
    );
  },
),

_menuItem(
  "Referrals",
  Icons.share,
  onTap: () {
    context.goNamed(
      RouteNames.referrer,
      extra: UserType.professional,
    );
  },
),

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
                    _menuItem("Notifications", Icons.notifications),

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
  Widget _topProfileSection(p) {
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
          /// Avatar
          CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.kGreen,
            child: Text(
              (p?.name?.isNotEmpty ?? false) ? p.name![0].toUpperCase() : "A",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
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

          const SizedBox(height: 4),

          /// Role (you can map from backend later)
          Text(
            "Senior Frontend Engineer",
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),

          const SizedBox(height: 2),

          /// Location
          Text(
            "Bangalore, India",
            style: TextStyle(color: Colors.grey[500], fontSize: 11),
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

          /// Profile completion
          Text(
            "95% profile complete",
            style: TextStyle(color: AppColors.kGreen, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _statsGrid() {
    final stats = [
      ["78%", "Referral Success"],
      ["94%", "Response Rate"],
      ["5", "Jobs Posted"],
      ["23", "Referred"],
      ["3", "Applications"],
      ["156", "Alumni"],
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
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
