import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart';

class AddEditProfileViewModel extends ViewStateProvider {
  final OnboardingRepository _onboardingRepository = getIt();

  final UserProfileController userProfileController = UserProfileController();

  Future<Failure?> saveProfile() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.updateOnboardingUserProfile(
      body: userProfileController.toMap(),
    );

    result.fold((e) {
      failure = APIFailure.fromException(exception: e);
    }, (r) {});

    setViewState(ViewState.complete);

    return failure;
  }

  void setUserProfileController(UserProfile? userProfile) {
    if (userProfile == null) return;

    final c = userProfileController;

    /// -------- BASIC --------
    c.id.text = userProfile.id ?? '';
    c.userId.text = userProfile.userId ?? '';
    c.v.text = userProfile.v?.toString() ?? '';

    c.createdAt.text = userProfile.createdAt ?? '';
    c.updatedAt.text = userProfile.updatedAt ?? '';

    c.resume.text = userProfile.resume ?? '';
    c.about.text = userProfile.about ?? '';
    c.certifications.text = userProfile.certifications ?? '';
    c.cgpa.text = userProfile.cgpa ?? '';
    c.college.text = userProfile.college ?? '';
    c.degree.text = userProfile.degree ?? '';
    c.degreeCertificate.text = userProfile.degreeCertificate ?? '';
    c.email.text = userProfile.email ?? '';
    c.gender.text = userProfile.gender ?? '';
    c.github.text = userProfile.github ?? '';
    c.linkedin.text = userProfile.linkedin ?? '';
    c.name.text = userProfile.name ?? '';
    c.openToShift.text = userProfile.openToShift ?? '';
    c.phone.text = userProfile.phone ?? '';
    c.portfolio.text = userProfile.portfolio ?? '';
    c.profileType.text = userProfile.profileType ?? '';
    c.referralSource.text = userProfile.referralSource ?? '';
    c.semester.text = userProfile.semester ?? '';
    c.specialization.text = userProfile.specialization ?? '';
    c.yearOfGraduation.text = userProfile.yearOfGraduation ?? '';
    c.currentSalaryAmount.text = userProfile.currentSalaryAmount ?? '';
    c.currentSalaryCurrency.text = userProfile.currentSalaryCurrency ?? '';
    c.dob.text = userProfile.dob ?? '';
    c.ethnicity.text = userProfile.ethnicity ?? '';
    c.expectedSalaryAmount.text = userProfile.expectedSalaryAmount ?? '';
    c.expectedSalaryCurrency.text = userProfile.expectedSalaryCurrency ?? '';
    c.maritalStatus.text = userProfile.maritalStatus ?? '';
    c.visaStatus.text = userProfile.visaStatus ?? '';

    c.servingNoticePeriod.text = userProfile.servingNoticePeriod.toString();

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
    for (final e in userProfile.skills ?? []) {
      c.skills.add(TextEditingController(text: e));
    }
    c.skills.add(TextEditingController());

    for (final e in userProfile.domainKnowledge ?? []) {
      c.domainKnowledge.add(TextEditingController(text: e));
    }
    c.domainKnowledge.add(TextEditingController());

    for (final e in userProfile.employmentType ?? []) {
      c.employmentType.add(TextEditingController(text: e));
    }
    c.employmentType.add(TextEditingController());

    for (final e in userProfile.experiences ?? []) {
      c.experiences.add(TextEditingController(text: e));
    }
    c.experiences.add(TextEditingController());

    for (final e in userProfile.industry ?? []) {
      c.industry.add(TextEditingController(text: e));
    }
    c.industry.add(TextEditingController());

    for (final e in userProfile.internationalExperience ?? []) {
      c.internationalExperience.add(TextEditingController(text: e));
    }
    c.internationalExperience.add(TextEditingController());

    for (final e in userProfile.jobRoles ?? []) {
      c.jobRoles.add(TextEditingController(text: e));
    }
    c.jobRoles.add(TextEditingController());

    for (final e in userProfile.languagesKnown ?? []) {
      c.languagesKnown.add(TextEditingController(text: e));
    }
    c.languagesKnown.add(TextEditingController());

    for (final e in userProfile.leadership ?? []) {
      c.leadership.add(TextEditingController(text: e));
    }
    c.leadership.add(TextEditingController());

    for (final e in userProfile.locations ?? []) {
      c.locations.add(TextEditingController(text: e));
    }
    c.locations.add(TextEditingController());

    for (final e in userProfile.lookingFor ?? []) {
      c.lookingFor.add(TextEditingController(text: e));
    }
    c.lookingFor.add(TextEditingController());

    for (final e in userProfile.toolsAndPlatforms ?? []) {
      c.toolsAndPlatforms.add(TextEditingController(text: e));
    }
    c.toolsAndPlatforms.add(TextEditingController());

    /// -------- ACHIEVEMENTS --------
    for (final a in userProfile.achievements ?? []) {
      final ac = AchievementController();
      ac.id.text = a.id ?? '';
      ac.title.text = a.title ?? '';
      ac.event.text = a.event ?? '';
      ac.date.text = a.date ?? '';
      c.achievements.add(ac);
    }
    c.achievements.add(AchievementController());

    /// -------- AWARDS --------
    for (final a in userProfile.awards ?? []) {
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
    for (final p in userProfile.publications ?? []) {
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
