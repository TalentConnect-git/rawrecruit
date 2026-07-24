import 'package:flutter/material.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show EducationController;

import 'achievement_controller.dart';
import 'award_controller.dart';
import 'international.dart';
import 'leadership_controller.dart';
import 'publication_controller.dart';

class ExperienceController {
  TextEditingController company = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController description = TextEditingController();

  bool isCurrent = false;
}

class UserController {
  UserController()
    : id = TextEditingController(),
      userId = TextEditingController(),
      v = TextEditingController(),
      createdAt = TextEditingController(),
      updatedAt = TextEditingController(),
      resume = TextEditingController(),
      about = TextEditingController(),
      certifications = TextEditingController(),

      email = TextEditingController(),
      gender = TextEditingController(),
      github = TextEditingController(),
      linkedin = TextEditingController(),
      name = TextEditingController(),
      openToShift = TextEditingController(),
      phone = TextEditingController(),
      portfolio = TextEditingController(),
      profileType = TextEditingController(),
      referralSource = TextEditingController(),
      semester = TextEditingController(),
      specialization = TextEditingController(),
      yearOfGraduation = TextEditingController(),
      currentSalaryAmount = TextEditingController(),
      currentSalaryCurrency = TextEditingController(),
      dob = TextEditingController(),
      ethnicity = TextEditingController(),
      expectedSalaryAmount = TextEditingController(),
      expectedSalaryCurrency = TextEditingController(),
      maritalStatus = TextEditingController(),
      visaStatus = TextEditingController(),
      currentCompany = TextEditingController(),
      noticePeriod = TextEditingController(),
      totalYearsOfExperience = TextEditingController(),

      companyEmail = TextEditingController(),
      noticePeriodStartDate = TextEditingController(),
      statusType = TextEditingController(),
      statusSince = TextEditingController(),
      statusNote = TextEditingController(),
      expectedReturn = TextEditingController();

  /// Basic Fields
  TextEditingController id;
  TextEditingController userId;
  TextEditingController v;
  TextEditingController statusType;
  TextEditingController statusSince;
  TextEditingController statusNote;
  TextEditingController expectedReturn;
  TextEditingController createdAt;
  TextEditingController updatedAt;

  /// List<String> fields
  List<TextEditingController> domainKnowledge = [];
  List<TextEditingController> employmentType = [];
  List<ExperienceController> experiences = [];
  List<EducationController> educations = [];
  List<TextEditingController> industry = [];
  List<TextEditingController> jobRoles = [];
  List<TextEditingController> languagesKnown = [];
  List<TextEditingController> locations = [];
  List<TextEditingController> lookingFor = [];
  List<TextEditingController> skills = [];
  List<TextEditingController> toolsAndPlatforms = [];
  List<LeadershipExperienceController> leadershipExperiences = [];

  List<InternationalExperienceController> internationalExperiences = [];

  /// Nested Controllers
  List<AchievementController> achievements = [];
  List<AwardController> awards = [];
  List<PublicationController> publications = [];

  /// Other fields
  TextEditingController resume;
  TextEditingController about;
  TextEditingController certifications;

  TextEditingController email;
  TextEditingController gender;
  TextEditingController github;
  TextEditingController linkedin;
  TextEditingController name;
  TextEditingController openToShift;
  TextEditingController phone;
  TextEditingController portfolio;
  TextEditingController profileType;
  TextEditingController referralSource;
  TextEditingController semester;
  TextEditingController specialization;
  TextEditingController yearOfGraduation;
  TextEditingController currentSalaryAmount;
  TextEditingController currentSalaryCurrency;
  TextEditingController dob;
  TextEditingController ethnicity;
  TextEditingController expectedSalaryAmount;
  TextEditingController expectedSalaryCurrency;
  TextEditingController maritalStatus;
  TextEditingController visaStatus;
  bool servingNoticePeriod = false;
  TextEditingController currentCompany;
  TextEditingController totalYearsOfExperience;

  TextEditingController noticePeriod;
  TextEditingController companyEmail;
  TextEditingController noticePeriodStartDate;
  Map<String, dynamic> toMap() {
    String? clean(String? v) => v == null || v.trim().isEmpty ? null : v.trim();
    List<String>? cleanList(List<TextEditingController> list) {
      final values = <String>[];

      for (final controller in list) {
        final text = controller.text.trim();

        debugPrint("CHIP VALUE => $text");

        if (text.isEmpty) continue;

        values.addAll(
          text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty),
        );
      }

      debugPrint("FINAL VALUES => $values");

      return values.isEmpty ? null : values;
    }

