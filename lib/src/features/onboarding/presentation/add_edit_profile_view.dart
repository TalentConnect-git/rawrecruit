import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/view_model/add_edit_profile_view_model.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/widgets/profile_image.dart';

class AddEditProfileView extends StatefulWidget {
  const AddEditProfileView({this.userProfile, super.key});

  final UserProfile? userProfile;

  @override
  State<AddEditProfileView> createState() => _AddEditProfileViewState();
}

class _AddEditProfileViewState extends State<AddEditProfileView> {
  final AddEditProfileViewModel addEditProfileViewModel =
      AddEditProfileViewModel();
  late UserProfileController controller =
      addEditProfileViewModel.userProfileController;
  final _formKey = GlobalKey<FormState>();
  bool _isParsingResume = false;
  File? _pickedResumeFile;

  List<String> degreeOptions = [
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

  final semesterOptions = List.generate(8, (index) => "Semester ${index + 1}");

  final graduationYears = List.generate(
    91,
    (index) => (1960 + index).toString(),
  );

  final industryOptions = [
    "Technology",
    "Finance",
    "Healthcare",
    "Education",
    "Manufacturing",
    "Retail",
    "Automobile",
    "Construction",
    "Telecommunications",
    "Media",
    "Hospitality",
    "Pharmaceutical",
    "Energy",
    "Logistics",
    "Agriculture",
  ];

  final jobRoleOptions = [
    "Software Developer",
    "Frontend Developer",
    "Backend Developer",
    "Full Stack Developer",
    "Mobile App Developer",
    "UI/UX Designer",
    "Data Analyst",
    "Data Scientist",
    "Machine Learning Engineer",
    "DevOps Engineer",
    "Cloud Architect",
    "QA Engineer",
    "Cyber Security Specialist",
    "Network Engineer",
    "Business Analyst",
    "Product Manager",
    "Project Manager",
    "HR Recruiter",
    "Marketing Specialist",
    "Sales Executive",
    "Finance Analyst",
  ];

  final employmentOptions = ["Full-time", "Part-time", "Contract"];

  final lookingForOptions = ["Internship", "Job", "Both"];

  final genderOptions = ["Male", "Female", "Non-binary", "Prefer not to say"];

  final toolsOptions = [
    "VS Code",
    "Android Studio",
    "Xcode",
    "Postman",
    "Docker",
    "Kubernetes",
    "GitHub",
    "GitLab",
    "JIRA",
    "Slack",
    "Figma",
    "Adobe XD",
    "Jenkins",
    "Firebase",
    "AWS Console",
    "Google Cloud Platform",
  ];

  final languageOptions = [
    "English",
    "Hindi",
    "Marathi",
    "Gujarati",
    "Tamil",
    "Telugu",
    "Kannada",
    "Malayalam",
    "Punjabi",
    "Bengali",
    "French",
    "German",
    "Spanish",
    "Japanese",
    "Chinese",
  ];
  @override
  void initState() {
    super.initState();

    controller.skills.add(TextEditingController());
    controller.domainKnowledge.add(TextEditingController());
    controller.employmentType.add(TextEditingController());
    controller.industry.add(TextEditingController());
    controller.jobRoles.add(TextEditingController());
    controller.languagesKnown.add(TextEditingController());
    controller.locations.add(TextEditingController());
    controller.lookingFor.add(TextEditingController());
    controller.toolsAndPlatforms.add(TextEditingController());

    controller.achievements.add(AchievementController());
    controller.awards.add(AwardController());
    controller.publications.add(PublicationController());

    addEditProfileViewModel.setUserProfileController(widget.userProfile);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: addEditProfileViewModel,
      child: Stack(
        children: [
          Scaffold(
            appBar: RAppBar(
              leading: widget.userProfile != null
                  ? IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.keyboard_arrow_left),
                    )
                  : null,
              title: Text(
                widget.userProfile != null
                    ? 'Edit Profile'
                    : 'Complete your profile',
                style: AppTextStyles.s16W600,
              ),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    AppButton(
                      onPressed: parseResumeAndFill,
                      child: const Text('Upload Resume & Autofill'),
                    ),

                    /// ---------------- BASIC ----------------
                    ProfileSection(
                      label: 'Basic',
                      spacing: 16,
                      children: [
                        ProfileImage(
                          imagePath: widget.userProfile?.profileImage ?? '',
                          onImageSelected: (image) {
                            addEditProfileViewModel.pickedImage = image;
                          },
                        ),
                        AppTextFields(
                          controller: controller.name,
                          hint: 'Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                        AppTextFields(
                          controller: controller.email,
                          hint: 'Email',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        AppTextFields(
                          controller: controller.phone,
                          hint: 'Phone',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number is required';
                            }
                            return null;
                          },
                        ),
                        _dropdownField(
                          controller.gender,
                          'Gender',
                          genderOptions,
                        ),
                        AppTextFields(controller: controller.dob, hint: 'DOB'),
                        AppTextFields(
                          controller: controller.ethnicity,
                          hint: 'Ethnicity',
                        ),
                        AppTextFields(
                          controller: controller.maritalStatus,
                          hint: 'Marital Status',
                        ),
                        AppTextFields(
                          controller: controller.visaStatus,
                          hint: 'Visa Status',
                        ),
                      ],
                    ),

                    /// ---------------- EDUCATION ----------------
                    ProfileSection(
                      label: 'Education',
                      spacing: 16,
                      children: [
                        AppTextFields(
                          controller: controller.college,
                          hint: 'College',
                        ),
                        _dropdownField(
                          controller.degree,
                          'Degree',
                          degreeOptions,
                        ),
                        _dropdownField(
                          controller.semester,
                          'Semester',
                          semesterOptions,
                        ),
                        _dropdownField(
                          controller.yearOfGraduation,
                          'Graduation Year',
                          graduationYears,
                        ),
                        AppTextFields(
                          controller: controller.specialization,
                          hint: 'Specialization',
                        ),
                        AppTextFields(
                          controller: controller.cgpa,
                          hint: 'CGPA',
                        ),
                      ],
                    ),

                    /// ---------------- LINKS ----------------
                    ProfileSection(
                      label: 'Links',
                      spacing: 16,
                      children: [
                        AppTextFields(
                          controller: controller.github,
                          hint: 'Github',
                        ),
                        AppTextFields(
                          controller: controller.linkedin,
                          hint: 'LinkedIn',
                        ),
                        AppTextFields(
                          controller: controller.portfolio,
                          hint: 'Portfolio',
                        ),
                        AppTextFields(
                          controller: controller.resume,
                          hint: 'Resume URL',
                        ),
                      ],
                    ),

                    /// ---------------- CAREER ----------------
                    ProfileSection(
                      label: 'Career',
                      spacing: 16,
                      children: [
                        AppTextFields(
                          controller: controller.openToShift,
                          hint: 'Open To Shift',
                        ),
                        AppTextFields(
                          controller: controller.currentSalaryAmount,
                          hint: 'Current Salary',
                        ),
                        AppTextFields(
                          controller: controller.currentSalaryCurrency,
                          hint: 'Current Currency',
                        ),
                        AppTextFields(
                          controller: controller.expectedSalaryAmount,
                          hint: 'Expected Salary',
                        ),
                        AppTextFields(
                          controller: controller.expectedSalaryCurrency,
                          hint: 'Expected Currency',
                        ),
                      ],
                    ),

                    /// ---------------- ABOUT ----------------
                    ProfileSection(
                      label: 'About',
                      spacing: 16,
                      children: [
                        AppTextFields(
                          controller: controller.about,
                          hint: 'About',
                        ),
                        AppTextFields(
                          controller: controller.certifications,
                          hint: 'Certifications',
                        ),
                      ],
                    ),

                    /// ---------------- STRING LIST SECTIONS ----------------
                    _chipInputField('Skills', controller.skills.first),
                    _profileListSection(
                      'Domain Knowledge',
                      controller.domainKnowledge,
                    ),
                    _chipDropdownField(
                      'Employment Type',
                      controller.employmentType.first,
                      employmentOptions,
                    ),
                    _chipDropdownField(
                      'Industry',
                      controller.industry.first,
                      industryOptions,
                    ),
                    _chipDropdownField(
                      'Job Roles',
                      controller.jobRoles.first,
                      jobRoleOptions,
                    ),
                    _chipDropdownField(
                      'Languages Known',
                      controller.languagesKnown.first,
                      languageOptions,
                    ),
                    _profileListSection('Locations', controller.locations),
                    _dropdownField(
                      controller.lookingFor.first,
                      'Looking For',
                      lookingForOptions,
                    ),
                    _chipDropdownField(
                      'Tools & Platforms',
                      controller.toolsAndPlatforms.first,
                      toolsOptions,
                    ),

                    /// ---------------- ACHIEVEMENTS ----------------
                    ProfileSection(
                      label: 'Achievements',
                      trailing: _addButton(() {
                        setState(
                          () => controller.achievements.add(
                            AchievementController(),
                          ),
                        );
                      }),
                      children: controller.achievements
                          .map(_achievementForm)
                          .toList(),
                    ),

                    /// ---------------- AWARDS ----------------
                    ProfileSection(
                      label: 'Awards',
                      trailing: _addButton(() {
                        setState(
                          () => controller.awards.add(AwardController()),
                        );
                      }),
                      children: controller.awards.map(_awardForm).toList(),
                    ),

                    /// ---------------- PUBLICATIONS ----------------
                    ProfileSection(
                      label: 'Publications',
                      trailing: _addButton(() {
                        setState(
                          () => controller.publications.add(
                            PublicationController(),
                          ),
                        );
                      }),
                      children: controller.publications
                          .map(_publicationForm)
                          .toList(),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Selector<AddEditProfileViewModel, bool>(
              selector: (_, vm) => vm.isLoading,
              builder: (_, isLoading, _) {
                if (isLoading) return SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final failure = await addEditProfileViewModel
                                .saveProfile();
                            Toasts.showSuccessOrFailureToast(
                              context,
                              failure: failure,
                              popOnSuccess: widget.userProfile != null,
                              successTitle: 'Profile Updated!',
                              successMsg: 'Profile updated successfully',
                              successCallback: () {
                                if (widget.userProfile == null) {
                                  context.goNamed(RouteNames.dashboard);
                                }
                              },
                            );
                          }
                        },
                        child: Text(
                          'Save Profile',
                          style: AppTextStyles.s16W600.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ✅ Overlay is now correctly placed as second child of Stack
          Selector<AddEditProfileViewModel, bool>(
            selector: (_, vm) => vm.isLoading,
            builder: (_, isLoading, _) {
              if (_isParsingResume || addEditProfileViewModel.isLoading) {
                return Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.45),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _achievementForm(AchievementController a) => Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Achievement ${controller.achievements.indexOf(a) + 1}',
        style: AppTextStyles.s14W600,
      ),
      AppTextFields(controller: a.title, hint: 'Title'),
      AppTextFields(controller: a.event, hint: 'Event'),
      AppTextFields(controller: a.date, hint: 'Date'),
      const AppDivider(),
    ],
  );

  Widget _awardForm(AwardController a) => Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Award ${controller.awards.indexOf(a) + 1}',
        style: AppTextStyles.s14W600,
      ),
      AppTextFields(controller: a.title, hint: 'Title'),
      AppTextFields(controller: a.organization, hint: 'Organization'),
      AppTextFields(controller: a.startDate, hint: 'Start Date'),
      AppTextFields(controller: a.endDate, hint: 'End Date'),
      AppTextFields(controller: a.description, hint: 'Description'),
      const AppDivider(),
    ],
  );

  Widget _publicationForm(PublicationController p) => Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Publication ${controller.publications.indexOf(p) + 1}',
        style: AppTextStyles.s14W600,
      ),
      AppTextFields(controller: p.title, hint: 'Title'),
      AppTextFields(controller: p.url, hint: 'URL'),
      const AppDivider(),
    ],
  );

  Widget _profileListSection(String label, List<TextEditingController> list) {
    return ProfileSection(
      label: label,
      trailing: _addButton(() {
        setState(() => list.add(TextEditingController()));
      }),
      children: list
          .map(
            (e) => AppTextFields(
              controller: e,
              hint: '$label ${list.indexOf(e) + 1}',
            ),
          )
          .toList(),
    );
  }

  Widget _addButton(VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        '+ Add',
        style: AppTextStyles.s16W400.copyWith(color: AppColors.primary),
      ),
    );
  }

  Widget _dropdownField(
    TextEditingController controller,
    String hint,
    List<String> options,
  ) {
    String? selectedValue = options.contains(controller.text)
        ? controller.text
        : null;

    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      hint: Text(hint),
      items: options
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (val) {
        controller.text = val ?? '';
        setState(() {});
      },
    );
  }

  Widget _chipDropdownField(
    String label,
    TextEditingController controller,
    List<String> options,
  ) {
    return _chipMultiSelectField(label, controller, options);
  }

  Widget _chipInputField(String label, TextEditingController controller) {
    return _chipMultiSelectField(label, controller, []);
  }
