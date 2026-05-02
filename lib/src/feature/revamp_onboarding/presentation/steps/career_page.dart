import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/models/experience.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

import '../../../../common/index.dart';

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
  String currentCompanySearch = "";

  final Map<int, String> expCompanySearch = {};
  late TextEditingController currentCompanyCtrl;
  late TextEditingController noticePeriodCtrl;

  String? certifications;

  List<Experience> experiences = [];
  List<String> companyOptions = [];
  final List<TextEditingController> companyCtrls = [];
  final List<TextEditingController> roleCtrls = [];
  final List<TextEditingController> startCtrls = [];
  final List<TextEditingController> endCtrls = [];
  final List<TextEditingController> descCtrls = [];

  @override
  void initState() {
    super.initState();

    fetchCompanies();
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

  Future<void> fetchCompanies() async {
    final request = Request(
      method: RequestMethod.get,

      endpoint: "api/company",

      isSafeRoute: true,
    );

    try {
      final response = await getIt<NetworkService>().request(request);

      final data = List<Map<String, dynamic>>.from(response.data['data'] ?? []);

      setState(() {
        companyOptions = data.map((e) => e['name'].toString()).toList();
      });
    } catch (_) {}
  }

  Future<void> addCompanyIfNeeded(String value) async {
    final exists = companyOptions.any(
      (e) => e.toLowerCase().trim() == value.toLowerCase().trim(),
    );

    if (exists) return;

    try {
      await getIt<NetworkService>().request(
        Request(
          method: RequestMethod.post,

          endpoint: "api/company",

          isSafeRoute: true,

          body: {"name": value},
        ),
      );

      setState(() {
        companyOptions.add(value);
      });
    } catch (_) {}
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

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Current Company",

                style: TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 8),

              Autocomplete<String>(
                initialValue: TextEditingValue(text: currentCompanyCtrl.text),

                optionsBuilder: (textEditingValue) {
                  final query = textEditingValue.text;

                  final filtered = companyOptions.where(
                    (option) =>
                        option.toLowerCase().contains(query.toLowerCase()),
                  );

                  final exists = companyOptions.any(
                    (e) => e.toLowerCase().trim() == query.toLowerCase().trim(),
                  );

                  if (query.trim().isNotEmpty && !exists) {
                    return [...filtered, 'Create "$query"'];
                  }

                  return filtered;
                },

                onSelected: (value) async {
                  final actualValue = value.startsWith('Create "')
                      ? value.replaceAll('Create "', '').replaceAll('"', '')
                      : value;

                  await addCompanyIfNeeded(actualValue);

                  currentCompanyCtrl.text = actualValue;

                  saveData();

                  setState(() {});
                },

                fieldViewBuilder:
                    (context, controller, focusNode, onFieldSubmitted) {
                      controller.text = currentCompanyCtrl.text;

                      return TextField(
                        controller: controller,

                        focusNode: focusNode,

                        style: const TextStyle(color: Colors.white),

                        decoration: InputDecoration(
                          hintText: "Current Company",

                          filled: true,

                          fillColor: AppColors.kCard,

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (value) {
                          currentCompanySearch = value;

                          currentCompanyCtrl.text = value;

                          saveData();

                          setState(() {});
                        },
                      );
                    },

                optionsViewBuilder: (context, onSelected, options) {
                  return Material(
                    color: Colors.black,

                    child: Container(
                      width: MediaQuery.of(context).size.width - 32,

                      constraints: const BoxConstraints(maxHeight: 220),

                      child: ListView.builder(
                        shrinkWrap: true,

                        itemCount: options.length,

                        itemBuilder: (context, index) {
                          final option = options.elementAt(index);

                          return ListTile(
                            title: Text(
                              option,

                              style: const TextStyle(color: Colors.white),
                            ),

                            onTap: () {
                              onSelected(option);
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 12),

                    Autocomplete<String>(
                      initialValue: TextEditingValue(
                        text: companyCtrls[i].text,
                      ),

                      optionsBuilder: (textEditingValue) {
                        final query = textEditingValue.text;

                        final filtered = companyOptions.where(
                          (option) => option.toLowerCase().contains(
                            query.toLowerCase(),
                          ),
                        );

                        final exists = companyOptions.any(
                          (e) =>
                              e.toLowerCase().trim() ==
                              query.toLowerCase().trim(),
                        );

                        if (query.trim().isNotEmpty && !exists) {
                          return [...filtered, 'Create "$query"'];
                        }

                        return filtered;
                      },

                      onSelected: (value) async {
                        final actualValue = value.startsWith('Create "')
                            ? value
                                  .replaceAll('Create "', '')
                                  .replaceAll('"', '')
                            : value;

                        await addCompanyIfNeeded(actualValue);

                        companyCtrls[i].text = actualValue;

                        experiences[i] = experiences[i].copyWith(
                          company: actualValue,

                          isCurrent: experiences[i].isCurrent ?? false,
                        );

                        saveData();

                        setState(() {});
                      },

                      fieldViewBuilder:
                          (context, controller, focusNode, onFieldSubmitted) {
                            controller.text = companyCtrls[i].text;

                            return TextField(
                              controller: controller,

                              focusNode: focusNode,

                              style: const TextStyle(color: Colors.white),

                              decoration: InputDecoration(
                                hintText: "Company",

                                filled: true,

                                fillColor: AppColors.kCard,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),

                              onChanged: (value) {
                                expCompanySearch[i] = value;

                                companyCtrls[i].text = value;

                                experiences[i] = experiences[i].copyWith(
                                  company: value,

                                  isCurrent: experiences[i].isCurrent ?? false,
                                );

                                saveData();

                                setState(() {});
                              },
                            );
                          },

                      optionsViewBuilder: (context, onSelected, options) {
                        return Material(
                          color: Colors.black,

                          child: Container(
                            width: MediaQuery.of(context).size.width - 32,

                            constraints: const BoxConstraints(maxHeight: 220),

                            child: ListView.builder(
                              shrinkWrap: true,

                              itemCount: options.length,

                              itemBuilder: (context, index) {
                                final option = options.elementAt(index);

                                return ListTile(
                                  title: Text(
                                    option,

                                    style: const TextStyle(color: Colors.white),
                                  ),

                                  onTap: () {
                                    onSelected(option);
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
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

                GestureDetector(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      final formatted =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";

                      startCtrls[i].text = formatted;

                      experiences[i] = experiences[i].copyWith(
                        startDate: formatted,
                        isCurrent: experiences[i].isCurrent ?? false,
                      );

                      saveData();
                      setState(() {});
                    }
                  },
                  child: AbsorbPointer(
                    child: AppInput("Start Date", controller: startCtrls[i]),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      final formatted =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";

                      endCtrls[i].text = formatted;

                      experiences[i] = experiences[i].copyWith(
                        endDate: formatted,
                        isCurrent: experiences[i].isCurrent ?? false,
                      );

                      saveData();
                      setState(() {});
                    }
                  },
                  child: AbsorbPointer(
                    child: AppInput("End Date", controller: endCtrls[i]),
                  ),
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
