import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  Widget _contactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kTile,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.kCard,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.kGreen),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBg,
      appBar: AppBar(
        backgroundColor: AppColors.kCard,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Support",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.kTile,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.kCard,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.support_agent_rounded,
                      color: AppColors.kGreen,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    "We’re Here To Help",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Reach out to us anytime through email or our social platforms.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade400, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Reach Out",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'support@rawrecruit.in',
                );

                await launchUrl(emailUri);
              },
              child: _contactTile(
                icon: Icons.email_outlined,
                title: "Email Support",
                subtitle: "support@rawrecruit.in",
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Social Media",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final uri = Uri.parse(
                        "https://www.instagram.com/referd.d/",
                      );

                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: AppColors.kTile,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),

                            child: Image.asset(
                              'assets/images/insta.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Instagram",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final uri = Uri.parse(
                        "https://www.linkedin.com/company/referd-rawrecruit/",
                      );

                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: AppColors.kTile,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),

                            child: Image.asset(
                              'assets/images/linked.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "LinkedIn",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.kTile,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About RawRecruit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    "A complete platform for campus hiring, internships, and fresher job opportunities across India.",
                    style: TextStyle(color: Colors.grey.shade300, height: 1.6),
                  ),

                  const SizedBox(height: 20),

                  _contactTile(
                    icon: Icons.school_outlined,
                    title: "Campus Hiring Platform",
                    subtitle:
                        "Built for companies, colleges, and students through one unified recruitment system.",
                    onTap: () {
                      launchUrl(
                        Uri.parse('https://rawrecruit.in/'),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),

                  _contactTile(
                    icon: Icons.groups_outlined,
                    title: "Direct College Network",
                    subtitle:
                        "Access verified colleges and fresher candidates without middle layers.",
                  ),

                  _contactTile(
                    icon: Icons.workspaces_outline,
                    title: "Structured Hiring Pipeline",
                    subtitle:
                        "Manage job applications, interviews, shortlisting, and hiring workflows from one place.",
                  ),

                  _contactTile(
                    icon: Icons.work_outline_rounded,
                    title: "Career build platform",
                    subtitle:
                        "Streamline recruitment, track candidates, schedule interviews, and manage the complete hiring process efficiently.",
                    onTap: () {
                      launchUrl(
                        Uri.parse('https://careerkrafter.in/'),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),

                  _contactTile(
                    icon: Icons.workspace_premium_outlined,
                    title: "Built for Freshers",
                    subtitle:
                        "Focused completely on internships, fresher hiring, and campus job opportunities.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.kTile,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: AppColors.kGreen,
                    size: 30,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Support Hours",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Monday - Saturday 9:00 AM to 7:00 PM",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade400, height: 1.6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
