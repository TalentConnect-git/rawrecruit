import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart' show AppHeader;

import '../presentation/widgets/new_wrapper.dart';

/// Which set of "what's next" cards to show on the complete screen.
/// 🔁 If you already have a role/user-type enum, delete this and use yours.
enum ReferdUserType { professional, student }

class OnboardingCompletePage extends StatefulWidget {
  final VoidCallback onBack;
  final Future<void> Function() onSubmit;
  final ReferdUserType userType; // 🔥 drives the conditional sections

  const OnboardingCompletePage({
    super.key,
    required this.onBack,
    required this.onSubmit,
    required this.userType,
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
    if (mounted) setState(() => isLoading = false);
  }

  /// 🔥 All the copy lives here — edit text/icons per type, layout untouched.
  List<_ReadyCard> get _cards => switch (widget.userType) {
    ReferdUserType.professional => const [
      _ReadyCard(
        icon: Icons.card_giftcard_outlined,
        iconColor: Colors.green,
        title: "Post Referral Jobs & Earn Bonuses",
        subtitle:
            "Post open roles at your company and earn a bonus for every successful hire.",
      ),
      _ReadyCard(
        icon: Icons.people_outline,
        iconColor: Colors.deepPurple,
        title: "Find Alumni Who Can Refer You",
        subtitle:
            "Looking for your next move? Discover alumni at companies you're targeting.",
      ),
      _ReadyCard(
        icon: Icons.verified_user_outlined,
        iconColor: Colors.deepPurpleAccent,
        title: "Refer with Confidence",
        subtitle:
            "Every candidate is vetted by Referd's expert interview first — never vouch blind.",
      ),
    ],
    ReferdUserType.student => const [
      _ReadyCard(
        icon: Icons.people_outline,
        iconColor: Colors.green,
        title: "Find Alumni Who Can Refer You",
        subtitle:
            "Discover college and company alumni working at your dream organizations.",
      ),
      _ReadyCard(
        icon: Icons.work_outline,
        iconColor: Colors.deepPurple,
        title: "Browse Referral Jobs",
        subtitle:
            "Apply directly to jobs posted by professionals — no cold applications.",
      ),
      _ReadyCard(
        icon: Icons.school_outlined,
        iconColor: Colors.deepPurpleAccent,
        title: "Explore Internships & Off-Campus Jobs",
        subtitle:
            "Curated internship and off-campus opportunities, all in one place.",
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return TopScrollWrapper(
      title: "",
      children: [
        AppHeader(title: "", highlight: "", onBack: widget.onBack),
        const SizedBox(height: 10),

        /// 🎉 ICON  (kept horizontally centered)
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
        const SizedBox(height: 10),

        /// TITLE  (kept horizontally centered)
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
                TextSpan(
                  text: "You're Ready",
                  style: TextStyle(color: AppColors.text),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),

        /// SUBTITLE  (kept horizontally centered)
        Center(
          child: Center(
            child: Text(
              "Your profile is live on Referd. Here's what's next:",
              style: TextStyle(color: AppColors.secText),
            ),
          ),
        ),
        const SizedBox(height: 24),

        /// 📊 CONDITIONAL CARDS
        for (final card in _cards) ...[
          _infoCard(card),
          const SizedBox(height: 12),
        ],

        const SizedBox(height: 18),

        /// 🔥 CTA
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
            child: isLoading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  )
                : const Text(
                    "Go to Home  ›",
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  /// 🔥 REUSABLE INFO CARD
  Widget _infoCard(_ReadyCard card) {
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
              color: card.iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(card.icon, color: card.iconColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.title, style: TextStyle(color: AppColors.text)),
                const SizedBox(height: 4),
                Text(
                  card.subtitle,
                  style: TextStyle(color: AppColors.secText, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔥 Lightweight data holder for a "what's next" card.
class _ReadyCard {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _ReadyCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });
}
