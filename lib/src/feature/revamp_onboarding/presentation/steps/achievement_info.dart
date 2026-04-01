import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';

import '../widgets/wrapper.dart';

class AchievementsPage extends StatelessWidget {
    final VoidCallback onBack;

  const AchievementsPage({super.key,required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Achievements & More",
      children:  [
                  AppHeader(title: "Your professional", highlight: "Achievements",onBack: onBack,),
                     const SizedBox(height: 10),
 const Text(
            "What makes you stand out ?",
            style: TextStyle(color: Colors.grey),
          ),
             const SizedBox(height: 10),
        Input("Achievements"),
        Input("Awards"),
        Input("Publications"),
      ],
    );
  }
}