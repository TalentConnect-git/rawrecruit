import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/view_model/add_edit_profile_view_model.dart';

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
    return Scaffold(
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
          widget.userProfile != null ? 'Edit Profile' : 'Complete your profile',
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
              /// ---------------- BASIC ----------------
              ProfileSection(
                label: 'Basic',
                spacing: 16,
                children: [
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
                  AppTextFields(controller: controller.gender, hint: 'Gender'),
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
                  AppTextFields(controller: controller.degree, hint: 'Degree'),
                  AppTextFields(
                    controller: controller.specialization,
                    hint: 'Specialization',
                  ),
                  AppTextFields(controller: controller.cgpa, hint: 'CGPA'),
                  AppTextFields(
                    controller: controller.semester,
                    hint: 'Semester',
                  ),
                  AppTextFields(
                    controller: controller.yearOfGraduation,
                    hint: 'Graduation Year',
                  ),
                ],
              ),

              /// ---------------- LINKS ----------------
              ProfileSection(
                label: 'Links',
                spacing: 16,
                children: [
                  AppTextFields(controller: controller.github, hint: 'Github'),
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
                  AppTextFields(controller: controller.about, hint: 'About'),
                  AppTextFields(
                    controller: controller.certifications,
                    hint: 'Certifications',
                  ),
                ],
              ),

              /// ---------------- STRING LIST SECTIONS ----------------
              _profileListSection('Skills', controller.skills),
              _profileListSection(
                'Domain Knowledge',
                controller.domainKnowledge,
              ),
              _profileListSection('Employment Type', controller.employmentType),
              _profileListSection('Industry', controller.industry),
              _profileListSection('Job Roles', controller.jobRoles),
              _profileListSection('Languages Known', controller.languagesKnown),
              _profileListSection('Locations', controller.locations),
              _profileListSection('Looking For', controller.lookingFor),
              _profileListSection(
                'Tools & Platforms',
                controller.toolsAndPlatforms,
              ),

              /// ---------------- ACHIEVEMENTS ----------------
              ProfileSection(
                label: 'Achievements',
                trailing: _addButton(() {
                  setState(
                    () => controller.achievements.add(AchievementController()),
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
                  setState(() => controller.awards.add(AwardController()));
                }),
                children: controller.awards.map(_awardForm).toList(),
              ),

              /// ---------------- PUBLICATIONS ----------------
              ProfileSection(
                label: 'Publications',
                trailing: _addButton(() {
                  setState(
                    () => controller.publications.add(PublicationController()),
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final failure = await addEditProfileViewModel.saveProfile();
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
}
