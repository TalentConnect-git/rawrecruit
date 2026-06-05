import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show
        OnboardingRepository,
        OnboardingLocalService,
        AppHeader,
        AppDropdown,
        AppInput,
        Wrapper,
        MyProfileViewModel;

import '../../../common/index.dart';
import '../../../core/models/education.dart';
import '../../profile/presentation/widgets/auto_complete_field.dart';
import 'education_controller.dart';

class EducationPage extends StatefulWidget {
  final VoidCallback onBack;
  final User data;

  const EducationPage({super.key, required this.onBack, required this.data});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final List<EducationController> educations = [];

  List<Map<String, dynamic>> colleges = [];

  bool loadingColleges = true;

  bool isInitialized = false;

  Future<void> fetchColleges() async {
    final result = await getIt<OnboardingRepository>().getColleges();

    result.fold((_) {}, (r) {
      colleges = r;
    });

    if (mounted) {
      setState(() {
        loadingColleges = false;
      });
    }
  }

  Future<void> registerCollegeIfNeeded(String value) async {
    final exists = colleges.any(
      (e) =>
          e['label'].toString().toLowerCase().trim() ==
          value.toLowerCase().trim(),
    );

    if (exists) return;

    final result = await getIt<OnboardingRepository>().registerCollege(
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
      await getIt<MyProfileViewModel>().getDegrees();

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInitialized) return;

    final d = context.read<AppStateProvider>().data ?? widget.data;

    educations.clear();

    if (d.educations != null && d.educations!.isNotEmpty) {
      for (final e in d.educations!) {
        final ec = EducationController();

        ec.college.text = e.college ?? '';

        ec.degree.text = e.degree ?? '';

        ec.specialization.text = e.specialization ?? '';

        ec.semester.text = e.semester ?? '';

        ec.cgpa.text = e.cgpa ?? '';

        ec.yearOfGraduation.text = e.yearOfGraduation ?? '';

        ec.startDate.text = e.startDate ?? '';

        ec.endDate.text = e.endDate ?? '';

        ec.educationType = e.educationType ?? "bachelors";

        ec.isCurrent = e.isCurrent ?? false;

        educations.add(ec);

        Future.microtask(() async {
          if (e.college != null && e.college!.trim().isNotEmpty) {
            await registerCollegeIfNeeded(e.college!);
          }

          final vm = getIt<MyProfileViewModel>();

          if (e.degree != null && e.degree!.trim().isNotEmpty) {
            await vm.addDegreeIfNeeded(e.degree!);

            await vm.getDegrees();

            final selected = vm.degrees.firstWhere(
              (d) => d['value'] == e.degree,

              orElse: () => {},
            );

            if (selected.isNotEmpty) {
              ec.selectedDegreeId = selected['_id'];

              await vm.getStreams(selected['_id']);

              ec.streams = vm.streams;

              if (e.specialization != null &&
                  e.specialization!.trim().isNotEmpty) {
                await vm.addStreamIfNeeded(
                  value: e.specialization!,

                  parentId: selected['_id'],
                );

                await vm.getStreams(selected['_id']);

                ec.streams = vm.streams;
              }

              if (mounted) {
                setState(() {});
              }
            }
          }
        });
      }
    } else {
      educations.add(EducationController());
    }

    isInitialized = true;
  }

  void saveData() {
    final currentUser = context.read<AppStateProvider>().data ?? widget.data;

    final updatedUser = currentUser.copyWith(
      educations: educations.map((e) {
        return Education(
          college: e.college.text,

          degree: e.degree.text,

          specialization: e.specialization.text,

          semester: e.semester.text,

          cgpa: e.cgpa.text,

          yearOfGraduation: e.yearOfGraduation.text,

          startDate: e.startDate.text,

          endDate: e.endDate.text,

          educationType: e.educationType,

          isCurrent: e.isCurrent,
        );
      }).toList(),
    );

    context.read<AppStateProvider>().data = updatedUser;

    getIt<OnboardingLocalService>().saveUser(updatedUser);
  }

  final List<String> semesterOptions = List.generate(
    8,
    (i) => "Semester ${i + 1}",
  );

  final List<String> graduationYears = List.generate(
    91,
    (i) => (1960 + i).toString(),
  );

  @override
  Widget build(BuildContext context) {
    final isProfessional =
        getIt<AppStateProvider>().userType == UserType.professional;

    final isFresher = getIt<AppStateProvider>().userType == UserType.fresher;

    return Wrapper(
      title: "Education",

      children: [
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

        ...educations.asMap().entries.map((entry) {
          final index = entry.key;

          final e = entry.value;

          return Container(
            margin: const EdgeInsets.only(bottom: 20),

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.black,

              borderRadius: BorderRadius.circular(16),

              border: Border.all(color: Colors.grey.shade800),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Text(
                      "Education ${index + 1}",

                      style: const TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.bold,

                        fontSize: 16,
                      ),
                    ),

                    const Spacer(),

                    if (educations.length > 1)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            educations.removeAt(index);

                            saveData();
                          });
                        },

                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                  ],
                ),

                const SizedBox(height: 16),

