import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  Widget _contactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    final isDark = ThemeController.instance.isDark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? AppColors.kBorder : const Color(0xFFE5E7EB),
          ),
          boxShadow: isDark
              ? []
              : [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.kGreen.withOpacity(isDark ? .12 : .1),
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
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppColors.secText, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.secText,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeController.instance,
      builder: (context, _) {
        final isDark = ThemeController.instance.isDark;

        return Scaffold(
          backgroundColor: AppColors.kBg,
          appBar: AppBar(
            backgroundColor: AppColors.kCard,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.text),
            title: Text(
              "Support",
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w600,
              ),
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
                    color: AppColors.kCard,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: isDark
                          ? AppColors.kBorder
                          : const Color(0xFFE5E7EB),
                    ),
                    boxShadow: isDark
                        ? []
                        : [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppColors.kGreen.withOpacity(
                            isDark ? .12 : .1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.support_agent_rounded,
                          color: AppColors.kGreen,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "We’re Here To Help",
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Reach out to us anytime through email or our social platforms.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.secText, height: 1.5),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  "Reach Out",
                  style: TextStyle(
                    color: AppColors.text,
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

                Text(
                  "Social Media",
                  style: TextStyle(
                    color: AppColors.text,
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
                            mode: LaunchMode.platformDefault,
                          );
                        },
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: AppColors.kCard,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: isDark
                                  ? AppColors.kBorder
                                  : const Color(0xFFE5E7EB),
                            ),
                            boxShadow: isDark
                                ? []
                                : [
                                    BoxShadow(
                                      color: AppColors.shadow,
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
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
                              Text(
                                "Instagram",
                                style: TextStyle(
                                  color: AppColors.text,
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
                            mode: LaunchMode.platformDefault,
                          );
                        },
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: AppColors.kCard,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: isDark
                                  ? AppColors.kBorder
                                  : const Color(0xFFE5E7EB),
                            ),
                            boxShadow: isDark
                                ? []
                                : [
                                    BoxShadow(
                                      color: AppColors.shadow,
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/linkedin.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "LinkedIn",
                                style: TextStyle(
                                  color: AppColors.text,
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
                    color: AppColors.kCard,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: isDark
                          ? AppColors.kBorder
                          : const Color(0xFFE5E7EB),
                    ),
                    boxShadow: isDark
                        ? []
                        : [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Referd",
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Text(
                        "A complete platform for campus hiring, internships, and fresher job opportunities across India.",
                        style: TextStyle(color: AppColors.secText, height: 1.6),
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
                            mode: LaunchMode.platformDefault,
                          );
                        },
                      ),

                      _contactTile(
                        icon: Icons.work_outline_rounded,
                        title: "Career build platform",
                        subtitle:
                            "Streamline recruitment, track candidates, schedule interviews, and manage the complete hiring process efficiently.",
                        onTap: () {
                          launchUrl(
                            Uri.parse('https://careerkrafter.in/'),
                            mode: LaunchMode.platformDefault,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.kCard,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isDark
                          ? AppColors.kBorder
                          : const Color(0xFFE5E7EB),
                    ),
                    boxShadow: isDark
                        ? []
                        : [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: AppColors.kGreen,
                        size: 30,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Support Hours",
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Monday - Saturday 9:00 AM to 7:00 PM",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.secText, height: 1.6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
