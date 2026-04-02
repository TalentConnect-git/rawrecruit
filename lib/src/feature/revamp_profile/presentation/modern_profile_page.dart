import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/view_model/my_profile_view_model.dart';

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
      final failure = await vm.getUserProfile();
      if (mounted) failure?.showError(context);
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

              final p = vm.userProfile;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// 🔹 HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.settings, color: Colors.grey),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔥 TOP SECTION (NOW DYNAMIC)
                    _topProfileSection(p),

                    const SizedBox(height: 20),

                    /// 🔹 SKILLS (DYNAMIC)
                    _skillsImpactSection(p),

                    const SizedBox(height: 20),

                    /// 🔹 MENU OPTIONS (UNCHANGED + EDIT FIXED)
                    _menuItem("Career Insights", onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CareerInsightsPage(),
                        ),
                      );
                    }),

                    _menuItem("Edit Profile", onTap: () async {
                      final result = await context.pushNamed(
                        RouteNames.addEditProfileView,
                        extra: vm.userProfile,
                      );

                      if (result == true) {
                        final failure = await vm.getUserProfile();
                        if (mounted) failure?.showError(context);
                      }
                    }),

                    _menuItem("Resume Builder"),
                    _menuItem("Help & Support"),

                    const SizedBox(height: 30),
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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.kCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.kBorder),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.kGreen.withOpacity(0.2),
                child: (p?.profileImage ?? '').isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                          p.profileImage!,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Text(
                        (p?.name?.isNotEmpty ?? false)
                            ? p.name![0].toUpperCase()
                            : "A",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(width: 12),

              /// USER INFO
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p?.name ?? "-",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      p?.email ?? "-",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      p?.phone ?? "-",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),

              /// SOCIAL ICONS (LINKED)
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final url = p?.linkedin;
                      if (url != null && url.isNotEmpty) {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }
                    },
                    child: _iconBox(Icons.link),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () async {
                      final url = p?.github;
                      if (url != null && url.isNotEmpty) {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }
                    },
                    child: _iconBox(Icons.code),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// 🔥 KEEP STATIC (NOT INTEGRATED YET)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.kCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.kBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Your Hiring Score", style: TextStyle(color: Colors.green)),
                  SizedBox(height: 8),
                  Text("72%", style: TextStyle(color: Colors.white, fontSize: 26)),
                  SizedBox(height: 4),
                  Text("Top 30%", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              const CircularProgressIndicator(value: 0.72),
            ],
          ),
        ),
      ],
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
            child: Text(
              tag,
              style: TextStyle(color: color, fontSize: 11),
            ),
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

  Widget _menuItem(String title, {VoidCallback? onTap}) {
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
            Expanded(
              child: Text(title,
                  style: const TextStyle(color: Colors.white)),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}