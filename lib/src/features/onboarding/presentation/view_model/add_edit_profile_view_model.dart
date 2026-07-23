import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart';

class AddEditProfileViewModel extends ViewStateProvider {
  final OnboardingRepository _onboardingRepository = getIt();

  final UserController userController = UserController();

  File? pickedResumeFile;

  XFile? pickedImage;

  Future<Failure?> saveProfile() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final body = userController.toMap();

    debugPrint("=========== UPDATE BODY ===========");
    body.forEach((key, value) {
      debugPrint("$key : $value (${value.runtimeType})");
    });
    debugPrint("===================================");

    final result = await _onboardingRepository.updateOnboardingUser(
      body: body,
      resume: pickedResumeFile,
      image: pickedImage,
    );

    result.fold((e) {
      failure = APIFailure.fromException(exception: e);
    }, (r) {});

    setViewState(ViewState.complete);

    return failure;
  }

  void setUserController(User? user) {
    if (user == null) return;

    final c = userController;

    /// -------- STATUS --------
    c.statusType.text = user.status?.type ?? '';

    c.statusSince.text = user.status?.since != null
        ? "${user.status!.since!.year.toString().padLeft(4, '0')}-${user.status!.since!.month.toString().padLeft(2, '0')}-${user.status!.since!.day.toString().padLeft(2, '0')}"
        : '';

    c.statusNote.text = user.status?.note ?? '';

    c.expectedReturn.text = user.status?.expectedReturn != null
        ? "${user.status!.expectedReturn!.year.toString().padLeft(4, '0')}-${user.status!.expectedReturn!.month.toString().padLeft(2, '0')}-${user.status!.expectedReturn!.day.toString().padLeft(2, '0')}"
        : '';

    debugPrint("Status: ${user.status}");
    debugPrint("Status Type: ${c.statusType.text}");
    debugPrint("Status Since: ${c.statusSince.text}");
    debugPrint("Status Note: ${c.statusNote.text}");
    debugPrint("Expected Return: ${c.expectedReturn.text}");

    /// -------- BASIC --------
    c.id.text = user.id ?? '';
    c.userId.text = user.userId ?? '';
    c.v.text = user.v?.toString() ?? '';

    c.createdAt.text = user.createdAt ?? '';
    c.updatedAt.text = user.updatedAt ?? '';

    c.resume.text = user.resume ?? '';
    c.about.text = user.about ?? '';
    c.certifications.text = user.certifications ?? '';

    /// -------- EDUCATIONS --------

    c.educations.clear();

    for (final e in user.educations ?? []) {
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

      c.educations.add(ec);
    }

    if (c.educations.isEmpty) {
      c.educations.add(EducationController());
    }

    c.email.text = user.email ?? '';
    c.gender.text = user.gender ?? '';
    c.github.text = user.github ?? '';
    c.linkedin.text = user.linkedin ?? '';
    c.name.text = user.name ?? '';
    c.openToShift.text = user.openToShift ?? '';

    c.currentCompany.text = user.currentCompany ?? '';
    c.companyEmail.text = user.companyEmail ?? '';
    c.totalYearsOfExperience.text = user.totalYearsOfExperience ?? '';
    c.noticePeriod.text = user.noticePeriod ?? '';
    c.noticePeriodStartDate.text = user.noticePeriodStartDate ?? '';
    c.phone.text = user.phone ?? '';
    c.portfolio.text = user.portfolio ?? '';

    c.profileType.text = user.profileType ?? '';

    c.referralSource.text = user.referralSource ?? '';

    c.currentSalaryAmount.text = user.currentSalaryAmount ?? '';

    c.currentSalaryCurrency.text = user.currentSalaryCurrency ?? '';

    c.dob.text = user.dob ?? '';

    c.ethnicity.text = user.ethnicity ?? '';

    c.expectedSalaryAmount.text = user.expectedSalaryAmount ?? '';

    c.expectedSalaryCurrency.text = user.expectedSalaryCurrency ?? '';

    c.maritalStatus.text = user.maritalStatus ?? '';

    c.visaStatus.text = user.visaStatus ?? '';
    c.servingNoticePeriod = user.servingNoticePeriod ?? false;

    /// -------- CLEAR LISTS --------

    c.skills.clear();
    c.domainKnowledge.clear();
    c.employmentType.clear();
    c.experiences.clear();
    c.industry.clear();
    c.jobRoles.clear();
    c.languagesKnown.clear();
    c.locations.clear();
    c.lookingFor.clear();
    c.toolsAndPlatforms.clear();

    c.achievements.clear();
    c.awards.clear();
    c.publications.clear();

    c.leadershipExperiences.clear();
    c.internationalExperiences.clear();

    /// -------- CHIP FIELDS --------

    c.skills.add(TextEditingController(text: (user.skills ?? []).join(', ')));

    c.domainKnowledge.add(
      TextEditingController(text: (user.domainKnowledge ?? []).join(', ')),
    );

    c.employmentType.add(
      TextEditingController(text: (user.employmentType ?? []).join(', ')),
    );

    c.industry.add(
      TextEditingController(text: (user.industry ?? []).join(', ')),
    );

    c.jobRoles.add(
      TextEditingController(text: (user.jobRoles ?? []).join(', ')),
    );

    c.languagesKnown.add(
      TextEditingController(text: (user.languagesKnown ?? []).join(', ')),
    );

    c.lookingFor.add(
      TextEditingController(text: (user.lookingFor ?? []).join(', ')),
    );

    c.toolsAndPlatforms.add(
      TextEditingController(text: (user.toolsAndPlatforms ?? []).join(', ')),
    );

    /// -------- LOCATIONS --------

    for (final e in user.locations ?? []) {
      c.locations.add(TextEditingController(text: e));
    }

    c.locations.add(TextEditingController());

    /// -------- EXPERIENCES --------
    for (final e in user.experiences ?? []) {
      final isEmpty =
          (e.company ?? '').trim().isEmpty &&
          (e.role ?? '').trim().isEmpty &&
          (e.startDate ?? '').trim().isEmpty &&
          (e.endDate ?? '').trim().isEmpty &&
          (e.description ?? '').trim().isEmpty;

      if (isEmpty) continue;

      final ec = ExperienceController();

      ec.company.text = e.company ?? '';
      ec.role.text = e.role ?? '';
      ec.startDate.text = e.startDate ?? '';
      ec.endDate.text = e.endDate ?? '';
      ec.description.text = e.description ?? '';
      ec.isCurrent = e.isCurrent ?? false;

      c.experiences.add(ec);
    }

    c.experiences.add(ExperienceController());

    /// -------- LEADERSHIP EXPERIENCES --------
    /// -------- LEADERSHIP EXPERIENCES --------

    for (final e in user.leadershipExperiences ?? []) {
      final ec = LeadershipExperienceController();

      ec.organization.text = e.organization ?? '';

      ec.role.text = e.role ?? '';

      ec.startDate.text = e.startDate ?? '';

      ec.endDate.text = e.endDate ?? '';

      ec.description.text = e.description ?? '';

      c.leadershipExperiences.add(ec);
    }

    c.leadershipExperiences.add(LeadershipExperienceController());

    /// -------- INTERNATIONAL EXPERIENCES --------
    /// -------- INTERNATIONAL EXPERIENCES --------

    for (final e in user.internationalExperiences ?? []) {
      final ec = InternationalExperienceController();

      ec.country.text = e.country ?? '';

      ec.organization.text = e.organization ?? '';
      ec.organization.text = e.organization ?? '';
      ec.role.text = e.role ?? '';

      ec.startDate.text = e.startDate ?? '';

      ec.endDate.text = e.endDate ?? '';

      ec.description.text = e.description ?? '';

      c.internationalExperiences.add(ec);
    }

    c.internationalExperiences.add(InternationalExperienceController());

    /// -------- ACHIEVEMENTS --------

    for (final a in user.achievements ?? []) {
      final ac = AchievementController();

      ac.id.text = a.id ?? '';
      ac.title.text = a.title ?? '';
      ac.event.text = a.event ?? '';
      ac.date.text = a.date ?? '';

      c.achievements.add(ac);
    }

    /// -------- AWARDS --------

    for (final a in user.awards ?? []) {
      final aw = AwardController();

      aw.id.text = a.id ?? '';
      aw.title.text = a.title ?? '';

      aw.organization.text = a.organization ?? '';

      aw.startDate.text = a.startDate ?? '';

      aw.endDate.text = a.endDate ?? '';

      aw.description.text = a.description ?? '';

      c.awards.add(aw);
    }

    /// -------- PUBLICATIONS --------

    for (final p in user.publications ?? []) {
      final pc = PublicationController();

      pc.id.text = p.id ?? '';
      pc.title.text = p.title ?? '';
      pc.url.text = p.url ?? '';

      c.publications.add(pc);
    }

    notifyListeners();
  }
}
