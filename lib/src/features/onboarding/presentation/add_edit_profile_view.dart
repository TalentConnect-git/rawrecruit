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

  // ── Enum lists ──────────────────────────────────────────────────────────────

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

  /// Specialization options keyed by degree.
  /// Falls back to [_defaultSpecializations] if degree not found.
  static const Map<String, List<String>> _specializationByDegree = {
    "B.Tech": [
      "Computer Science & Engineering",
      "Information Technology",
      "Electronics & Communication Engineering",
      "Electrical Engineering",
      "Mechanical Engineering",
      "Civil Engineering",
      "Chemical Engineering",
      "Aerospace Engineering",
      "Biotechnology",
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
      "Chemical Engineering",
      "Production Engineering",
      "Instrumentation Engineering",
      "Other",
    ],
    "Bachelor of Science": [
      "Computer Science",
      "Physics",
      "Chemistry",
      "Mathematics",
      "Statistics",
      "Biology",
      "Biochemistry",
      "Environmental Science",
      "Microbiology",
      "Data Science",
      "Other",
    ],
    "BCA": [
      "Computer Applications",
      "Software Development",
      "Data Analytics",
      "Cloud Computing",
      "Cybersecurity",
      "Other",
    ],
    "B.Com": [
      "Accounting & Finance",
      "Banking & Insurance",
      "Taxation",
      "Business Economics",
      "E-Commerce",
      "Other",
    ],
    "BA": [
      "English Literature",
      "History",
      "Political Science",
      "Economics",
      "Psychology",
      "Sociology",
      "Philosophy",
      "Mass Communication",
      "Journalism",
      "Other",
    ],
    "M.Tech": [
      "Computer Science & Engineering",
      "Data Science & Machine Learning",
      "VLSI Design",
      "Embedded Systems",
      "Software Engineering",
      "Cybersecurity",
      "Robotics & Automation",
      "Thermal Engineering",
      "Structural Engineering",
      "Power Systems",
      "Other",
    ],
    "M.E": [
      "Computer Engineering",
      "Electronics Engineering",
      "Structural Engineering",
      "Thermal Engineering",
      "Manufacturing Engineering",
      "Other",
    ],
    "MSc": [
      "Computer Science",
      "Data Science",
      "Physics",
      "Chemistry",
      "Mathematics",
      "Statistics",
      "Biotechnology",
      "Environmental Science",
      "Other",
    ],
    "MBA": [
      "Finance",
      "Marketing",
      "Human Resources",
      "Operations Management",
      "Information Technology",
      "Business Analytics",
      "International Business",
      "Entrepreneurship",
      "Supply Chain Management",
      "Other",
    ],
    "MCA": [
      "Software Engineering",
      "Data Science",
      "Cloud Computing",
      "Cybersecurity",
      "Artificial Intelligence",
      "Other",
    ],
    "PhD": [
      "Computer Science",
      "Electronics",
      "Mechanical Engineering",
      "Civil Engineering",
      "Physics",
      "Chemistry",
      "Mathematics",
      "Management",
      "Life Sciences",
      "Social Sciences",
      "Other",
    ],
    "Diploma": [
      "Computer Engineering",
      "Electronics & Telecommunication",
      "Mechanical Engineering",
      "Civil Engineering",
      "Electrical Engineering",
      "Information Technology",
      "Other",
    ],
    "Other": [
      "Other",
    ],
  };

  static const List<String> _defaultSpecializations = ["Other"];

  /// Returns the specialization options for the currently selected degree.
  List<String> get _currentSpecializationOptions {
    final deg = controller.degree.text;
    if (deg.isEmpty) return _defaultSpecializations;
    return _specializationByDegree[deg] ?? _defaultSpecializations;
  }

  final semesterOptions = List.generate(8, (i) => "Semester ${i + 1}");

  final graduationYears =
      List.generate(91, (i) => (1960 + i).toString());

  final industryOptions = [
    "Technology", "Finance", "Healthcare", "Education", "Manufacturing",
    "Retail", "Automobile", "Construction", "Telecommunications", "Media",
    "Hospitality", "Pharmaceutical", "Energy", "Logistics", "Agriculture",
    "Others",
  ];

  final jobRoleOptions = [
    "Software Developer", "Frontend Developer", "Backend Developer",
    "Full Stack Developer", "Mobile App Developer", "UI/UX Designer",
    "Data Analyst", "Data Scientist", "Machine Learning Engineer",
    "DevOps Engineer", "Cloud Architect", "QA Engineer",
    "Cyber Security Specialist", "Network Engineer", "Business Analyst",
    "Product Manager", "Project Manager", "HR Recruiter",
    "Marketing Specialist", "Sales Executive", "Finance Analyst",
    "Others",
  ];

  final employmentOptions = ["Full-time", "Part-time", "Contract", "Others"];

  final lookingForOptions = ["Internship", "Job", "Both"];

  final genderOptions = [
    "Male", "Female", "Non-binary", "Prefer not to say",
  ];

  final ethnicityOptions = [
    "Asian",
    "Black or African American",
    "Hispanic or Latino",
    "Native American or Alaska Native",
    "White",
    "Two or More Races",
    "Prefer not to say",
  ];

  final visaStatusOptions = [
    "Citizen",
    "Permanent Resident",
    "Work Visa (e.g., H1B)",
    "Student Visa (e.g., F1)",
    "Not Authorized to Work",
    "Other",
  ];

  final toolsOptions = [
    "VS Code", "Android Studio", "Xcode", "Postman", "Docker", "Kubernetes",
    "GitHub", "GitLab", "JIRA", "Slack", "Figma", "Adobe XD", "Jenkins",
    "Firebase", "AWS Console", "Google Cloud Platform",
    "Others",
  ];

  final languageOptions = [
    "English", "Hindi", "Marathi", "Gujarati", "Tamil", "Telugu", "Kannada",
    "Malayalam", "Punjabi", "Bengali", "French", "German", "Spanish",
    "Japanese", "Chinese",
    "Others",
  ];

  final domainKnowledgeOptions = [
    "Web Development", "Mobile Development", "Machine Learning", "Deep Learning",
    "Data Engineering", "Cloud Computing", "Blockchain", "IoT",
    "Cybersecurity", "AR/VR", "Game Development", "Embedded Systems",
    "Others",
  ];

  final skillOptions = [
    "Flutter", "Dart", "React", "React Native", "Angular", "Vue.js",
    "Node.js", "Python", "Java", "Kotlin", "Swift", "JavaScript",
    "TypeScript", "C++", "C#", "Go", "Rust", "PHP", "Ruby", "SQL",
    "MongoDB", "Firebase", "GraphQL", "REST APIs", "Docker", "Kubernetes",
    "AWS", "Azure", "Git", "Linux",
    "Others",
  ];

  final shiftOptions = ["Day", "Night", "Rotational", "Any"];

  final maritalStatusOptions = [
    "Single", "Married", "Divorced", "Widowed", "Prefer not to say",
  ];

  // ── State ────────────────────────────────────────────────────────────────────

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

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: addEditProfileViewModel,
      child: Stack(
        children: [
          Scaffold(
             backgroundColor: AppColors.kBg,
            appBar: RAppBar(
              leading: widget.userProfile != null
                  ? IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.keyboard_arrow_left),
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    AppButton(
                      backgroundColor: AppColors.kGreen,
                      onPressed: parseResumeAndFill,
                      child: const Text('Upload Resume & Autofill'),
                    ),

                    // ── BASIC ──────────────────────────────────────────────
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
                          validator: (v) =>
                              (v == null || v.isEmpty) ? 'Name is required' : null,
                        ),
                        AppTextFields(
                          controller: controller.email,
                          hint: 'Email',
                          validator: (v) =>
                              (v == null || v.isEmpty) ? 'Email is required' : null,
                        ),
                        AppTextFields(
                          controller: controller.phone,
                          hint: 'Phone',
                          validator: (v) =>
                              (v == null || v.isEmpty) ? 'Phone number is required' : null,
                        ),
                        _dropdownField(controller.gender, 'Gender', genderOptions),
                        _datePickerField(controller.dob, 'Date of Birth'),
                        _dropdownField(controller.ethnicity, 'Ethnicity', ethnicityOptions),
                        _dropdownField(controller.maritalStatus, 'Marital Status', maritalStatusOptions),
                        _dropdownField(controller.visaStatus, 'Visa Status / Work Authorization', visaStatusOptions),
                      ],
                    ),

                    // ── EDUCATION ─────────────────────────────────────────
                    ProfileSection(
                      label: 'Education',
                      spacing: 16,
                      children: [
                        AppTextFields(controller: controller.college, hint: 'College'),

                        // 1️⃣ Degree — shown first
                        _degreeDropdownField(),

                        // 2️⃣ Specialization — shown after degree, options depend on selected degree
                        _specializationDropdownField(),

                        _dropdownField(controller.semester, 'Semester', semesterOptions),
                        _dropdownField(controller.yearOfGraduation, 'Graduation Year', graduationYears),
                        AppTextFields(controller: controller.cgpa, hint: 'CGPA'),
                      ],
                    ),

                    // ── LINKS ─────────────────────────────────────────────
                    ProfileSection(
                      label: 'Links',
                      spacing: 16,
                      children: [
                        AppTextFields(controller: controller.github, hint: 'Github'),
                        AppTextFields(controller: controller.linkedin, hint: 'LinkedIn'),
                        AppTextFields(controller: controller.portfolio, hint: 'Portfolio'),
                        AppTextFields(controller: controller.resume, hint: 'Resume URL'),
                      ],
                    ),

                    // ── CAREER ────────────────────────────────────────────
                    ProfileSection(
                      label: 'Career',
                      spacing: 16,
                      children: [
                        _dropdownField(controller.openToShift, 'Open To Shift', shiftOptions),
                        AppTextFields(controller: controller.currentSalaryAmount, hint: 'Current Salary'),
                        AppTextFields(controller: controller.currentSalaryCurrency, hint: 'Current Currency'),
                        AppTextFields(controller: controller.expectedSalaryAmount, hint: 'Expected Salary'),
                        AppTextFields(controller: controller.expectedSalaryCurrency, hint: 'Expected Currency'),
                      ],
                    ),

                    // ── ABOUT ─────────────────────────────────────────────
                    ProfileSection(
                      label: 'About',
                      spacing: 16,
                      children: [
                        AppTextFields(controller: controller.about, hint: 'About'),
                        AppTextFields(controller: controller.certifications, hint: 'Certifications'),
                      ],
                    ),

                    // ── CHIP / MULTI-SELECT SECTIONS ──────────────────────
                    _chipMultiSelectField('Skills', controller.skills.first, skillOptions),
                    _chipMultiSelectField(
                      'Domain Knowledge',
                      controller.domainKnowledge.first,
                      domainKnowledgeOptions,
                    ),
                    _chipMultiSelectField(
                      'Employment Type',
                      controller.employmentType.first,
                      employmentOptions,
                    ),
                    _chipMultiSelectField(
                      'Industry',
                      controller.industry.first,
                      industryOptions,
                    ),
                    _chipMultiSelectField(
                      'Job Roles',
                      controller.jobRoles.first,
                      jobRoleOptions,
                    ),
                    _chipMultiSelectField(
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
                    _chipMultiSelectField(
                      'Tools & Platforms',
                      controller.toolsAndPlatforms.first,
                      toolsOptions,
                    ),

                    // ── ACHIEVEMENTS ──────────────────────────────────────
                    ProfileSection(
                      label: 'Achievements',
                      trailing: _addButton(() {
                        setState(() => controller.achievements.add(AchievementController()));
                      }),
                      children: controller.achievements.map(_achievementForm).toList(),
                    ),

                    // ── AWARDS ────────────────────────────────────────────
                    ProfileSection(
                      label: 'Awards',
                      trailing: _addButton(() {
                        setState(() => controller.awards.add(AwardController()));
                      }),
                      children: controller.awards.map(_awardForm).toList(),
                    ),

                    // ── PUBLICATIONS ──────────────────────────────────────
                    ProfileSection(
                      label: 'Publications',
                      trailing: _addButton(() {
                        setState(() => controller.publications.add(PublicationController()));
                      }),
                      children: controller.publications.map(_publicationForm).toList(),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Selector<AddEditProfileViewModel, bool>(
              selector: (_, vm) => vm.isLoading,
              builder: (_, isLoading, _) {
                if (isLoading) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppButton(
                        backgroundColor: AppColors.kGreen,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final failure =
                                await addEditProfileViewModel.saveProfile();
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
                          style: AppTextStyles.s16W600.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Loading overlay
          Selector<AddEditProfileViewModel, bool>(
            selector: (_, vm) => vm.isLoading,
            builder: (_, isLoading, _) {
              if (_isParsingResume || isLoading) {
                return Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.45),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  // ── Education field helpers ──────────────────────────────────────────────────

  /// Degree dropdown — when selection changes, reset specialization.
  Widget _degreeDropdownField() {
    final selectedValue =
        degreeOptions.contains(controller.degree.text) ? controller.degree.text : null;
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: const InputDecoration(
        labelText: 'Degree',
        border: OutlineInputBorder(),
      ),
      hint: const Text('Degree'),
      items: degreeOptions
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (val) {
        setState(() {
          controller.degree.text = val ?? '';
          // Reset specialization whenever degree changes
          controller.specialization.text = '';
        });
      },
    );
  }

  /// Specialization dropdown — options are driven by the selected degree.
  Widget _specializationDropdownField() {
    final options = _currentSpecializationOptions;
    final selectedValue =
        options.contains(controller.specialization.text)
            ? controller.specialization.text
            : null;

    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: const InputDecoration(
        labelText: 'Specialization',
        border: OutlineInputBorder(),
      ),
      hint: Text(
        controller.degree.text.isEmpty
            ? 'Select a degree first'
            : 'Specialization',
      ),
      // Disable the dropdown until a degree is selected
      onChanged: controller.degree.text.isEmpty
          ? null
          : (val) {
              setState(() => controller.specialization.text = val ?? '');
            },
      items: options
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
    );
  }

  // ── Sub-form builders ────────────────────────────────────────────────────────

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

  // ── Reusable field helpers ───────────────────────────────────────────────────

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
  TextEditingController ctrl,
  String hint,
  List<String> options,

) {
  final selectedValue = options.contains(ctrl.text) ? ctrl.text : null;
  return DropdownButtonFormField<String>(
    value: selectedValue,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // ✅
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // ✅
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // ✅
      ),
         
              floatingLabelStyle: AppTextStyles.s16W400.copyWith(
                color: AppColors.white,
              ),
    ),
    hint: Text(
      hint,
      style: TextStyle(color: Colors.white), // ✅
    ),
    items: options
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: TextStyle(color: Colors.white), // optional but better
              ),
            ))
        .toList(),
    onChanged: (val) => setState(() => ctrl.text = val ?? ''),
  );
}

  Widget _datePickerField(TextEditingController ctrl, String hint) {
    return TextFormField(
      controller: ctrl,
      readOnly: true,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.calendar_today_outlined, size: 20),
      ),
      onTap: () async {
        final now = DateTime.now();
        DateTime initial;
        try {
          initial = ctrl.text.isNotEmpty
              ? DateTime.parse(ctrl.text)
              : DateTime(now.year - 20);
        } catch (_) {
          initial = DateTime(now.year - 20);
        }
        final picked = await showDatePicker(
          context: context,
          initialDate: initial,
          firstDate: DateTime(1940),
          lastDate: now,
        );
        if (picked != null) {
          setState(() {
            ctrl.text =
                "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
          });
        }
      },
    );
  }

  Widget _chipMultiSelectField(
    String label,
    TextEditingController controller,
    List<String> options,
  ) {
    return _ChipMultiSelectField(
      key: ValueKey(label),
      label: label,
      controller: controller,
      options: options,
    );
  }

  // ── Resume parser ────────────────────────────────────────────────────────────

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
      if (file.path == null) {
        debugPrint("File path is null");
        return;
      }

      _pickedResumeFile = File(file.path!);
      addEditProfileViewModel.pickedResumeFile = _pickedResumeFile;
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

      final response = await dio.post(
        'https://resume-parser-sgtj.onrender.com/api/resume/parse',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      final data = response.data;

      if (controller.name.text.isEmpty && data['name'] != null)
        controller.name.text = data['name'];
      if (controller.email.text.isEmpty && data['email'] != null)
        controller.email.text = data['email'];
      if (controller.phone.text.isEmpty && data['phone'] != null)
        controller.phone.text = data['phone'];
      if (controller.gender.text.isEmpty && data['gender'] != null)
        controller.gender.text = data['gender'];
      if (controller.about.text.isEmpty && data['about'] != null)
        controller.about.text = data['about'];
      if (controller.linkedin.text.isEmpty && data['linkedin_url'] != null)
        controller.linkedin.text = data['linkedin_url'];
      if (controller.github.text.isEmpty && data['github_url'] != null)
        controller.github.text = data['github_url'];
      if (controller.portfolio.text.isEmpty && data['portfolio_url'] != null)
        controller.portfolio.text = data['portfolio_url'];

      if (data['skills'] != null && data['skills'] is List) {
        controller.skills.first.text =
            (data['skills'] as List).join(', ');
      }

      if (data['education'] != null &&
          data['education'] is List &&
          (data['education'] as List).isNotEmpty) {
        final edu = data['education'].last;
        if (controller.college.text.isEmpty && edu['institution'] != null)
          controller.college.text = edu['institution'];
        if (edu['degree'] != null) {
          final parsedDegree = edu['degree'].toString();
          if (!degreeOptions.contains(parsedDegree)) degreeOptions.add(parsedDegree);
          controller.degree.text = parsedDegree;
          // Reset specialization when degree is set from resume
          controller.specialization.text = '';
        }
        // Set specialization only if it's valid for the parsed degree
        if (controller.specialization.text.isEmpty && edu['field_of_study'] != null) {
          final parsedSpec = edu['field_of_study'].toString();
          final specOptions = _specializationByDegree[controller.degree.text] ??
              _defaultSpecializations;
          if (!specOptions.contains(parsedSpec)) {
            // Add the parsed value dynamically so the dropdown can show it
            _specializationByDegree[controller.degree.text]?.add(parsedSpec);
          }
          controller.specialization.text = parsedSpec;
        }
        if (controller.yearOfGraduation.text.isEmpty && edu['year'] != null)
          controller.yearOfGraduation.text = edu['year'].toString();
        if (controller.cgpa.text.isEmpty && edu['cgpa'] != null)
          controller.cgpa.text = edu['cgpa'].toString();
      }

      setState(() {});
    } catch (e) {
      debugPrint("FULL ERROR: $e");
    } finally {
      setState(() => _isParsingResume = false);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _ChipMultiSelectField  — proper StatefulWidget (no rebuild-controller bug)
// ─────────────────────────────────────────────────────────────────────────────

class _ChipMultiSelectField extends StatefulWidget {
  const _ChipMultiSelectField({
    required this.label,
    required this.controller,
    required this.options,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final List<String> options;

  @override
  State<_ChipMultiSelectField> createState() => _ChipMultiSelectFieldState();
}

class _ChipMultiSelectFieldState extends State<_ChipMultiSelectField> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _showFreeText = false;

  List<String> get _selectedItems {
    if (widget.controller.text.isEmpty) return [];
    return widget.controller.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  void _sync(List<String> items) {
    widget.controller.text = items.join(', ');
  }

  void _addItem(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;

    final current = _selectedItems;
    if (!current.contains(trimmed)) {
      current.add(trimmed);
      _sync(current);
    }
    _textController.clear();
    _focusNode.requestFocus();
    setState(() {});
  }

  void _removeItem(String value) {
    final current = _selectedItems..remove(value);
    _sync(current);
    if (value == 'Others') setState(() => _showFreeText = false);
    setState(() {});
  }

  void _toggleEnumChip(String value) {
    final current = _selectedItems;
    if (current.contains(value)) {
      current.remove(value);
      _sync(current);
      if (value == 'Others') _showFreeText = false;
    } else {
      current.add(value);
      _sync(current);
      if (value == 'Others') _showFreeText = true;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedItems;
    final hasEnums = widget.options.isNotEmpty;
    final customItems =
        selected.where((s) => !widget.options.contains(s)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTextStyles.s14W600),
        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              if (hasEnums) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: widget.options.map((option) {
                    final isSelected = selected.contains(option);
                    return FilterChip(
                      label: Text(option),
                      selected: isSelected,
                      onSelected: (_) => _toggleEnumChip(option),
                      selectedColor: AppColors.primary.withOpacity(0.15),
                      checkmarkColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.primary : null,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    );
                  }).toList(),
                ),
                const Divider(height: 16),
              ],

              if (customItems.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: customItems
                      .map(
                        (item) => Chip(
                          label: Text(item),
                          onDeleted: () => _removeItem(item),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 6),
              ],

              if (!hasEnums || _showFreeText) ...[
                if (hasEnums)
                  const Text(
                    'Add custom entries:',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                const SizedBox(height: 4),
                Autocomplete<String>(
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text.isEmpty) return const [];
                    return widget.options
                        .where((item) =>
                            item != 'Others' &&
                            item.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase(),
                                ))
                        .toList();
                  },
                  onSelected: _addItem,
                  fieldViewBuilder:
                      (context, textController, textFocusNode, onSubmit) {
                    return TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        hintText: 'Type and press Enter to add',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      onSubmitted: _addItem,
                    );
                  },
                ),
              ],

              if (!hasEnums && selected.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: selected
                      .map(
                        (item) => Chip(
                          label: Text(item),
                          onDeleted: () => _removeItem(item),
                        ),
                      )
                      .toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}