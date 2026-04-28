import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/input_widgets.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/wrapper.dart';

import '../../data/index.dart';
import '../index.dart';

class EducationPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const EducationPage({super.key, required this.onBack, required this.data});
  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  late TextEditingController collegeCtrl;
  late TextEditingController cgpaCtrl;
  List<Map<String, dynamic>> colleges = [];
  bool loadingColleges = true;
  String? selectedDegree;
  String? selectedSpecialization;
  String? selectedSemester;
  String? selectedYear;
  Future<void> fetchColleges() async {
    final result = await getIt<RevampOnboardingRepository>().getColleges();

    result.fold((_) {}, (r) {
      colleges = r;
    });

    setState(() {
      loadingColleges = false;
    });
  }

  Future<void> registerCollegeIfNeeded(String value) async {
    final exists = colleges.any(
      (e) =>
          e['label'].toString().toLowerCase().trim() ==
          value.toLowerCase().trim(),
    );

    if (exists) return;

    final result = await getIt<RevampOnboardingRepository>().registerCollege(
      name: value,
    );

    result.fold((_) {}, (r) {
      colleges.add(r);
    });
  }

  @override
  void initState() {
    super.initState();

    fetchColleges();

  Future.microtask(() async {
  await getIt<MyProfileViewModel>()
      .getDegrees();

  if (mounted) {
    setState(() {});
  }
});
    final d = widget.data;

    collegeCtrl = TextEditingController(text: d.college);

    cgpaCtrl = TextEditingController(text: d.cgpa);

    selectedDegree = d.degree;
    selectedSpecialization = d.specialization;

    selectedSemester = d.semester;

    selectedYear = d.yearOfGraduation;
  }

  /// 🔥 DEGREE OPTIONS
  final List<String> degreeOptions = [
    "B.Tech",
    "B.E",
    "Bachelor of Science",
    "BCA",
    "B.Com",
    "BA",
    "M.Tech",
    "M.E",
    "MSc",
    "MBA",
    "MCA",
    "PhD",
    "Diploma",
    "Other",
  ];

  /// 🔥 COMPLETE DEGREE → SPECIALIZATION MAP
  final Map<String, List<String>> specializationMap = {
    "B.Tech": [
      "Computer Science & Engineering",
      "Information Technology",
      "Electronics & Communication Engineering",
      "Electrical Engineering",
      "Mechanical Engineering",
      "Civil Engineering",
      "Data Science & AI",
      "Cybersecurity",
      "Other",
    ],
    "B.E": [
      "Computer Engineering",
      "Electronics Engineering",
      "Electrical Engineering",
      "Mechanical Engineering",
      "Civil Engineering",
      "Other",
    ],
    "Bachelor of Science": [
      "Computer Science",
      "Physics",
      "Chemistry",
      "Mathematics",
      "Biology",
      "Other",
    ],
    "BCA": [
      "Computer Applications",
      "Software Development",
      "Data Analytics",
      "Cloud Computing",
      "Other",
    ],
    "B.Com": ["Accounting & Finance", "Banking", "Taxation", "Other"],
    "BA": [
      "English Literature",
      "History",
      "Political Science",
      "Psychology",
      "Other",
    ],
    "M.Tech": [
      "Computer Science",
      "Data Science",
      "AI",
      "Cybersecurity",
      "Other",
    ],
    "M.E": [
      "Computer Engineering",
      "Mechanical Engineering",
      "Civil Engineering",
      "Other",
    ],
    "MSc": [
      "Computer Science",
      "Physics",
      "Mathematics",
      "Data Science",
      "Other",
    ],
    "MBA": [
      "Finance",
      "Marketing",
      "Human Resources",
      "Operations",
      "Business Analytics",
      "Other",
    ],
    "MCA": [
      "Software Engineering",
      "Cloud Computing",
      "Artificial Intelligence",
      "Other",
    ],
    "PhD": ["Computer Science", "Engineering", "Management", "Other"],
    "Diploma": [
      "Computer Engineering",
      "Mechanical",
      "Civil",
      "Electrical",
      "Other",
    ],
    "Other": ["Other"],
  };
  void saveData() {
    final currentUser = context.read<AppStateProvider>().data ?? widget.data;

    final updatedUser = currentUser.copyWith(
      college: collegeCtrl.text,
      cgpa: cgpaCtrl.text,
      degree: selectedDegree,
      specialization: selectedSpecialization,
      semester: selectedSemester,
      yearOfGraduation: selectedYear,
    );

    context.read<AppStateProvider>().data = updatedUser;
  }

  /// 🔥 SEMESTERS
  final List<String> semesterOptions = List.generate(
    8,
    (i) => "Semester ${i + 1}",
  );

  /// 🔥 YEARS
  final List<String> graduationYears = List.generate(
    91,
    (i) => (1960 + i).toString(),
  );

  /// 🔥 SPECIALIZATION LOGIC (FIXED)
  List<String> getSpecializations() {
    if (selectedDegree == null) return ["Select degree first"];
    return specializationMap[selectedDegree!] ?? ["Other"];
  }

  @override
  Widget build(BuildContext context) {
    final isProfessional =
        getIt<AppStateProvider>().userType == UserType.professional;

    final isFresher = getIt<AppStateProvider>().userType == UserType.fresher;

    return Wrapper(
      title: "Education",
      children: [
        /// 🔙 HEADER
        AppHeader(
          title: "Your Educational",
          highlight: "details",
          onBack: widget.onBack,
        ),

        const SizedBox(height: 10),

        const Text(
          "What's your qualifications?",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 16),

        /// 🔥 COLLEGE
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("College", style: TextStyle(color: Colors.white)),

            const SizedBox(height: 8),

            Autocomplete<String>(
              initialValue: TextEditingValue(text: collegeCtrl.text),

              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return colleges.map((e) => e['label'].toString());
                }

                return colleges
                    .map((e) => e['label'].toString())
                    .where(
                      (option) => option.toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      ),
                    );
              },

              onSelected: (value) {
                collegeCtrl.text = value;
                saveData();
              },

              fieldViewBuilder:
                  (context, controller, focusNode, onFieldSubmitted) {
                    controller.text = collegeCtrl.text;

                    return TextField(
                      controller: controller,
                      focusNode: focusNode,

                      style: const TextStyle(color: Colors.white),

                      decoration: InputDecoration(
                        hintText: "Enter college",

                        hintStyle: const TextStyle(color: Colors.grey),

                        filled: true,
                        fillColor: Colors.black,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      onChanged: (value) {
                        collegeCtrl.text = value;
                        saveData();
                      },

                      onSubmitted: (value) async {
                        collegeCtrl.text = value;

                        saveData();

                        await registerCollegeIfNeeded(value);
                      },
                    );
                  },

            optionsViewBuilder: (
  context,
  onSelected,
  options,
) {
  return Align(
    alignment: Alignment.topLeft,

    child: Material(
      elevation: 8,

      borderRadius:
          BorderRadius.circular(12),

      child: Container(
        width:
            MediaQuery.of(context)
                .size
                .width -
            32,

        constraints:
            const BoxConstraints(
              maxHeight: 220,
            ),

        decoration: BoxDecoration(
          color: Colors.black,

          borderRadius:
              BorderRadius.circular(
                12,
              ),

          border: Border.all(
            color: Colors.grey,
          ),
        ),

        child: ListView.separated(
          shrinkWrap: true,

          padding: EdgeInsets.zero,

          itemCount: options.length,

          separatorBuilder:
              (_, __) =>
                  Divider(
                    height: 1,
                    color:
                        Colors.grey
                            .shade800,
                  ),

          itemBuilder: (
            context,
            index,
          ) {
            final option =
                options.elementAt(
                  index,
                );

            return ListTile(
              dense: true,

              title: Text(
                option,

                style:
                    const TextStyle(
                      color:
                          Colors.white,
                    ),
              ),

              onTap: () {
                onSelected(option);
              },
            );
          },
        ),
      ),
    ),
  );
},
            ),
          ],
        ),
