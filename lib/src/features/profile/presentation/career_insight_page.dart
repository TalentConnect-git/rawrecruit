import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show MyProfileViewModel;

class CareerInsightsPage extends StatefulWidget {
  const CareerInsightsPage({super.key});

  @override
  State<CareerInsightsPage> createState() => _CareerInsightsPageState();
}

class _CareerInsightsPageState extends State<CareerInsightsPage> {
  final MyProfileViewModel vm = MyProfileViewModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await vm.getCareerInsights();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<MyProfileViewModel>(
        builder: (_, vm, __) {
          return Scaffold(
            backgroundColor: Colors.black,

            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      /// 🔹 BACK
                      GestureDetector(
                        onTap: () => Navigator.pop(context),

                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back, color: Colors.grey),

                            SizedBox(width: 6),

                            Text("Back", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// 🔹 TITLE
                      const Text(
                        "Career Insights",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// 🔴 SKILL GAPS
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 18,
                                ),

                                SizedBox(width: 8),

                                Text(
                                  "Skill Gaps",

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "These skills are missing from your profile",

                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Wrap(
                              spacing: 10,
                              runSpacing: 10,

                              children: vm.missingSkills.isNotEmpty
                                  ? vm.missingSkills
                                        .map((s) => _chip(s, Colors.red))
                                        .toList()
                                  : [_chip("No data", Colors.grey)],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      /// 🟢 MARKET DEMAND
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.trending_up,
                                  color: Colors.green,
                                  size: 18,
                                ),

                                SizedBox(width: 8),

                                Text(
                                  "Market Demand",

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "Skills companies are hiring for right now",

                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Wrap(
                              spacing: 10,
                              runSpacing: 10,

                              children: vm.highDemandSkills.isNotEmpty
                                  ? vm.highDemandSkills
                                        .map((s) => _chip(s, Colors.green))
                                        .toList()
                                  : [_chip("No data", Colors.grey)],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      /// 💡 SUGGESTIONS
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: Colors.amber,
                                  size: 18,
                                ),

                                SizedBox(width: 8),

                                Text(
                                  "Suggestions",

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            ...(vm.suggestions.isNotEmpty
                                ? vm.suggestions.asMap().entries.map(
                                    (e) => _suggestion(
                                      "${e.key + 1}",
                                      e.value,
                                      "",
                                    ),
                                  )
                                : [
                                    _suggestion(
                                      "1",
                                      "No suggestions available",
                                      "",
                                    ),
                                  ]),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      /// 📊 PROFILE PROGRESS
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text(
                              "Profile Progress",

                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 18),

                            _progress("Skills", vm.profileScore / 100),

                            _progress("Resume", vm.resumeScore / 100),

                            _progress("Projects", 0.4, isStatic: true),

                            _progress("Referrals", 0.3, isStatic: true),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔹 COMMON CARD
  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.kCard,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: AppColors.kBorder),
      ),

      child: child,
    );
  }

  /// 🔹 CHIP
  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

      decoration: BoxDecoration(
        color: color.withOpacity(0.15),

        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: color.withOpacity(0.35)),
      ),

      child: Text(
        text,

        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// 🔹 SUGGESTION TILE
  Widget _suggestion(String no, String text, String gain) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),

        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CircleAvatar(
            radius: 13,

            backgroundColor: Colors.green.withOpacity(0.2),

            child: Text(
              no,

              style: const TextStyle(
                fontSize: 12,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                height: 1.4,
              ),
            ),
          ),

          if (gain.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 8),

              child: Text(
                gain,

                style: const TextStyle(color: Colors.green, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  /// 🔹 PROGRESS BAR
  Widget _progress(String label, double value, {bool isStatic = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),

          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),

            child: LinearProgressIndicator(
              value: value,
              minHeight: 8,

              backgroundColor: Colors.grey.withOpacity(0.2),

              valueColor: AlwaysStoppedAnimation<Color>(
                isStatic ? Colors.red : Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
