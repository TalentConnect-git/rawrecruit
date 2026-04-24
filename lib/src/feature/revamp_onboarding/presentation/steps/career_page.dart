import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/models/experience.dart';
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

  late TextEditingController currentCompanyCtrl;
  late TextEditingController noticePeriodCtrl;

  String? certifications;

  List<Experience> experiences = [];

  final List<TextEditingController> companyCtrls = [];
  final List<TextEditingController> roleCtrls = [];
  final List<TextEditingController> startCtrls = [];
  final List<TextEditingController> endCtrls = [];
  final List<TextEditingController> descCtrls = [];

  @override
  void initState() {
    super.initState();

    final d = widget.data;

    shift = d.openToShift;

    currentSalaryCtrl = TextEditingController(text: d.currentSalaryAmount);

    currentCurrencyCtrl = TextEditingController(text: d.currentSalaryCurrency);

    expectedSalaryCtrl = TextEditingController(text: d.expectedSalaryAmount);

    expectedCurrencyCtrl = TextEditingController(
      text: d.expectedSalaryCurrency,
    );

    aboutCtrl = TextEditingController(text: d.about);

    currentCompanyCtrl = TextEditingController(text: d.currentCompany);

    noticePeriodCtrl = TextEditingController(text: d.noticePeriod);

    certifications = d.certifications;

    experiences = List.from(d.experiences ?? []);

    for (final exp in experiences) {
      companyCtrls.add(TextEditingController(text: exp.company));

      roleCtrls.add(TextEditingController(text: exp.role));

      startCtrls.add(TextEditingController(text: exp.startDate));

      endCtrls.add(TextEditingController(text: exp.endDate));

      descCtrls.add(TextEditingController(text: exp.description));
    }
  }

  void saveData() {
    final currentUser = context.read<AppStateProvider>().data ?? widget.data;

    final filteredExperiences = experiences.where((e) {
      return (e.company?.trim().isNotEmpty ?? false) &&
          (e.role?.trim().isNotEmpty ?? false);
    }).toList();

    final updatedUser = currentUser.copyWith(
      openToShift: shift,

      currentSalaryAmount: currentSalaryCtrl.text,

      currentSalaryCurrency: currentCurrencyCtrl.text,

      expectedSalaryAmount: expectedSalaryCtrl.text,

      expectedSalaryCurrency: expectedCurrencyCtrl.text,

      about: aboutCtrl.text,

      certifications: certifications,

      currentCompany: currentCompanyCtrl.text,

      noticePeriod: noticePeriodCtrl.text,

      experiences: filteredExperiences,
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

    currentCompanyCtrl.dispose();
    noticePeriodCtrl.dispose();

    for (final c in companyCtrls) {
      c.dispose();
    }

    for (final c in roleCtrls) {
      c.dispose();
    }

    for (final c in startCtrls) {
      c.dispose();
    }

    for (final c in endCtrls) {
      c.dispose();
    }

    for (final c in descCtrls) {
      c.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedList = certifications != null && certifications!.isNotEmpty
        ? certifications!.split(",")
        : <String>[];

    final appState = context.watch<AppStateProvider>();
    final isProfessional =
        getIt<AppStateProvider>().userType == UserType.professional;
    debugPrint(context.watch<AppStateProvider>().selectedUserType?.name);
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

        /// CURRENT SALARY
        Row(
          children: [
            Expanded(
              flex: 4,
              child: AppInput(
                "Current Salary",
                controller: currentSalaryCtrl,
                onChanged: (_) => saveData(),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              flex: 2,
              child: AppDropdown(
                hint: "Curr",
                value: currentCurrencyCtrl.text.isEmpty
                    ? null
                    : currentCurrencyCtrl.text,
                options: const ["INR", "USD", "EUR", "GBP"],
                onChanged: (val) {
                  currentCurrencyCtrl.text = val ?? "";

                  saveData();

                  setState(() {});
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// EXPECTED SALARY
        Row(
          children: [
            Expanded(
              flex: 4,
              child: AppInput(
                "Expected Salary",
                controller: expectedSalaryCtrl,
                onChanged: (_) => saveData(),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              flex: 2,
              child: AppDropdown(
                hint: "Curr",
                value: expectedCurrencyCtrl.text.isEmpty
                    ? null
                    : expectedCurrencyCtrl.text,
                options: const ["INR", "USD", "EUR", "GBP"],
                onChanged: (val) {
                  expectedCurrencyCtrl.text = val ?? "";

                  saveData();

                  setState(() {});
                },
              ),
            ),
          ],
        ),

        /// PROFESSIONAL ONLY
        if (isProfessional) ...[
          const SizedBox(height: 20),

          AppInput(
            "Current Company",
            controller: currentCompanyCtrl,
            onChanged: (_) => saveData(),
          ),

          AppInput(
            "Notice Period (Days)",
            controller: noticePeriodCtrl,
            keyboardType: TextInputType.number,
            onChanged: (_) => saveData(),
          ),

          const SizedBox(height: 20),

          const Text("Experience", style: TextStyle(color: Colors.grey)),

          const SizedBox(height: 10),

          ...experiences.asMap().entries.map((entry) {
            int i = entry.key;

            return Column(
              children: [
                AppInput(
                  "Company",
                  controller: companyCtrls[i],
                  onChanged: (v) {
                    experiences[i] = experiences[i].copyWith(
                      company: v,
                      isCurrent: experiences[i].isCurrent ?? false,
                    );
                    saveData();
                  },
                ),

                AppInput(
                  "Role",
                  controller: roleCtrls[i],
                  onChanged: (v) {
                  experiences[i] = experiences[i].copyWith(
  role: v,
  isCurrent: experiences[i].isCurrent ?? false,
);

                    saveData();
                  },
                ),

                AppInput(
                  "Start Date",
                  controller: startCtrls[i],
                  onChanged: (v) {
experiences[i] = experiences[i].copyWith(
  startDate: v,
  isCurrent: experiences[i].isCurrent ?? false,
);
                    saveData();
                  },
                ),

                AppInput(
                  "End Date",
                  controller: endCtrls[i],
                  onChanged: (v) {
              experiences[i] = experiences[i].copyWith(
  endDate: v,
  isCurrent: experiences[i].isCurrent ?? false,
);
                    saveData();
                  },
                ),

                AppInput(
                  "Description",
                  controller: descCtrls[i],
                  maxLines: 3,
                  onChanged: (v) {
                  experiences[i] = experiences[i].copyWith(
  description: v,
  isCurrent: experiences[i].isCurrent ?? false,
);

                    saveData();
                  },
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        experiences.removeAt(i);

                        companyCtrls.removeAt(i);

                        roleCtrls.removeAt(i);

                        startCtrls.removeAt(i);

                        endCtrls.removeAt(i);

                        descCtrls.removeAt(i);

                        saveData();
                      });
                    },
                    child: const Text("Remove"),
                  ),
                ),

                const Divider(),
              ],
            );
          }),

          TextButton(
            onPressed: () {
              setState(() {
                experiences.add(const Experience(isCurrent: false));

                companyCtrls.add(TextEditingController());

                roleCtrls.add(TextEditingController());

                startCtrls.add(TextEditingController());

                endCtrls.add(TextEditingController());

                descCtrls.add(TextEditingController());

                saveData();
              });
            },
            child: const Text("+ Add Experience"),
          ),
        ],

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

        /// CERTIFICATIONS
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
            certifications = val.join(",");

            saveData();
          },
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
