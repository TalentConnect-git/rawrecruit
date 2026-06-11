import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show Wrapper, AppHeader;

class OnboardingCompletePage extends StatefulWidget {
  final VoidCallback onBack;
  final Future<void> Function() onSubmit; // 🔥 IMPORTANT

  const OnboardingCompletePage({
    super.key,
    required this.onBack,
    required this.onSubmit,
  });

  @override
  State<OnboardingCompletePage> createState() => _OnboardingCompletePageState();
}

class _OnboardingCompletePageState extends State<OnboardingCompletePage> {
  bool isLoading = false;

  Future<void> handleSubmit() async {
    setState(() => isLoading = true);

    try {
      await widget.onSubmit();
    } catch (e) {
      debugPrint(e.toString());
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Complete",
      children: [
        /// 🔙 HEADER
        AppHeader(title: "", highlight: "", onBack: widget.onBack),

        const SizedBox(height: 20),

        /// 🎉 ICON
        Center(
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.kGreen.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.auto_awesome, color: AppColors.kGreen, size: 28),
          ),
        ),

        const SizedBox(height: 20),

        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              children: [
                const TextSpan(
                  text: "You're Ready to\n",
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: "Grow Through Referrals",
                  style: TextStyle(color: AppColors.kGreen),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),

        /// SUBTITLE
        const Center(
          child: Text(
            "Your profile is now live on Referd.\nOur AI is already finding:",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),

        const SizedBox(height: 24),

        /// 📊 CARD 1
        _infoCard(
          icon: Icons.people_outline,
          iconColor: Colors.green,
          title: "Find Alumni Who Can Refer You",
          subtitle:
              "Discover college and company alumni working at your dream organizations.",
        ),

        const SizedBox(height: 12),

        /// 📊 CARD 2
        _infoCard(
          icon: Icons.work_outline,
          iconColor: Colors.deepPurple,
          title: "Explore Referral Jobs",
          subtitle: "Apply directly to employee-posted referral opportunities.",
        ),
        const SizedBox(height: 12),

        _infoCard(
          icon: Icons.notifications_none_rounded,
          iconColor: Colors.deepPurpleAccent,
          title: "Get Smart Referral Alerts",
          subtitle:
              "Receive notifications when a matching job or alumni connection becomes available.",
        ),
        const SizedBox(height: 12),

        /// ⚡ HIGHLIGHT STRIP
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.kCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.kGreen.withOpacity(0.4)),
          ),
          child: Row(
            children: const [
              Icon(Icons.flash_on, color: Colors.amber, size: 18),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Most successful referrals happen within the first 72 hours after profile completion.",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        /// 🔥 CTA BUTTON
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kGreen,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: isLoading ? null : handleSubmit,
            child: const Text(
              "👉 Go to Home  >",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  /// 🔥 REUSABLE INFO CARD
  Widget _infoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
