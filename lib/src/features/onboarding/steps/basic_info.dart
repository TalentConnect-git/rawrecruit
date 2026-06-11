import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show AppInput, AppHeader, Wrapper;
import 'package:rawrecruit/src/features/onboarding/presentation/widgets/onboarding_local_service.dart';

import '../../../common/index.dart';

class BasicPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const BasicPage({super.key, required this.onBack, required this.data});

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

  String countryCode = "+91";

  @override
  void initState() {
    super.initState();

    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    dobCtrl = TextEditingController();

    /// 🔥 FETCH EMAIL AFTER NAVIGATION
    Future.delayed(const Duration(milliseconds: 500), () {
      final email = getIt<AppStateProvider>().auth?.email ?? '';

      print("EMAIL => $email");

      if (email.isNotEmpty) {
        emailCtrl.text = email;

        saveData();

        setState(() {});
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final d = context.read<AppStateProvider>().data ?? widget.data;

    nameCtrl.text = d.name ?? '';

    final phone = d.phone ?? '';

    if (phone.startsWith("+1")) {
      countryCode = "+1";

      phoneCtrl.text = phone.replaceAll("+1", "");
    } else if (phone.startsWith("+44")) {
      countryCode = "+44";

      phoneCtrl.text = phone.replaceAll("+44", "");
    } else if (phone.startsWith("+971")) {
      countryCode = "+971";

      phoneCtrl.text = phone.replaceAll("+971", "");
    } else {
      countryCode = "+91";

      phoneCtrl.text = phone.replaceAll("+91", "");
    }

    dobCtrl.text = d.dob ?? '';

    gender = d.gender;
    ethnicity = d.ethnicity;
    maritalStatus = d.maritalStatus;
    visaStatus = d.visaStatus;
  }

  void saveData() {
    final currentUser = context.read<AppStateProvider>().data ?? widget.data;

    final updatedUser = currentUser.copyWith(
      name: nameCtrl.text,

      email: emailCtrl.text,

      phone: phoneCtrl.text.trim().isNotEmpty
          ? "$countryCode${phoneCtrl.text.trim()}"
          : null,

      dob: dobCtrl.text,

      gender: gender,
      ethnicity: ethnicity,
      maritalStatus: maritalStatus,
      visaStatus: visaStatus,
    );

    context.read<AppStateProvider>().data = updatedUser;

    getIt<OnboardingLocalService>().saveUser(updatedUser);
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

          highlight: "Identity",

          onBack: widget.onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "Tell Us Who Your Are",

          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 16),

        AppInput(
          "Full Name",

          controller: nameCtrl,

          onChanged: (_) => saveData(),
        ),

        AppInput("Email", controller: emailCtrl, onChanged: (_) => saveData()),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),

              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),

              decoration: BoxDecoration(
                color: Colors.grey.shade900,

                borderRadius: BorderRadius.circular(14),

                border: Border.all(color: AppColors.kBorder),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: countryCode,

                  dropdownColor: Colors.grey.shade900,

                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),

                  items: const [
                    DropdownMenuItem(value: "+91", child: Text("IN +91")),

                    DropdownMenuItem(value: "+1", child: Text("US +1")),

                    DropdownMenuItem(value: "+44", child: Text("UK +44")),

                    DropdownMenuItem(value: "+971", child: Text("UAE +971")),
                  ],

                  onChanged: (v) {
                    if (v == null) return;

                    setState(() {
                      countryCode = v;
                    });

                    saveData();
                  },
                ),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: AppInput(
                "enter your phone",

                controller: phoneCtrl,

                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                  decimal: false,
                ),

                inputFormatter: [FilteringTextInputFormatter.digitsOnly],

                onChanged: (_) => saveData(),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