    Map<String, dynamic> cleanMap(Map<String, dynamic> map) {
      map.removeWhere((key, value) {
        if (value == null) return true;
        if (value is String && value.isEmpty && key != 'currentCompany') {
          return true;
        }

        /// KEEP EMPTY LISTS SO BACKEND CLEARS DATA
        if (value is List) return false;
        if (value is Map && value.isEmpty) return true;
        return false;
      });
      return map;
    }

    final data = <String, dynamic>{
      '_id': clean(id.text),
      'userId': clean(userId.text),
      '__v': int.tryParse(v.text),

      'createdAt': clean(createdAt.text),
      'updatedAt': clean(updatedAt.text),

      'resume': clean(resume.text),
      'about': clean(about.text),
      'certifications': clean(certifications.text),

      'email': clean(email.text),
      'gender': clean(gender.text),
      'github': clean(github.text),
      'linkedin': clean(linkedin.text),
      'name': clean(name.text),
      'openToShift': clean(openToShift.text),
      'currentCompany': currentCompany.text.trim(),
      'companyEmail': clean(companyEmail.text),
      'totalYearsOfExperience': clean(totalYearsOfExperience.text),
      'noticePeriod': clean(noticePeriod.text),
      'noticePeriodStartDate': clean(noticePeriodStartDate.text),
      'phone': clean(phone.text),
      'portfolio': clean(portfolio.text),
      'profileType': clean(profileType.text),
      'referralSource': clean(referralSource.text),
      'semester': clean(semester.text),
      'specialization': clean(specialization.text),
      'yearOfGraduation': clean(yearOfGraduation.text),
      'currentSalaryAmount': clean(currentSalaryAmount.text),
      'currentSalaryCurrency': clean(currentSalaryCurrency.text),
      'dob': clean(dob.text),
      'ethnicity': clean(ethnicity.text),
      'expectedSalaryAmount': clean(expectedSalaryAmount.text),
      'expectedSalaryCurrency': clean(expectedSalaryCurrency.text),
      'maritalStatus': clean(maritalStatus.text),
      'visaStatus': clean(visaStatus.text),

      'servingNoticePeriod': servingNoticePeriod,
      if (!experiences.any((e) => e.isCurrent))
        'status': cleanMap({
          'type': clean(statusType.text),
          'since': clean(statusSince.text),
          'note': clean(statusNote.text),
          'expectedReturn': statusType.text == 'career_break'
              ? clean(expectedReturn.text)
              : null,
        }),

      /// Lists
      'skills': cleanList(skills),

      'domainKnowledge': cleanList(domainKnowledge),
      'employmentType': cleanList(employmentType),
      'educations': educations
          .map(
            (e) => {
              'college': e.college.text.trim(),
              'degree': e.degree.text.trim(),
              'specialization': e.specialization.text.trim(),
              'semester': e.semester.text.trim(),
              'cgpa': e.cgpa.text.trim(),
              'yearOfGraduation': e.yearOfGraduation.text.trim(),
              'startDate': e.startDate.text.trim(),
              'endDate': e.endDate.text.trim(),
              'educationType': e.educationType,
              'isCurrent': e.isCurrent,
            },
          )
          .toList(),
      'experiences': experiences
          .map(
            (e) => {
              'company': e.company.text.trim(),
              'role': e.role.text.trim(),
              'isCurrent': e.isCurrent,
              'startDate': e.startDate.text.trim(),
              'endDate': e.endDate.text.trim(),
              'description': e.description.text.trim(),
            },
          )
          .toList(),
      'industry': cleanList(industry),
      'jobRoles': cleanList(jobRoles),
      'languagesKnown': cleanList(languagesKnown),
      'leadership': leadershipExperiences
          .map(
            (e) => {
              'organization': e.organization.text.trim(),
              'role': e.role.text.trim(),
              'startDate': e.startDate.text.trim(),
              'endDate': e.endDate.text.trim(),
              'description': e.description.text.trim(),
            },
          )
          .toList(),
      'internationalExperience': internationalExperiences
          .map(
            (e) => {
              'country': e.country.text.trim(),
              'organization': e.organization.text.trim(),
              'role': e.role.text.trim(),
              'startDate': e.startDate.text.trim(),
              'endDate': e.endDate.text.trim(),
              'description': e.description.text.trim(),
            },
          )
          .toList(),
      'locations': cleanList(locations),
      'lookingFor': cleanList(lookingFor),
      'toolsAndPlatforms': cleanList(toolsAndPlatforms),

      /// Achievements
      'achievements': achievements
          .where(
            (a) =>
                a.title.text.isNotEmpty ||
                a.event.text.isNotEmpty ||
                a.date.text.isNotEmpty,
          )
          .map(
            (a) => cleanMap({
              '_id': clean(a.id.text),
              'title': clean(a.title.text),
              'event': clean(a.event.text),
              'date': clean(a.date.text),
            }),
          )
          .toList(),

      /// Awards
      'awards': awards
          .where(
            (a) =>
                a.title.text.isNotEmpty ||
                a.organization.text.isNotEmpty ||
                a.startDate.text.isNotEmpty ||
                a.endDate.text.isNotEmpty ||
                a.description.text.isNotEmpty,
          )
          .map(
            (a) => cleanMap({
              '_id': clean(a.id.text),
              'title': clean(a.title.text),
              'organization': clean(a.organization.text),
              'startDate': clean(a.startDate.text),
              'endDate': clean(a.endDate.text),
              'description': clean(a.description.text),
            }),
          )
          .toList(),

      /// Publications
      'publications': publications
          .where((p) => p.title.text.isNotEmpty || p.url.text.isNotEmpty)
          .map(
            (p) => cleanMap({
              '_id': clean(p.id.text),
              'title': clean(p.title.text),
              'url': clean(p.url.text),
            }),
          )
          .toList(),
    };

