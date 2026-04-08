import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

class CareerPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const CareerPage({super.key, required this.onBack, required this.data});

  @override
  State<CareerPage> createState() => _CareerPageState();

  static const shiftOptions = ["Day", "Night", "Rotational", "Any"];
}

class _CareerPageState extends State<CareerPage> {
  String? shift;

  late TextEditingController currentSalaryCtrl;
  late TextEditingController currentCurrencyCtrl;
  late TextEditingController expectedSalaryCtrl;
  late TextEditingController expectedCurrencyCtrl;
  late TextEditingController aboutCtrl;

  /// ✅ FIXED (STRING instead of list)
  String? certifications;

  @override
  void initState() {
    super.initState();

final d = widget.data;    shift = d.openToShift;

    currentSalaryCtrl = TextEditingController(text: d.currentSalaryAmount);
    currentCurrencyCtrl = TextEditingController(text: d.currentSalaryCurrency);

    expectedSalaryCtrl = TextEditingController(text: d.expectedSalaryAmount);
    expectedCurrencyCtrl = TextEditingController(
      text: d.expectedSalaryCurrency,
    );

    aboutCtrl = TextEditingController(text: d.about);

    /// ✅ convert existing string → UI list format
    certifications = d.certifications;
  }
void saveData() {
  final currentUser =
      context.read<AppStateProvider>().data ?? widget.data;

  final updatedUser = currentUser.copyWith(
    openToShift: shift,
    currentSalaryAmount: currentSalaryCtrl.text,
    currentSalaryCurrency: currentCurrencyCtrl.text,
    expectedSalaryAmount: expectedSalaryCtrl.text,
    expectedSalaryCurrency: expectedCurrencyCtrl.text,
    about: aboutCtrl.text,
    certifications: certifications,
  );

  context.read<AppStateProvider>().data = updatedUser;
}
  @override
  void dispose() {
    currentSalaryCtrl.dispose();
    currentCurrencyCtrl.dispose();
    expectedSalaryCtrl.dispose();
    expectedCurrencyCtrl.dispose();
    aboutCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 🔥 convert string → list for UI
    final selectedList = certifications != null && certifications!.isNotEmpty
        ? certifications!.split(",")
        : <String>[];

    return Wrapper(
      title: "Career",
      children: [
        AppHeader(
          title: "Your Career",
          highlight: "details",
          onBack: widget.onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "Help us get to know you more",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 16),

        /// SHIFT
        AppDropdown(
          hint: "Open To Shift",
          options: CareerPage.shiftOptions,
          value: shift,
          onChanged: (val) {
            setState(() {
              shift = val;
              saveData();
            });
          },
        ),

        /// SALARY
        AppInput(
          "Current Salary",
          controller: currentSalaryCtrl,
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Current Currency",
          controller: currentCurrencyCtrl,
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Expected Salary",
          controller: expectedSalaryCtrl,
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Expected Currency",
          controller: expectedCurrencyCtrl,
          onChanged: (_) => saveData(),
        ),

        const SizedBox(height: 20),

        const Text(
          "Certifications and more",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 10),

        /// ABOUT
        AppInput(
          "About",
          controller: aboutCtrl,
          maxLines: 4,
          onChanged: (_) => saveData(),
        ),

        const SizedBox(height: 8),

        /// ✅ CERTIFICATIONS (STRING <-> LIST CONVERSION)
        AppMultiSelectChips(
          label: "Certifications",
          options: [
            "AWS Certified",
            "Google Cloud",
            "Azure",
            "PMP",
            "Scrum Master",
            "Oracle",
            "Cisco",
            "Others",
          ],
          initialValues: selectedList,
          onChanged: (val) {
            /// convert list → string
            certifications = val.join(",");
            saveData();
          },
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
