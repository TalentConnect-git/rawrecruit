import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/models/experience.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/job_posting_view.dart';

import '../../../../common/index.dart';
import '../widgets/onboarding_local_service.dart';

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
  bool isInitialized = false;
  late TextEditingController currentSalaryCtrl;
  late TextEditingController currentCurrencyCtrl;

  late TextEditingController expectedSalaryCtrl;
  late TextEditingController expectedCurrencyCtrl;

  late TextEditingController aboutCtrl;
  // String currentCompanySearch = "";

  final Map<int, String> expCompanySearch = {};
  late TextEditingController currentCompanyCtrl;
  late TextEditingController companyEmailCtrl;
  late TextEditingController noticePeriodCtrl;
  late TextEditingController
    totalYearsOfExperienceCtrl;
List<String> roleOptions = [];
  String? certifications;

  List<Experience> experiences = [];
  List<String> companyOptions = [];
  final List<TextEditingController> companyCtrls = [];
  final List<TextEditingController> roleCtrls = [];
  final List<TextEditingController> startCtrls = [];
  final List<TextEditingController> endCtrls = [];
  final List<TextEditingController> descCtrls = [];
List<String> jobTitleOptions = [];
Future<void> fetchJobRoles() async {
  try {

    final response =
        await getIt<NetworkService>()
            .request(
      Request(
        method: RequestMethod.get,

        endpoint:
            "api/company-master-data?type=JOB_ROLE",

        isSafeRoute: true,
      ),
    );

    final data =
        List<Map<String, dynamic>>.from(
      response.data['data'] ?? [],
    );

    final roles =
        data
            .map(
              (e) => e['value']
                  .toString(),
            )
            .toSet()
            .toList();

    if (!roles.contains("Others")) {
      roles.add("Others");
    }

    setState(() {
      jobTitleOptions = roles;
    });

  } catch (_) {}
}
  @override
  void initState() {
    super.initState();

    fetchCompanies();
fetchJobRoles();
    /// 🔥 EMPTY CONTROLLERS
    currentSalaryCtrl = TextEditingController();
companyEmailCtrl = TextEditingController();
 currentCurrencyCtrl =
    TextEditingController(text: '₹');

    expectedSalaryCtrl = TextEditingController();

    expectedCurrencyCtrl = TextEditingController();

    aboutCtrl = TextEditingController();

    currentCompanyCtrl = TextEditingController();

    noticePeriodCtrl = TextEditingController();
    totalYearsOfExperienceCtrl =
    TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// 🔥 PREVENT RESET
    if (isInitialized) return;

    final d = context.read<AppStateProvider>().data ?? widget.data;

    shift = d.openToShift;

    currentSalaryCtrl.text = d.currentSalaryAmount ?? '';

currentCurrencyCtrl.text =
    (d.currentSalaryCurrency?.isNotEmpty ?? false)
        ? d.currentSalaryCurrency!
        : '₹';
    expectedSalaryCtrl.text = d.expectedSalaryAmount ?? '';

    expectedCurrencyCtrl.text = d.expectedSalaryCurrency ?? '';
noticePeriodStartDateCtrl =
    TextEditingController(
  text: d.noticePeriodStartDate ?? '',
);

servingNoticePeriod =
    d.servingNoticePeriod ?? false;
    aboutCtrl.text = d.about ?? '';

    currentCompanyCtrl.text = d.currentCompany ?? '';
    companyEmailCtrl.text = d.companyEmail ?? '';
    noticePeriodCtrl.text = d.noticePeriod ?? '';
totalYearsOfExperienceCtrl.text =
    d.totalYearsOfExperience ?? '';
    certifications = d.certifications;

    /// 🔥 EXPERIENCE AUTOFILL
    experiences = List.from(d.experiences ?? []);

    companyCtrls.clear();
    roleCtrls.clear();
    startCtrls.clear();
    endCtrls.clear();
    descCtrls.clear();

    for (final exp in experiences) {
      companyCtrls.add(TextEditingController(text: exp.company ?? ''));

      roleCtrls.add(TextEditingController(text: exp.role ?? ''));

      startCtrls.add(TextEditingController(text: exp.startDate ?? ''));

      endCtrls.add(TextEditingController(text: exp.endDate ?? ''));

      descCtrls.add(TextEditingController(text: exp.description ?? ''));
    }

    /// 🔥 AUTO REGISTER COMPANIES
    Future.microtask(() async {
      for (final exp in experiences) {
        if (exp.company != null && exp.company!.trim().isNotEmpty) {
          await addCompanyIfNeeded(exp.company!);
        }
      }

      if (currentCompanyCtrl.text.trim().isNotEmpty) {
        await addCompanyIfNeeded(currentCompanyCtrl.text);
      }
    });

    isInitialized = true;
  }

  void saveData() {
    final currentUser = context.read<AppStateProvider>().data ?? widget.data;
final filteredExperiences = experiences.where((e) {
  return (e.company?.trim().isNotEmpty ?? false) ||
      (e.role?.trim().isNotEmpty ?? false) ||
      (e.startDate?.trim().isNotEmpty ?? false) ||
      (e.endDate?.trim().isNotEmpty ?? false) ||
      (e.description?.trim().isNotEmpty ?? false);
}).toList();
    final currentExp = experiences.firstWhere(
      (e) => e.isCurrent == true,
      orElse: () => const Experience(),
    );

    final derivedCurrentCompany = currentExp.isCurrent == true
        ? (currentExp.company ?? '')
        : '';
    currentCompanyCtrl.text = derivedCurrentCompany;

    final updatedUser = currentUser.copyWith(
      openToShift: shift,
companyEmail: companyEmailCtrl.text,
      currentSalaryAmount: currentSalaryCtrl.text,

      currentSalaryCurrency: currentCurrencyCtrl.text,

      expectedSalaryAmount: expectedSalaryCtrl.text,

      expectedSalaryCurrency: expectedCurrencyCtrl.text,

      about: aboutCtrl.text,

      certifications: certifications,

      currentCompany: derivedCurrentCompany,
      noticePeriod: noticePeriodCtrl.text,
      totalYearsOfExperience:
    totalYearsOfExperienceCtrl.text,
noticePeriodStartDate:
    noticePeriodStartDateCtrl.text,

servingNoticePeriod:
    servingNoticePeriod,
      experiences: filteredExperiences,
    );

    context.read<AppStateProvider>().data = updatedUser;
    getIt<OnboardingLocalService>()
    .saveUser(updatedUser);
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
companyEmailCtrl.dispose();
    expectedSalaryCtrl.dispose();
    expectedCurrencyCtrl.dispose();

    aboutCtrl.dispose();
noticePeriodStartDateCtrl.dispose();
    currentCompanyCtrl.dispose();
    noticePeriodCtrl.dispose();
totalYearsOfExperienceCtrl.dispose();
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
  Future<void> addRoleIfNeeded(
  String value,
) async {

  final exists =
      jobTitleOptions.any(
    (e) =>
        e.toLowerCase().trim() ==
        value
            .toLowerCase()
            .trim(),
  );

  if (exists) return;

  try {

    await getIt<NetworkService>()
        .request(
      Request(
        method:
            RequestMethod.post,

        endpoint:
            "api/company-master-data",

        isSafeRoute:
            true,

        body: {
          "type": "JOB_ROLE",
          "value": value,
        },
      ),
    );

    setState(() {
      jobTitleOptions.add(
        value,
      );
    });

  } catch (e) {
    debugPrint(e.toString());
  }
}
late TextEditingController noticePeriodStartDateCtrl;

bool servingNoticePeriod = false;
  @override
  Widget build(BuildContext context) {
    // final selectedList = certifications != null && certifications!.isNotEmpty
    //     ? certifications!.split(",")
    //     : <String>[];

    // final appState = context.watch<AppStateProvider>();
    // final isProfessional =
    //     getIt<AppStateProvider>().userType == UserType.professional;
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

        // /// SHIFT
        // AppDropdown(
        //   hint: "Open To Shift",
        //   options: CareerPage.shiftOptions,
        //   value: shift,
        //   onChanged: (val) {
        //     setState(() {
        //       shift = val;
        //       saveData();
        //     });
        //   },
        // ),

        /// CURRENT SALARY
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AppDropdown(
                hint: "Curr",
                value: currentCurrencyCtrl.text.isEmpty
                    ? null
                    : currentCurrencyCtrl.text,
                options: const ['\$', '₹', '€', '£'],
                onChanged: (val) {
                  currentCurrencyCtrl.text = val ?? "";

                  saveData();

                  setState(() {});
                },
              ),
            ),
            const SizedBox(width: 10),

            Expanded(
              flex: 4,
              child: AppInput(
                "Current Salary (annual)",
                controller: currentSalaryCtrl,
                onChanged: (_) => saveData(),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

   

        if (experiences.any((e) => e.isCurrent == true)) ...[
  const SizedBox(height: 20),

  Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      const Text(
        "Current Company",
        style: TextStyle(color: Colors.white),
      ),

      const SizedBox(height: 8),

      AbsorbPointer(
        child: AppInput(
          "Current Company",
          controller: currentCompanyCtrl,
        ),
      ),
    ],
  ),

  const SizedBox(height: 12),

AppInput(
  "Official Company Email",
  controller: companyEmailCtrl,
  keyboardType: TextInputType.emailAddress,
  onChanged: (_) => saveData(),
),
const SizedBox(height: 6),

const Padding(
  padding: EdgeInsets.only(left: 4),

  child: Align(
    alignment: Alignment.centerLeft,

    child: Text(
      "Used only to verify employment — never shared publicly",

      style: TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    ),
  ),
),
const SizedBox(height: 12),
AppInput(
  "Total Years Of Experience",

  controller:
      totalYearsOfExperienceCtrl,

  keyboardType: TextInputType.text,

  onChanged: (_) => saveData(),
),

const SizedBox(height: 12),
  AppInput(
    "Notice Period (Days)",
    controller: noticePeriodCtrl,
    keyboardType: TextInputType.number,
    onChanged: (_) => saveData(),
  ),
  const SizedBox(height: 14),

/// SERVING NOTICE PERIOD
Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 6,
  ),

  decoration: BoxDecoration(
    color: AppColors.kCard,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: AppColors.kBorder,
    ),
  ),

  child: Row(
    children: [
      const Expanded(
        child: Text(
          "Currently Serving Notice Period",
          style: TextStyle(color: Colors.white),
        ),
      ),

      Switch(
        value: servingNoticePeriod,

        activeColor: AppColors.kGreen,

        onChanged: (value) {
          setState(() {
            servingNoticePeriod = value;

            saveData();
          });
        },
      ),
    ],
  ),
),
if (servingNoticePeriod) ...[
  const SizedBox(height: 14),

  /// NOTICE PERIOD START DATE
  GestureDetector(
    onTap: () async {
      final picked = await showDatePicker(
        context: context,

        initialDate: DateTime.now(),

        firstDate: DateTime(2000),

        lastDate: DateTime(2100),
      );

      if (picked != null) {
        noticePeriodStartDateCtrl.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

        saveData();

        setState(() {});
      }
    },

    child: AbsorbPointer(
      child: AppInput(
        "Notice Period Start Date",
        controller:
            noticePeriodStartDateCtrl,
      ),
    ),
  ),

],],
         

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
                        FocusScope.of(context).unfocus();

                        experiences[i] = experiences[i].copyWith(
                          company: actualValue,

                          // isCurrent: experiences[i].isCurrent ?? false,
                        );

                        saveData();

                        setState(() {});
                      },

                      fieldViewBuilder:
                          (context, controller, focusNode, onFieldSubmitted) {
                            // controller.text = companyCtrls[i].text;
                            if (controller.text != companyCtrls[i].text) {
                              controller.text = companyCtrls[i].text;

                              controller.selection = TextSelection.fromPosition(
                                TextPosition(offset: controller.text.length),
                              );
                            }
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

                                  // isCurrent: experiences[i].isCurrent ?? false,
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
SizedBox(height: 10,),
        Autocomplete<String>(
  optionsBuilder:
      (textEditingValue) {

    final query =
        textEditingValue.text;

    final filtered =
        jobTitleOptions.where(
      (option) => option
          .toLowerCase()
          .contains(
            query
                .toLowerCase(),
          ),
    );

    final exists =
        jobTitleOptions.any(
      (e) =>
          e
              .toLowerCase()
              .trim() ==
          query
              .toLowerCase()
              .trim(),
    );

    if (query
            .trim()
            .isNotEmpty &&
        !exists) {

      return [
        ...filtered,
        'Create "$query"',
      ];
    }

    return filtered;
  },

  onSelected:
      (value) async {

    final actualValue =
        value.startsWith(
              'Create "',
            )
            ? value
                .replaceAll(
                  'Create "',
                  '',
                )
                .replaceAll(
                  '"',
                  '',
                )
            : value;

    await addRoleIfNeeded(
      actualValue,
    );

    roleCtrls[i].text =
        actualValue;

    experiences[i] =
        experiences[i]
            .copyWith(
      role: actualValue,
    );

    saveData();

    setState(() {});
  },

  fieldViewBuilder: (
    context,
    controller,
    focusNode,
    onFieldSubmitted,
  ) {

    if (controller.text !=
        roleCtrls[i].text) {

      controller.text =
          roleCtrls[i].text;

      controller.selection =
          TextSelection
              .fromPosition(
        TextPosition(
          offset: controller
              .text
              .length,
        ),
      );
    }

    return TextField(
      controller:
          controller,

      focusNode:
          focusNode,

      style:
          const TextStyle(
        color:
            Colors.white,
      ),

      decoration:
          InputDecoration(
        hintText: "Role",

        filled: true,

        fillColor:
            AppColors.kCard,

        border:
            OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(
            12,
          ),
        ),
      ),

      onChanged: (
        value,
      ) {

        roleCtrls[i].text =
            value;

        experiences[i] =
            experiences[i]
                .copyWith(
          role: value,
        );

        saveData();

        setState(() {});
      },
    );
  },

  optionsViewBuilder:
      (
        context,
        onSelected,
        options,
      ) {

    return Material(
      color: Colors.black,

      child: Container(
        width:
            MediaQuery.of(
                  context,
                )
                .size
                .width -
            32,

        constraints:
            const BoxConstraints(
          maxHeight: 220,
        ),

        child:
            ListView.builder(
          shrinkWrap: true,

          itemCount:
              options.length,

          itemBuilder:
              (
                context,
                index,
              ) {

            final option =
                options
                    .elementAt(
              index,
            );

            return ListTile(
              title: Text(
                option,

                style:
                    const TextStyle(
                  color: Colors.white,
                ),
              ),

              onTap: () {
                onSelected(
                  option,
                );
              },
            );
          },
        ),
      ),
    );
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
                        // isCurrent: experiences[i].isCurrent ?? false,
                      );

                      saveData();
                      setState(() {});
                    }
                  },
                  child: AbsorbPointer(
                    child: AppInput("Start Date", controller: startCtrls[i]),
                  ),
                ),
                                        SizedBox(height: 10,),

                (experiences[i].isCurrent ?? false)
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.kCard,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Present",
                          style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : GestureDetector(
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
                            );

                            saveData();

                            setState(() {});
                          }
                        },

                        child: AbsorbPointer(
                          child: AppInput("End Date", controller: endCtrls[i]),
                        ),
                      ),
                CheckboxListTile(
                  value: experiences[i].isCurrent ?? false,

                  activeColor: Colors.green,

                  contentPadding: EdgeInsets.zero,

                  title: const Text(
                    "Currently working here",
                    style: TextStyle(color: Colors.white),
                  ),

                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      /// 🔥 ONLY ONE CURRENT
                      for (int j = 0; j < experiences.length; j++) {
                        experiences[j] = experiences[j].copyWith(
                          isCurrent: false,
                        );
                      }

                      /// 🔥 CURRENT EXPERIENCE
                      experiences[i] = experiences[i].copyWith(
                        isCurrent: value,
                        endDate: value ? "" : endCtrls[i].text,
                      );

                      /// 🔥 CLEAR END DATE
                      if (value) {
                        endCtrls[i].clear();
                      } else {
                        noticePeriodCtrl.clear();
                      }
                      saveData();
                    });
                  },
                ),
                AppInput(
                  "Description",
                  controller: descCtrls[i],
                  maxLines: 3,
                  onChanged: (v) {
                    experiences[i] = experiences[i].copyWith(
                      description: v,
                      // isCurrent: experiences[i].isCurrent ?? false,
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
      

        const SizedBox(height: 20),

        // const Text(
        //   "Certifications and more",
        //   style: TextStyle(color: Colors.grey),
        // ),

        // const SizedBox(height: 10),

        // /// ABOUT
        // AppInput(
        //   "About",
        //   controller: aboutCtrl,
        //   maxLines: 4,
        //   onChanged: (_) => saveData(),
        // ),

        // const SizedBox(height: 8),

        // /// CERTIFICATIONS
        // AppMultiSelectChips(
        //   label: "Certifications",
        //   options: [
        //     "AWS Certified",
        //     "Google Cloud",
        //     "Azure",
        //     "PMP",
        //     "Scrum Master",
        //     "Oracle",
        //     "Cisco",
        //     "Others",
        //   ],
        //   initialValues: selectedList,
        //   onChanged: (val) {
        //     certifications = val.join(",");

        //     saveData();
        //   },
        // ),
        const SizedBox(height: 20),
      ],
    );
  }
}
