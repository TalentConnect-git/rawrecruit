import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart';

class AddEditProfileViewModel extends ViewStateProvider {
  final OnboardingRepository _onboardingRepository = getIt();

  final UserController userController = UserController();

  // ← store the picked file here
  File? pickedResumeFile;

  XFile? pickedImage;

  Future<Failure?> saveProfile() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.updateOnboardingUser(
      body: userController.toMap(),
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

    /// -------- BASIC --------
    c.id.text = user.id ?? '';
    c.userId.text = user.userId ?? '';
    c.v.text = user.v?.toString() ?? '';

    c.createdAt.text = user.createdAt ?? '';
    c.updatedAt.text = user.updatedAt ?? '';

    c.resume.text = user.resume ?? '';
    c.about.text = user.about ?? '';
    c.certifications.text = user.certifications ?? '';
    c.cgpa.text = user.cgpa ?? '';
    c.college.text = user.college ?? '';
    c.degree.text = user.degree ?? '';
    c.degreeCertificate.text = user.degreeCertificate ?? '';
    c.email.text = user.email ?? '';
    c.gender.text = user.gender ?? '';
    c.github.text = user.github ?? '';
    c.linkedin.text = user.linkedin ?? '';
    c.name.text = user.name ?? '';
    c.openToShift.text = user.openToShift ?? '';
    c.currentCompany.text =
    user.currentCompany ?? '';

c.noticePeriod.text =
    user.noticePeriod ?? '';
    c.phone.text = user.phone ?? '';
    c.portfolio.text = user.portfolio ?? '';
    c.profileType.text = user.profileType ?? '';
    c.referralSource.text = user.referralSource ?? '';
    c.semester.text = user.semester ?? '';
    c.specialization.text = user.specialization ?? '';
    c.yearOfGraduation.text = user.yearOfGraduation ?? '';
    c.currentSalaryAmount.text = user.currentSalaryAmount ?? '';
    c.currentSalaryCurrency.text = user.currentSalaryCurrency ?? '';
    c.dob.text = user.dob ?? '';
    c.ethnicity.text = user.ethnicity ?? '';
    c.expectedSalaryAmount.text = user.expectedSalaryAmount ?? '';
    c.expectedSalaryCurrency.text = user.expectedSalaryCurrency ?? '';
    c.maritalStatus.text = user.maritalStatus ?? '';
    c.visaStatus.text = user.visaStatus ?? '';

    c.servingNoticePeriod.text = user.servingNoticePeriod.toString();

    /// -------- CLEAR LISTS --------
    c.skills.clear();
    c.domainKnowledge.clear();
    c.employmentType.clear();
    c.experiences.clear();
    c.industry.clear();
    c.internationalExperience.clear();
    c.jobRoles.clear();
    c.languagesKnown.clear();
    c.leadership.clear();
    c.locations.clear();
    c.lookingFor.clear();
    c.toolsAndPlatforms.clear();

    c.achievements.clear();
    c.awards.clear();
    c.publications.clear();

    /// -------- STRING LISTS --------
    for (final e in user.skills ?? []) {
      c.skills.add(TextEditingController(text: e));
    }
    c.skills.add(TextEditingController());

    for (final e in user.domainKnowledge ?? []) {
      c.domainKnowledge.add(TextEditingController(text: e));
    }
    c.domainKnowledge.add(TextEditingController());

    for (final e in user.employmentType ?? []) {
      c.employmentType.add(TextEditingController(text: e));
    }
    c.employmentType.add(TextEditingController());
for (final e in user.experiences ?? []) {
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

    for (final e in user.industry ?? []) {
      c.industry.add(TextEditingController(text: e));
    }
    c.industry.add(TextEditingController());

    for (final e in user.internationalExperience ?? []) {
      c.internationalExperience.add(TextEditingController(text: e));
    }
    c.internationalExperience.add(TextEditingController());

    for (final e in user.jobRoles ?? []) {
      c.jobRoles.add(TextEditingController(text: e));
    }
    c.jobRoles.add(TextEditingController());

    for (final e in user.languagesKnown ?? []) {
      c.languagesKnown.add(TextEditingController(text: e));
    }
    c.languagesKnown.add(TextEditingController());

    for (final e in user.leadership ?? []) {
      c.leadership.add(TextEditingController(text: e));
    }
    c.leadership.add(TextEditingController());

    for (final e in user.locations ?? []) {
      c.locations.add(TextEditingController(text: e));
    }
    c.locations.add(TextEditingController());

    for (final e in user.lookingFor ?? []) {
      c.lookingFor.add(TextEditingController(text: e));
    }
    c.lookingFor.add(TextEditingController());

    for (final e in user.toolsAndPlatforms ?? []) {
      c.toolsAndPlatforms.add(TextEditingController(text: e));
    }
    c.toolsAndPlatforms.add(TextEditingController());

    /// -------- ACHIEVEMENTS --------
    for (final a in user.achievements ?? []) {
      final ac = AchievementController();
      ac.id.text = a.id ?? '';
      ac.title.text = a.title ?? '';
      ac.event.text = a.event ?? '';
      ac.date.text = a.date ?? '';
      c.achievements.add(ac);
    }
    c.achievements.add(AchievementController());

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
    c.awards.add(AwardController());

    /// -------- PUBLICATIONS --------
    for (final p in user.publications ?? []) {
      final pc = PublicationController();
      pc.id.text = p.id ?? '';
      pc.title.text = p.title ?? '';
      pc.url.text = p.url ?? '';
      c.publications.add(pc);
    }
    c.publications.add(PublicationController());

    notifyListeners();
  }
}
