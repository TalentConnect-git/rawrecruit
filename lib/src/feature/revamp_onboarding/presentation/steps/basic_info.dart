import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';
import '../widgets/input_widgets.dart';
import '../widgets/onboarding_local_service.dart';

class BasicPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const BasicPage({
    super.key,
    required this.onBack,
    required this.data,
  });

  /// ✅ OPTIONS HERE
  static const genderOptions = [
    "Male",
    "Female",
    "Non-binary",
    "Prefer not to say",
  ];

  static const ethnicityOptions = [
    "Asian",
    "Black or African American",
    "Hispanic or Latino",
    "Native American or Alaska Native",
    "White",
    "Two or More Races",
    "Prefer not to say",
  ];

  static const maritalStatusOptions = [
    "Single",
    "Married",
    "Divorced",
    "Widowed",
    "Prefer not to say",
  ];

  static const visaStatusOptions = [
    "Citizen",
    "Permanent Resident",
    "Work Visa (e.g., H1B)",
    "Student Visa (e.g., F1)",
    "Not Authorized to Work",
    "Other",
  ];

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController dobCtrl;

  String? gender;
  String? ethnicity;
  String? maritalStatus;
  String? visaStatus;

  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    /// 🔥 EMPTY CONTROLLERS
    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    dobCtrl = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// 🔥 PREVENT RESET ON EVERY REBUILD
    if (isInitialized) return;

    final d =
        context.read<AppStateProvider>().data ?? widget.data;

    nameCtrl.text = d.name ?? '';
    emailCtrl.text = d.email ?? '';
    phoneCtrl.text = d.phone ?? '';
    dobCtrl.text = d.dob ?? '';

    gender = d.gender;
    ethnicity = d.ethnicity;
    maritalStatus = d.maritalStatus;
    visaStatus = d.visaStatus;

    isInitialized = true;
  }

  void saveData() {
    final currentUser =
        context.read<AppStateProvider>().data ?? widget.data;

    final updatedUser = currentUser.copyWith(
      name: nameCtrl.text,
      email: emailCtrl.text,
      phone: phoneCtrl.text,
      dob: dobCtrl.text,
      gender: gender,
      ethnicity: ethnicity,
      maritalStatus: maritalStatus,
      visaStatus: visaStatus,
    );

    /// ✅ STORE UPDATED USER
    context.read<AppStateProvider>().data = updatedUser;
    getIt<OnboardingLocalService>()
    .saveUser(updatedUser);
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    dobCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: "Basic",
      children: [
        AppHeader(
          title: "Your Professional",
          highlight: "details",
          onBack: widget.onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "Add your information",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 16),

        AppInput(
          "Full Name",
          controller: nameCtrl,
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Email",
          controller: emailCtrl,
          onChanged: (_) => saveData(),
        ),

        AppInput(
          "Phone",
          controller: phoneCtrl,
          onChanged: (_) => saveData(),
        ),

        const SizedBox(height: 8),

        // AppDropdown(
        //   hint: "Gender",
        //   value: gender,
        //   options: BasicPage.genderOptions,
        //   onChanged: (val) {
        //     setState(() {
        //       gender = val;
        //       saveData();
        //     });
        //   },
        // ),

        // AppInput(
        //   "Date of Birth",
        //   controller: dobCtrl,
        //   onChanged: (_) => saveData(),
        // ),

        // AppDropdown(
        //   hint: "Ethnicity",
        //   value: ethnicity,
        //   options: BasicPage.ethnicityOptions,
        //   onChanged: (val) {
        //     setState(() {
        //       ethnicity = val;
        //       saveData();
        //     });
        //   },
        // ),

        // AppDropdown(
        //   hint: "Marital Status",
        //   value: maritalStatus,
        //   options: BasicPage.maritalStatusOptions,
        //   onChanged: (val) {
        //     setState(() {
        //       maritalStatus = val;
        //       saveData();
        //     });
        //   },
        // ),

        // AppDropdown(
        //   hint: "Visa Status / Work Authorization",
        //   value: visaStatus,
        //   options: BasicPage.visaStatusOptions,
        //   onChanged: (val) {
        //     setState(() {
        //       visaStatus = val;
        //       saveData();
        //     });
        //   },
        // ),

        const SizedBox(height: 20),
      ],
    );
  }
}