    return cleanMap(data);
  }

  /// Dispose method (IMPORTANT)
  void dispose() {
    id.dispose();
    userId.dispose();
    v.dispose();
    createdAt.dispose();
    updatedAt.dispose();
    resume.dispose();
    about.dispose();
    certifications.dispose();

    email.dispose();
    statusType.dispose();
    statusSince.dispose();
    statusNote.dispose();
    expectedReturn.dispose();
    gender.dispose();
    github.dispose();
    linkedin.dispose();
    name.dispose();
    openToShift.dispose();
    phone.dispose();
    portfolio.dispose();
    profileType.dispose();
    referralSource.dispose();
    semester.dispose();
    specialization.dispose();
    yearOfGraduation.dispose();
    currentSalaryAmount.dispose();
    currentSalaryCurrency.dispose();
    dob.dispose();
    ethnicity.dispose();
    expectedSalaryAmount.dispose();
    expectedSalaryCurrency.dispose();
    maritalStatus.dispose();
    visaStatus.dispose();
    noticePeriodStartDate.dispose();
    currentCompany.dispose();
    totalYearsOfExperience.dispose();
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
    companyEmail.dispose();
    noticePeriod.dispose();
    for (final controller in domainKnowledge) {
      controller.dispose();
    }
    for (final controller in employmentType) {
      controller.dispose();
    }
    for (final e in experiences) {
      e.company.dispose();
      e.role.dispose();
      e.startDate.dispose();
      e.endDate.dispose();
      e.description.dispose();
    }
    for (final controller in industry) {
      controller.dispose();
    }
    for (final e in leadershipExperiences) {
      e.organization.dispose();

      e.role.dispose();

      e.startDate.dispose();

      e.endDate.dispose();

      e.description.dispose();
    }
    for (final e in internationalExperiences) {
      e.country.dispose();

      e.role.dispose();

      e.startDate.dispose();

      e.endDate.dispose();

      e.description.dispose();
    }
    for (final controller in jobRoles) {
      controller.dispose();
    }
    for (final controller in languagesKnown) {
      controller.dispose();
    }

    for (final controller in locations) {
      controller.dispose();
    }
    for (final controller in lookingFor) {
      controller.dispose();
    }
    for (final controller in skills) {
      controller.dispose();
    }
    for (final controller in toolsAndPlatforms) {
      controller.dispose();
    }

    for (final controller in achievements) {
      controller.id.dispose();
      controller.title.dispose();
      controller.event.dispose();
      controller.date.dispose();
    }

    for (final controller in awards) {
      controller.id.dispose();
      controller.title.dispose();
      controller.organization.dispose();
      controller.startDate.dispose();
      controller.endDate.dispose();
      controller.description.dispose();
    }

    for (final controller in publications) {
      controller.id.dispose();
      controller.title.dispose();
      controller.url.dispose();
    }
  }
}
