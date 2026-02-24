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
  final locationController = TextEditingController();
  final experienceController = TextEditingController();
  final salaryController = TextEditingController();
  final openingsController = TextEditingController();
  final skillsController = TextEditingController();
  final tagsController = TextEditingController();
  final certificationsController = TextEditingController();
  final benefitsController = TextEditingController();
  final eligibilityController = TextEditingController();

  String employmentType = "Full-time";
  String workMode = "On-site";
  String broadcastType = "Everyone";
  String minEducation = "Bachelor's Degree";
  String workAuthorization = "Citizens Only";
  String experienceRange = "0-1 years";

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

              _field("Job Title", controller: titleController),
              _field("Description", controller: descriptionController, maxLines: 3),
              _field("Location", controller: locationController),
              _field("Salary (CTC)", controller: salaryController, keyboardType: TextInputType.number),
              _field("Number of Openings", controller: openingsController, keyboardType: TextInputType.number),

              _dropdown("Employment Type", employmentType,
                  ["Full-time", "Part-time", "Internship"],
                  (val) => setState(() => employmentType = val!)),

              _dropdown("Work Mode", workMode,
                  ["On-site", "Remote", "Hybrid"],
                  (val) => setState(() => workMode = val!)),

              _dropdown("Broadcast Type", broadcastType,
                  ["Everyone", "Selected Colleges"],
                  (val) => setState(() => broadcastType = val!)),

              _dropdown("Minimum Education", minEducation,
                  ["Bachelor's Degree", "Master's Degree", "Diploma"],
                  (val) => setState(() => minEducation = val!)),

              _dropdown("Work Authorization", workAuthorization,
                  ["Citizens Only", "Work Visa Required"],
                  (val) => setState(() => workAuthorization = val!)),

              _dropdown("Experience Range", experienceRange,
                  ["0-1 years", "1-3 years", "3-5 years", "5+ years"],
                  (val) => setState(() => experienceRange = val!)),

              _field("Skills (comma separated)", controller: skillsController),
              _field("Tags (comma separated)", controller: tagsController),
              _field("Certifications (comma separated)", controller: certificationsController),
              _field("Benefits (comma separated)", controller: benefitsController),
              _field("Eligibility Criteria", controller: eligibilityController),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: vm.viewState == ViewState.busy
                    ? null
                    : () async {

                        if (!_formKey.currentState!.validate()) return;

                        final model = ReferralPostModel(
                          jobTitle: titleController.text.trim(),
                          description: descriptionController.text.trim(),
                          employmentType: employmentType,
                          workMode: workMode,
                          broadcastType: broadcastType,
                          jobType: "Referral",
                          location: [locationController.text.trim()],
                          minEducation: minEducation,
                          numberOfOpenings: int.parse(openingsController.text),
                          packageDetails: PackageDetails(
                            currency: "INR",
                            totalCTC: int.parse(salaryController.text),
                            fixedPay: 0,
                            joiningBonus: 0,
                          ),
                          skills: skillsController.text.split(",").map((e) => e.trim()).toList(),
                          studentStreams: ["Computer Science"],
                          tags: tagsController.text.split(",").map((e) => e.trim()).toList(),
                          workAuthorization: workAuthorization,
                          yearsOfExperience: experienceRange,
                          benefits: benefitsController.text.split(",").map((e) => e.trim()).toList(),
                          certifications: certificationsController.text.split(",").map((e) => e.trim()).toList(),
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

                          await Future.delayed(const Duration(milliseconds: 600));
                          Navigator.pop(context);
                        }
                      },
                child: vm.viewState == ViewState.busy
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Post Job"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    String label, {
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: (value) =>
            value == null || value.isEmpty ? "Required field" : null,
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
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}