Widget _chipMultiSelectField(
  String label,
  TextEditingController controller,
  List<String> options,
) {
  return StatefulBuilder(
    builder: (context, setLocalState) {
      final fieldController = TextEditingController();
      final focusNode = FocusNode();

      List<String> selectedItems = controller.text.isEmpty
          ? []
          : controller.text.split(',').map((e) => e.trim()).toList();

      void syncController() {
        controller.text = selectedItems.join(', ');
      }

      void addItem(String value) {
        final trimmed = value.trim();

        if (trimmed.isEmpty) return;

        if (!selectedItems.contains(trimmed)) {
          selectedItems.add(trimmed);
          syncController();

          fieldController.clear(); // ✅ clears typed text
          focusNode.requestFocus(); // ✅ keeps cursor ready for next entry

          setLocalState(() {});
        }
      }

      void removeItem(String value) {
        selectedItems.remove(value);
        syncController();
        setLocalState(() {});
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),

          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...selectedItems.map(
                  (item) => Chip(
                    label: Text(item),
                    onDeleted: () => removeItem(item),
                  ),
                ),

                SizedBox(
                  width: 250,
                  child: Autocomplete<String>(
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text.isEmpty) return options;

                      return options.where(
                        (item) => item.toLowerCase().contains(
                          textEditingValue.text.toLowerCase(),
                        ),
                      );
                    },
                    onSelected: addItem,
                    fieldViewBuilder:
                        (context, textController, textFocusNode, onSubmit) {
                      return TextField(
                        controller: fieldController, // ✅ use same controller
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                          hintText: "Add",
                          border: InputBorder.none,
                        ),
                        onSubmitted: addItem,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

  Future<void> parseResumeAndFill() async {
    try {
      debugPrint("Starting resume upload");

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withData: false,
      );

      if (result == null) {
        debugPrint("No file selected");
        return;
      }

      final file = result.files.single;

      debugPrint("Selected file: ${file.name}");
      debugPrint("Path: ${file.path}");

      if (file.path == null) {
        debugPrint("File path is null");
        return;
      }

      // ← store file for submission + show loader
      _pickedResumeFile = File(file.path!);
      addEditProfileViewModel.pickedResumeFile =
          _pickedResumeFile; // ← ADD THIS
      setState(() => _isParsingResume = true);

      final dio = Dio(
        BaseOptions(
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
        ),
      );

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path!, filename: file.name),
      });

      debugPrint("Calling API now");

      final response = await dio.post(
        'https://resume-parser-sgtj.onrender.com/api/resume/parse',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      debugPrint("Response received: ${response.data}");

      final data = response.data;

      /// BASIC
      if (controller.name.text.isEmpty && data['name'] != null) {
        controller.name.text = data['name'];
      }

      if (controller.email.text.isEmpty && data['email'] != null) {
        controller.email.text = data['email'];
      }

      if (controller.phone.text.isEmpty && data['phone'] != null) {
        controller.phone.text = data['phone'];
      }

      if (controller.gender.text.isEmpty && data['gender'] != null) {
        controller.gender.text = data['gender'];
      }

      if (controller.about.text.isEmpty && data['about'] != null) {
        controller.about.text = data['about'];
      }

      if (controller.linkedin.text.isEmpty && data['linkedin_url'] != null) {
        controller.linkedin.text = data['linkedin_url'];
      }

      if (controller.github.text.isEmpty && data['github_url'] != null) {
        controller.github.text = data['github_url'];
      }

      if (controller.portfolio.text.isEmpty && data['portfolio_url'] != null) {
        controller.portfolio.text = data['portfolio_url'];
      }

      /// SKILLS
      if (data['skills'] != null && data['skills'] is List) {
        controller.skills.first.text = (data['skills'] as List).join(', ');
      }

      /// EDUCATION (latest one)
      if (data['education'] != null &&
          data['education'] is List &&
          (data['education'] as List).isNotEmpty) {
        final edu = data['education'].last;

        if (controller.college.text.isEmpty && edu['institution'] != null) {
          controller.college.text = edu['institution'];
        }

        if (edu['degree'] != null) {
          final parsedDegree = edu['degree'].toString();
          if (!degreeOptions.contains(parsedDegree)) {
            degreeOptions.add(parsedDegree);
          }
          controller.degree.text = parsedDegree;
        }

        if (controller.specialization.text.isEmpty &&
            edu['field_of_study'] != null) {
          controller.specialization.text = edu['field_of_study'];
        }

        if (controller.yearOfGraduation.text.isEmpty && edu['year'] != null) {
          controller.yearOfGraduation.text = edu['year'].toString();
        }

        if (controller.cgpa.text.isEmpty && edu['cgpa'] != null) {
          controller.cgpa.text = edu['cgpa'].toString();
        }
      }

      setState(() {});
    } catch (e) {
      debugPrint("FULL ERROR: $e");
    } finally {
      // ← always hide loader whether success or error
      setState(() => _isParsingResume = false);
    }
  }
}
