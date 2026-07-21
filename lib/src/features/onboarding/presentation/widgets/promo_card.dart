import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/features/profile/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class CareerInsightPromoCard extends StatefulWidget {
  const CareerInsightPromoCard({super.key});

  @override
  State<CareerInsightPromoCard> createState() => _CareerInsightPromoCardState();
}

class _CareerInsightPromoCardState extends State<CareerInsightPromoCard> {
  static const _prefsKey = 'career_insight_last_opened';

  bool _visible = false; // stays hidden until we confirm it's a new day
  bool _checked = false;

  @override
  void initState() {
    super.initState();
    _checkShouldShow();
  }

  String get _todayKey {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }

  Future<void> _checkShouldShow() async {
    final prefs = await SharedPreferences.getInstance();
    final lastOpened = prefs.getString(_prefsKey);
    if (!mounted) return;
    setState(() {
      _visible = lastOpened != _todayKey; // hide only if already opened today
      _checked = true;
    });
  }

  Future<void> _openInsights() async {
    final router = GoRouter.of(context); // capture before the await
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, _todayKey); // mark as opened today
    if (mounted) setState(() => _visible = false);

    // 👇 swap for your actual Career Insights navigation
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CareerInsightsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_checked || !_visible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: _openInsights,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
            gradient: LinearGradient(
              colors: [AppColors.kCard, AppColors.kTile],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.kGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.insights_rounded,
                  color: AppColors.kGreen,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Career Insights are ready',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'See where you stand and how to level up',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.s12W600.copyWith(
                        color: AppColors.secText,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: AppColors.secText, size: 14),
            ],
          ),
        ),
      ),
    );
  }
}
