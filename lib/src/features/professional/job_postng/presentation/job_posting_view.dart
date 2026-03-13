import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/job_posting_view_model.dart';

class ReferralPostView extends StatefulWidget {
  const ReferralPostView({super.key});

  @override
  State<ReferralPostView> createState() => _ReferralPostViewState();
}

class _ReferralPostViewState extends State<ReferralPostView> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final salaryController = TextEditingController();
  final openingsController = TextEditingController();
  final skillsController = TextEditingController();
  final certificationsController = TextEditingController();
  final benefitsController = TextEditingController();
  final eligibilityController = TextEditingController();
  final fieldOfStudyController = TextEditingController();
  String selectedJobTitle = "Software Developer";

  final List<String> jobTitleOptions = [
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
    "Others",
  ];
  String employmentType = "Full-time";
  String workMode = "On-site";
  String broadcastType = "Everyone";
  String minEducation = "Bachelor's Degree";
  String workAuthorization = "Citizens Only";
  String experienceRange = "0-1 years";
  String selectedTag = "Urgent hiring";
  String selectedCity = "Mumbai";

  final List<String> skillOptions = [
    'node',
    'python',
    'react',
    'typescript',
    'css',
    'html',
    'java',
    'flutter',
    'dart',
  ];

  final List<String> certificationOptions = [
    'AWS Certified',
    'Microsoft Certified',
    'Google Cloud Certified',
    'Cisco Certified',
    'PMP',
  ];

  final List<String> benefitOptions = [
    'Health Insurance',
    '401(k)',
    'Paid Time Off',
    'Flexible Schedule',
    'Dental Insurance',
  ];

  final List<String> fieldOfStudyOptions = [
    'Computer Science',
    'Engineering',
    'Business',
    'Arts',
    'Sciences',
    'Mathematics',
    'Medicine',
    'Law',
  ];

  final List<String> indiaCities = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Chennai",
    "Pune",
  ];

  final List<String> educationOptions = [
    "High School",
    "Bachelor's Degree",
    "Master's Degree",
    "PhD",
  ];

  final List<String> experienceOptions = [
    "0-1 years",
    "1-3 years",
    "3-5 years",
    "5-10 years",
  ];

  final List<String> workAuthorizationOptions = [
    "Citizens Only",
    "Permanent Residents",
    "Work Visa Holders",
    "Any",
  ];

  final List<String> tagOptions = [
    "Urgent hiring",
    "Fresher preferred",
    "Remote-friendly",
    "Work from Home",
  ];

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ReferralPostViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Post Referral")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _dropdown(
                "Job Title",
                selectedJobTitle,
                jobTitleOptions,
                (val) => setState(() => selectedJobTitle = val!),
              ),
              if (selectedJobTitle == "Others")
                _field("Enter Custom Job Title", controller: titleController),
              _field(
                "Description",
                controller: descriptionController,
                maxLines: 3,
              ),

              _dropdown(
                "Location",
                selectedCity,
                indiaCities,
                (val) => setState(() => selectedCity = val!),
              ),

              _field("Salary", controller: salaryController),
              _field("Openings", controller: openingsController),

              _dropdown(
                "Employment Type",
                employmentType,
                ["Full-time", "Part-time"],
                (val) => setState(() => employmentType = val!),
              ),

              _dropdown("Work Mode", workMode, [
                "On-site",
                "Remote",
                "Hybrid",
              ], (val) => setState(() => workMode = val!)),

              _dropdown(
                "Broadcast Type",
                broadcastType,
                ["Everyone", "Selected Colleges"],
                (val) => setState(() => broadcastType = val!),
              ),

              _dropdown(
                "Minimum Education",
                minEducation,
                educationOptions,
                (val) => setState(() => minEducation = val!),
              ),

              _dropdown(
                "Work Authorization",
                workAuthorization,
                workAuthorizationOptions,
                (val) => setState(() => workAuthorization = val!),
              ),

              _dropdown(
                "Experience Range",
                experienceRange,
                experienceOptions,
                (val) => setState(() => experienceRange = val!),
              ),

              _dropdown(
                "Tags",
                selectedTag,
                tagOptions,
                (val) => setState(() => selectedTag = val!),
              ),

              _chipMultiSelectField(
                "Preferred Field of Study",
                fieldOfStudyController,
                fieldOfStudyOptions,
              ),

              _chipMultiSelectField("Skills", skillsController, skillOptions),

              _chipMultiSelectField(
                "Certifications",
                certificationsController,
                certificationOptions,
              ),

              _chipMultiSelectField(
                "Benefits",
                benefitsController,
                benefitOptions,
              ),

              _field("Eligibility Criteria", controller: eligibilityController),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  final model = ReferralPostModel(
                    jobTitle: selectedJobTitle == "Others"
                        ? titleController.text.trim()
                        : selectedJobTitle,
                    description: descriptionController.text.trim(),
                    employmentType: employmentType,
                    workMode: workMode,
                    broadcastType: broadcastType,
                    jobType: "Referral",
                    location: [selectedCity],
                    minEducation: minEducation,
                    numberOfOpenings:
                        int.tryParse(openingsController.text) ?? 0,
                    packageDetails: PackageDetails(
                      currency: "INR",
                      totalCTC: int.tryParse(salaryController.text) ?? 0,
                      fixedPay: 0,
                      joiningBonus: 0,
                    ),
                    skills: skillsController.text
                        .split(',')
                        .map((e) => e.trim())
                        .where((e) => e.isNotEmpty)
                        .toList(),
                    studentStreams: fieldOfStudyController.text
                        .split(',')
                        .map((e) => e.trim())
                        .where((e) => e.isNotEmpty)
                        .toList(),
                    tags: [selectedTag],
                    workAuthorization: workAuthorization,
                    yearsOfExperience: experienceRange,
                    benefits: benefitsController.text
                        .split(',')
                        .map((e) => e.trim())
                        .where((e) => e.isNotEmpty)
                        .toList(),
                    certifications: certificationsController.text
                        .split(',')
                        .map((e) => e.trim())
                        .where((e) => e.isNotEmpty)
                        .toList(),
                    eligibilityCriteria: eligibilityController.text.trim(),
                  );

                  final success = await vm.postJob(model);

                  if (success && mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Referral Successfully Added"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Future.delayed(const Duration(seconds: 1), () {
                      if (mounted) Navigator.pop(context);
                    });
                  }
                },
                child: const Text("Post Job"),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _chipMultiSelectField(
  String label,
  TextEditingController controller,
  List<String> options,
) {
  return StatefulBuilder(
    builder: (context, setLocalState) {
      final textController = TextEditingController();
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

          textController.clear(); // ✅ clears visible text field

          setLocalState(() {});
        }
      }

      void removeItem(String value) {
        selectedItems.remove(value);
        syncController();
        setLocalState(() {});
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
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
                    width: 220,
                    child: Autocomplete<String>(
                      optionsBuilder: (textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return options;
                        }

                        return options.where(
                          (item) => item.toLowerCase().contains(
                                textEditingValue.text.toLowerCase(),
                              ),
                        );
                      },
                      onSelected: (value) {
                        addItem(value);
                      },
                      fieldViewBuilder:
                          (context, fieldController, fieldFocusNode, onSubmit) {
                        return TextField(
                          controller: textController, // ✅ use same controller
                          focusNode: fieldFocusNode,
                          decoration: const InputDecoration(
                            hintText: "Add",
                            border: InputBorder.none,
                          ),
                          onSubmitted: (value) {
                            addItem(value);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

  Widget _field(
    String label, {
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _dropdown(
    String label,
    String value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