const SizedBox(height: 16),
        /// 🔥 DEGREE
       Column(
  crossAxisAlignment:
      CrossAxisAlignment.start,
  children: [
    const Text(
      "Degree",
      style: TextStyle(
        color: Colors.white,
      ),
    ),

    const SizedBox(height: 8),

    Autocomplete<String>(
      initialValue: TextEditingValue(
        text: selectedDegree ?? '',
      ),

      optionsBuilder: (
        textEditingValue,
      ) {
        final options =
            getIt<MyProfileViewModel>()
                .degrees
                .map(
                  (e) => e['value']
                      .toString(),
                )
                .toList();

        if (textEditingValue
            .text
            .isEmpty) {
          return options;
        }

        return options.where(
          (option) => option
              .toLowerCase()
              .contains(
                textEditingValue.text
                    .toLowerCase(),
              ),
        );
      },

      onSelected: (value) {
        final vm =
            getIt<MyProfileViewModel>();

        final selected =
            vm.degrees.firstWhere(
              (e) =>
                  e['value'] ==
                  value,
              orElse: () => {},
            );

        setState(() {
          selectedDegree = value;
          selectedSpecialization =
              null;
        });

        if (selected.isNotEmpty) {
          vm
              .getStreams(
                selected['_id'],
              )
              .then((_) {
                if (mounted) {
                  setState(() {});
                }
              });
        }

        saveData();
      },

      fieldViewBuilder: (
        context,
        controller,
        focusNode,
        onFieldSubmitted,
      ) {
        controller.text =
            selectedDegree ?? '';

        return TextField(
          controller: controller,
          focusNode: focusNode,

          style: const TextStyle(
            color: Colors.white,
          ),

          decoration:
              InputDecoration(
                hintText:
                    "Select degree",

                hintStyle:
                    const TextStyle(
                      color:
                          Colors.grey,
                    ),

                filled: true,
                fillColor:
                    Colors.black,

                border:
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                    ),
              ),

       onChanged: (value) {
  selectedDegree = value;
  saveData();
},

onSubmitted: (value) async {
  final vm =
      getIt<MyProfileViewModel>();

  await vm.addDegreeIfNeeded(
    value,
  );

  setState(() {
    selectedDegree = value;
  });

  saveData();
},
        );
      },

    optionsViewBuilder: (
  context,
  onSelected,
  options,
) {
  return Align(
    alignment: Alignment.topLeft,

    child: Material(
      elevation: 8,

      borderRadius:
          BorderRadius.circular(12),

      child: Container(
        width:
            MediaQuery.of(context)
                .size
                .width -
            32,

        constraints:
            const BoxConstraints(
              maxHeight: 220,
            ),

        decoration: BoxDecoration(
          color: Colors.black,

          borderRadius:
              BorderRadius.circular(
                12,
              ),

          border: Border.all(
            color: Colors.grey,
          ),
        ),

        child: ListView.separated(
          shrinkWrap: true,

          padding: EdgeInsets.zero,

          itemCount: options.length,

          separatorBuilder:
              (_, __) =>
                  Divider(
                    height: 1,
                    color:
                        Colors.grey
                            .shade800,
                  ),

          itemBuilder: (
            context,
            index,
          ) {
            final option =
                options.elementAt(
                  index,
                );

            return ListTile(
              dense: true,

              title: Text(
                option,

                style:
                    const TextStyle(
                      color:
                          Colors.white,
                    ),
              ),

              onTap: () {
                onSelected(option);
              },
            );
          },
        ),
      ),
    ),
  );
},
    ),
  ],
),
const SizedBox(height: 16),
        /// 🔥 SPECIALIZATION
     Column(
  crossAxisAlignment:
      CrossAxisAlignment.start,
  children: [
    const Text(
      "Specialization",
      style: TextStyle(
        color: Colors.white,
      ),
    ),

    const SizedBox(height: 8),

    Autocomplete<String>(
      initialValue: TextEditingValue(
        text:
            selectedSpecialization ??
            '',
      ),

      optionsBuilder: (
        textEditingValue,
      ) {
        final options =
            getIt<MyProfileViewModel>()
                .streams
                .map(
                  (e) => e['value']
                      .toString(),
                )
                .toList();

        if (textEditingValue
            .text
            .isEmpty) {
          return options;
        }

        return options.where(
          (option) => option
              .toLowerCase()
              .contains(
                textEditingValue.text
                    .toLowerCase(),
              ),
        );
      },

      onSelected: (value) {
        setState(() {
          selectedSpecialization =
              value;
        });

        saveData();
      },

      fieldViewBuilder: (
        context,
        controller,
        focusNode,
        onFieldSubmitted,
      ) {
        controller.text =
            selectedSpecialization ??
            '';

        return TextField(
          controller: controller,
          focusNode: focusNode,

          style: const TextStyle(
            color: Colors.white,
          ),

          decoration:
              InputDecoration(
                hintText:
                    "Select specialization",

                hintStyle:
                    const TextStyle(
                      color:
                          Colors.grey,
                    ),

                filled: true,
                fillColor:
                    Colors.black,

                border:
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                    ),
              ),

         onChanged: (value) {
  selectedSpecialization =
      value;

  saveData();
},

onSubmitted: (value) async {
  final vm =
      getIt<MyProfileViewModel>();

  if (vm.selectedDegreeId ==
      null) {
    return;
  }

  await vm.addStreamIfNeeded(
    value: value,

    parentId:
        vm.selectedDegreeId!,
  );

  setState(() {
    selectedSpecialization =
        value;
  });

  saveData();
},
        );
      },

    optionsViewBuilder: (
  context,
  onSelected,
  options,
) {
  return Align(
    alignment: Alignment.topLeft,

    child: Material(
      elevation: 8,

      borderRadius:
          BorderRadius.circular(12),

      child: Container(
        width:
            MediaQuery.of(context)
                .size
                .width -
            32,

        constraints:
            const BoxConstraints(
              maxHeight: 220,
            ),

        decoration: BoxDecoration(
          color: Colors.black,

          borderRadius:
              BorderRadius.circular(
                12,
              ),

          border: Border.all(
            color: Colors.grey,
          ),
        ),

        child: ListView.separated(
          shrinkWrap: true,

          padding: EdgeInsets.zero,

          itemCount: options.length,

          separatorBuilder:
              (_, __) =>
                  Divider(
                    height: 1,
                    color:
                        Colors.grey
                            .shade800,
                  ),

          itemBuilder: (
            context,
            index,
          ) {
            final option =
                options.elementAt(
                  index,
                );

            return ListTile(
              dense: true,

              title: Text(
                option,

                style:
                    const TextStyle(
                      color:
                          Colors.white,
                    ),
              ),

              onTap: () {
                onSelected(option);
              },
            );
          },
        ),
      ),
    ),
  );
},
    ),
  ],
),
const SizedBox(height: 16),
        /// 🔥 SEMESTER
        if (!isProfessional && !isFresher)
          AppDropdown(
            hint: "Semester",
            options: semesterOptions,
            value: selectedSemester,
            onChanged: (val) {
              setState(() {
                selectedSemester = val;
                saveData();
              });
            },
          ),

        /// 🔥 GRADUATION YEAR
        AppDropdown(
          hint: "Graduation Year",
          options: graduationYears,
          value: selectedYear,
          onChanged: (val) {
            setState(() {
              selectedYear = val;
              saveData();
            });
          },
        ),

        /// 🔥 CGPA
        if (!isProfessional)
          AppInput("CGPA", controller: cgpaCtrl, onChanged: (_) => saveData()),

        const SizedBox(height: 20),
      ],
    );
  }

  @override
  void dispose() {
    collegeCtrl.dispose();
    cgpaCtrl.dispose();
    super.dispose();
  }
}