                CommonAutocomplete(
                  label: "College",

                  hint: "College",

                  options: colleges.map((e) => e['label'].toString()).toList(),

                  initialValue: e.college.text,

                  showCreateOption: true,

                  onChanged: (value) {
                    e.college.text = value;

                    saveData();
                  },

                  onSelected: (value) async {
                    await registerCollegeIfNeeded(value);

                    e.college.text = value;

                    saveData();
                  },

                  onCreate: (value) async {
                    await registerCollegeIfNeeded(value);

                    e.college.text = value;

                    saveData();

                    setState(() {});
                  },
                ),

                const SizedBox(height: 16),

                /// DEGREE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text("Degree", style: TextStyle(color: Colors.white)),

                    const SizedBox(height: 8),

                    CommonAutocomplete(
                      label: "Degree",

                      hint: "Degree",

                      options: getIt<MyProfileViewModel>().degrees
                          .map((e) => e['value'].toString())
                          .toList(),

                      initialValue: e.degree.text,

                      showCreateOption: true,

                      onChanged: (value) {
                        e.degree.text = value;

                        saveData();
                      },

                      onSelected: (value) async {
                        await getIt<MyProfileViewModel>().addDegreeIfNeeded(
                          value,
                        );

                        await getIt<MyProfileViewModel>().getDegrees();

                        e.degree.text = value;

                        final vm = getIt<MyProfileViewModel>();

                        final selected = vm.degrees.firstWhere(
                          (d) =>
                              d['value'].toString().toLowerCase() ==
                              value.toLowerCase(),

                          orElse: () => {},
                        );

                        if (selected.isNotEmpty) {
                          e.selectedDegreeId = selected['_id'];

                          await vm.getStreams(e.selectedDegreeId!);

                          e.streams = vm.streams;
                        }

                        saveData();

                        setState(() {});
                      },

                      onCreate: (value) async {
                        final vm = getIt<MyProfileViewModel>();

                        await vm.addDegreeIfNeeded(value);

                        await vm.getDegrees();

                        e.degree.text = value;

                        saveData();

                        setState(() {});
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// SPECIALIZATION
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Specialization",

                      style: TextStyle(color: Colors.white),
                    ),

                    const SizedBox(height: 8),
                    CommonAutocomplete(
                      label: "Specialization",

                      hint: "Specialization",

                      options: e.streams
                          .map((s) => s['value'].toString())
                          .toList(),

                      initialValue: e.specialization.text,

                      showCreateOption: true,

                      onChanged: (value) {
                        e.specialization.text = value;

                        saveData();
                      },

                      onSelected: (value) {
                        e.specialization.text = value;

                        saveData();
                      },

                      onCreate: (value) async {
                        if (e.selectedDegreeId != null) {
                          final vm = getIt<MyProfileViewModel>();

                          await vm.addStreamIfNeeded(
                            value: value,

                            parentId: e.selectedDegreeId!,
                          );

                          await vm.getStreams(e.selectedDegreeId!);

                          e.streams = vm.streams;
                        }

                        e.specialization.text = value;

                        saveData();

                        setState(() {});
                      },
                    ),
                  ],
                ),

                if (!isProfessional && !isFresher) ...[
                  const SizedBox(height: 16),
                  AppDropdown(
                    hint: "Semester",

                    options: semesterOptions,

                    value: e.semester.text.isEmpty ? null : e.semester.text,

                    onChanged: (val) {
                      setState(() {
                        e.semester.text = val ?? '';

                        saveData();
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  AppInput(
                    "Start Date",

                    controller: e.startDate,

                    onChanged: (_) {
                      saveData();
                    },
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Checkbox(
                        value: e.isCurrent,

                        onChanged: (val) {
                          setState(() {
                            e.isCurrent = val ?? false;

                            if (e.isCurrent) {
                              e.endDate.clear();
                            }

                            saveData();
                          });
                        },
                      ),

                      const Text(
                        "Currently Studying",

                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  if (!(e.isCurrent))
                    AppInput(
                      "End Date",

                      controller: e.endDate,

                      onChanged: (_) {
                        saveData();
                      },
                    ),
                ],

                const SizedBox(height: 16),

                AppDropdown(
                  hint: "Graduation Year",

                  options: graduationYears,

                  value: e.yearOfGraduation.text.isEmpty
                      ? null
                      : e.yearOfGraduation.text,

                  onChanged: (val) {
                    setState(() {
                      e.yearOfGraduation.text = val ?? '';

                      saveData();
                    });
                  },
                ),

                const SizedBox(height: 16),

                if (!isProfessional)
                  AppInput(
                    "CGPA",

                    controller: e.cgpa,

                    onChanged: (_) {
                      saveData();
                    },
                  ),
              ],
            ),
          );
        }),

        const SizedBox(height: 10),

        AppButton(
          label: "Add Education",

          onPressed: () {
            setState(() {
              educations.add(EducationController());

              saveData();
            });
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  @override
  void dispose() {
    for (final e in educations) {
      e.college.dispose();

      e.degree.dispose();

      e.specialization.dispose();

      e.semester.dispose();

      e.cgpa.dispose();

      e.yearOfGraduation.dispose();

      e.startDate.dispose();

      e.endDate.dispose();
    }

    super.dispose();
  }
}
