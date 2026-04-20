import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

class LinksPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const LinksPage({super.key, required this.onBack, required this.data});

  @override
  State<LinksPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  late TextEditingController githubCtrl;
  late TextEditingController linkedinCtrl;
  late TextEditingController portfolioCtrl;
  late TextEditingController resumeCtrl;

  @override
  void initState() {
    super.initState();

final d = widget.data; githubCtrl = TextEditingController(text: d.github);
    linkedinCtrl = TextEditingController(text: d.linkedin);
    portfolioCtrl = TextEditingController(text: d.portfolio);
resumeCtrl = TextEditingController(text: d.resume);  }
void saveData() {
  final currentUser =
      context.read<AppStateProvider>().data ?? widget.data;

  final updatedUser = currentUser.copyWith(
    github: githubCtrl.text,
    linkedin: linkedinCtrl.text,
    portfolio: portfolioCtrl.text,
    resume: resumeCtrl.text, // ✅ FIXED (also name correction)
  );

  context.read<AppStateProvider>().data = updatedUser;
}
  @override
  void dispose() {
    githubCtrl.dispose();
    linkedinCtrl.dispose();
    portfolioCtrl.dispose();
    resumeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Links",
      children: [
        AppHeader(
          title: "Your professional",
          highlight: "details",
          onBack: widget.onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "Project links for standing out",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 10),

        AppInput(
          "Github",
          controller: githubCtrl,
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "LinkedIn",
          controller: linkedinCtrl,
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Portfolio",
          controller: portfolioCtrl,
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Resume URL",
          controller: resumeCtrl,
          onChanged: (_) => saveData(),
        ),
      ],
    );
  }
}
