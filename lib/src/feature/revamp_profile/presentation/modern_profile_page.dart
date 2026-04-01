import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

import 'career_insight_page.dart';

class ModernProfilePage extends StatelessWidget {
  const ModernProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
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

              /// 🔥 NEW TOP SECTION (MATCHES SCREENSHOT)
              _topProfileSection(),

              const SizedBox(height: 20),

              /// 🔹 SKILLS & IMPACT
              _skillsImpactSection(),

              const SizedBox(height: 20),

              /// 🔹 MENU OPTIONS
_menuItem("Career Insights", onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const CareerInsightsPage(),
    ),
  );
}),              _menuItem("Edit Profile"),
              _menuItem("Resume Builder"),
              _menuItem("Help & Support"),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 COMPLETE TOP SECTION
  Widget _topProfileSection() {
    return Column(
      children: [
        /// USER CARD
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
                child: const Text(
                  "A",
                  style: TextStyle(
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
                  children: const [
                    Text(
                      "Aman",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "aman@email.com",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "+91 98765 43210",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),

              /// SOCIAL ICONS
              Row(
                children: [
                  _iconBox(Icons.business),
                  const SizedBox(width: 8),
                  _iconBox(Icons.code),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// HIRING SCORE
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
                  Text(
                    "Your Hiring Score",
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "72%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Top 30% of candidates",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),

              /// PROGRESS
              SizedBox(
                height: 60,
                width: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: 0.72,
                      strokeWidth: 6,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green,
                      ),
                    ),
                    const Text(
                      "72%",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// STATS
        Row(
          children: [
            Expanded(child: _statBox("85%", "Resume Score")),
            SizedBox(width: 10),
            Expanded(child: _statBox("3", "Referrals")),
            SizedBox(width: 10),
            Expanded(child: _statBox("12", "Applications")),
          ],
        ),
      ],
    );
  }

  /// 🔹 ICON BOX
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

  /// 🔹 STAT BOX
  static Widget _statBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }

  /// 🔥 SKILLS SECTION
  Widget _skillsImpactSection() {
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
          _skillRow("React", "High Demand", Colors.green),
          _skillRow("TypeScript", "High Demand", Colors.green),
          _skillRow("Node.js", "Growing", Colors.blue),
          _skillRow("GraphQL", "Missing", Colors.red),
          _skillRow("System Design", "Missing", Colors.red),
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
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
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
}}