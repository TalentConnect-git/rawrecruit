import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show AppInput, Wrapper, OnboardingLocalService, AppHeader;

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

  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    /// 🔥 EMPTY CONTROLLERS
    githubCtrl = TextEditingController();
    linkedinCtrl = TextEditingController();
    portfolioCtrl = TextEditingController();
    resumeCtrl = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// 🔥 PREVENT RESET
    if (isInitialized) return;

    final d = context.read<AppStateProvider>().data ?? widget.data;

    /// 🔥 AUTOFILL
    githubCtrl.text = d.github ?? '';
    linkedinCtrl.text = d.linkedin ?? '';
    portfolioCtrl.text = d.portfolio ?? '';
    resumeCtrl.text = d.resume ?? '';

    isInitialized = true;
  }

  void saveData() {
    final currentUser = context.read<AppStateProvider>().data ?? widget.data;

    final updatedUser = currentUser.copyWith(
      github: githubCtrl.text,
      linkedin: linkedinCtrl.text,
      portfolio: portfolioCtrl.text,
      resume: resumeCtrl.text,
    );

    context.read<AppStateProvider>().data = updatedUser;
    getIt<OnboardingLocalService>().saveUser(updatedUser);
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
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/images/github.png',
              height: 20,
              width: 20,
            ),
          ),
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "LinkedIn",
          controller: linkedinCtrl,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/images/linkedin.png',
              height: 20,
              width: 20,
            ),
          ),
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Portfolio",
          controller: portfolioCtrl,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/images/portfolio.png',
              height: 20,
              width: 20,
            ),
          ),
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Resume URL",
          controller: resumeCtrl,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset('assets/images/cv.png', height: 20, width: 20),
          ),
          onChanged: (_) => saveData(),
        ),
      ],
    );
  }
}
