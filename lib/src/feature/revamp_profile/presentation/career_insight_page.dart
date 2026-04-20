import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';

import '../../revamp_onboarding/presentation/index.dart';

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
                padding: const EdgeInsets.all(16),
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
                            Text("Back",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// 🔹 TITLE
                      const Text(
                        "Career Insights",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// 🔴 SKILL GAPS
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.error_outline,
                                    color: Colors.red, size: 18),
                                SizedBox(width: 8),
                                Text("Skill Gaps",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "These skills are missing from your profile",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(height: 12),

                            Wrap(
                              spacing: 8,
                              children: vm.missingSkills.isNotEmpty
                                  ? vm.missingSkills
                                      .map((s) => _chip(s, Colors.red))
                                      .toList()
                                  : [_chip("No data", Colors.grey)],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// 🟢 MARKET DEMAND
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.trending_up,
                                    color: Colors.green, size: 18),
                                SizedBox(width: 8),
                                Text("Market Demand",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Skills companies are hiring for right now",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(height: 12),

                            Wrap(
                              spacing: 8,
                              children: vm.highDemandSkills.isNotEmpty
                                  ? vm.highDemandSkills
                                      .map((s) => _chip(s, Colors.green))
                                      .toList()
                                  : [_chip("No data", Colors.grey)],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// 💡 SUGGESTIONS
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.lightbulb_outline,
                                    color: Colors.amber, size: 18),
                                SizedBox(width: 8),
                                Text("Suggestions",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            const SizedBox(height: 12),

                            ...(vm.suggestions.isNotEmpty
                                ? vm.suggestions
                                    .asMap()
                                    .entries
                                    .map((e) => _suggestion(
                                          "${e.key + 1}",
                                          e.value,
                                          "",
                                        ))
                                : [
                                    _suggestion(
                                        "1", "No suggestions available", "")
                                  ]),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// 📊 PROFILE PROGRESS
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Profile Progress",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),

                            const SizedBox(height: 12),

                            _progress(
                                "Skills", vm.profileScore / 100),
                            _progress(
                                "Resume", vm.resumeScore / 100),

                            /// 🔴 STATIC
                            _progress("Projects", 0.4,
                                isStatic: true),
                            _progress("Referrals", 0.3,
                                isStatic: true),
                          ],
                        ),
                      ),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: child,
    );
  }

  /// 🔹 CHIP
  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }

  /// 🔹 SUGGESTION TILE
  Widget _suggestion(String no, String text, String gain) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.green.withOpacity(0.2),
            child: Text(no,
                style:
                    const TextStyle(fontSize: 12, color: Colors.green)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white, fontSize: 13)),
          ),
          Text(gain,
              style: const TextStyle(
                  color: Colors.green, fontSize: 12))
        ],
      ),
    );
  }

  /// 🔹 PROGRESS BAR
  Widget _progress(String label, double value,
      {bool isStatic = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: value,
            minHeight: 6,
            backgroundColor: Colors.grey.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              isStatic ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:rawrecruit/src/common/index.dart';

// class CareerInsightsPage extends StatelessWidget {
//   const CareerInsightsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// 🔹 BACK
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: const Row(
//                     children: [
//                       Icon(Icons.arrow_back, color: Colors.grey),
//                       SizedBox(width: 6),
//                       Text("Back",
//                           style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// 🔹 TITLE
//                 const Text(
//                   "Career Insights",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 20),

//                 /// 🔴 SKILL GAPS
//                 _card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Row(
//                         children: [
//                           Icon(Icons.error_outline,
//                               color: Colors.red, size: 18),
//                           SizedBox(width: 8),
//                           Text("Skill Gaps",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600)),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         "These skills are missing from your profile",
//                         style: TextStyle(color: Colors.grey, fontSize: 12),
//                       ),
//                       const SizedBox(height: 12),

//                       Wrap(
//                         spacing: 8,
//                         children: [
//                           _chip("System Design", Colors.red),
//                           _chip("GraphQL", Colors.red),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 /// 🟢 MARKET DEMAND
//                 _card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Row(
//                         children: [
//                           Icon(Icons.trending_up,
//                               color: Colors.green, size: 18),
//                           SizedBox(width: 8),
//                           Text("Market Demand",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600)),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         "Skills companies are hiring for right now",
//                         style: TextStyle(color: Colors.grey, fontSize: 12),
//                       ),
//                       const SizedBox(height: 12),

//                       Wrap(
//                         spacing: 8,
//                         children: [
//                           _chip("React", Colors.green),
//                           _chip("TypeScript", Colors.green),
//                           _chip("Next.js", Colors.green),
//                           _chip("AI/ML", Colors.orange),
//                           _chip("Rust", Colors.orange),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 /// 💡 SUGGESTIONS
//                 _card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Row(
//                         children: [
//                           Icon(Icons.lightbulb_outline,
//                               color: Colors.amber, size: 18),
//                           SizedBox(width: 8),
//                           Text("Suggestions",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),

//                       _suggestion("1", "Add 2 projects to increase match by 15%", "+15%"),
//                       _suggestion("2", "Improve resume metrics for better visibility", "+10%"),
//                       _suggestion("3", "Get 1 more referral to boost ranking", "+8%"),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 /// 📊 PROFILE PROGRESS
//                 _card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Profile Progress",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600)),

//                       const SizedBox(height: 12),

//                       _progress("Skills", 0.8),
//                       _progress("Projects", 0.6),
//                       _progress("Resume", 0.85),
//                       _progress("Referrals", 0.45),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// 🔹 COMMON CARD
//   Widget _card({required Widget child}) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.kCard,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: AppColors.kBorder),
//       ),
//       child: child,
//     );
//   }

//   /// 🔹 CHIP
//   Widget _chip(String text, Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(color: color, fontSize: 12),
//       ),
//     );
//   }

//   /// 🔹 SUGGESTION TILE
//   Widget _suggestion(String no, String text, String gain) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.03),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 12,
//             backgroundColor: Colors.green.withOpacity(0.2),
//             child: Text(no,
//                 style: const TextStyle(fontSize: 12, color: Colors.green)),
//           ),
//           const SizedBox(width: 10),

//           Expanded(
//             child: Text(text,
//                 style: const TextStyle(color: Colors.white, fontSize: 13)),
//           ),

//           Text(gain,
//               style: const TextStyle(color: Colors.green, fontSize: 12))
//         ],
//       ),
//     );
//   }

//   /// 🔹 PROGRESS BAR
//   Widget _progress(String label, double value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label,
//               style: const TextStyle(color: Colors.grey, fontSize: 12)),
//           const SizedBox(height: 6),
//           LinearProgressIndicator(
//             value: value,
//             minHeight: 6,
//             backgroundColor: Colors.grey.withOpacity(0.2),
//             valueColor:
//                 const AlwaysStoppedAnimation<Color>(Colors.green),
//           ),
//         ],
//       ),
//     );
//   }
// }