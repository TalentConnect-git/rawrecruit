import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

class LinksPage extends StatelessWidget {
    final VoidCallback onBack;

  const LinksPage({super.key,required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Links",
      children:  [
                  AppHeader(title: "Your professional", highlight: "details",onBack: onBack,),

          const SizedBox(height: 10),

          const Text(
            "Project links for standing out",
            style: TextStyle(color: Colors.grey),
          ),
   const SizedBox(height: 10),
        Input("Github"),
        Input("LinkedIn"),
        Input("Portfolio"),
        Input("Resume URL"),
      ],
    );
  }
}