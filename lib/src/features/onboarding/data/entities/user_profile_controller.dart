import 'package:flutter/material.dart';

import 'achievement_controller.dart';
import 'award_controller.dart';
import 'publication_controller.dart';

class UserProfileController {
  UserProfileController()
    : id = TextEditingController(),
      userId = TextEditingController(),
      v = TextEditingController(),
      createdAt = TextEditingController(),
      updatedAt = TextEditingController(),
      resume = TextEditingController(),
      about = TextEditingController(),
      certifications = TextEditingController(),
      cgpa = TextEditingController(),
      college = TextEditingController(),
      degree = TextEditingController(),
      degreeCertificate = TextEditingController(),
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
      servingNoticePeriod = TextEditingController();

  /// Basic Fields
  TextEditingController id;
  TextEditingController userId;
  TextEditingController v;

  TextEditingController createdAt;
  TextEditingController updatedAt;

  /// List<String> fields
  List<TextEditingController> domainKnowledge = [];
  List<TextEditingController> employmentType = [];
  List<TextEditingController> experiences = [];
  List<TextEditingController> industry = [];
  List<TextEditingController> internationalExperience = [];
  List<TextEditingController> jobRoles = [];
  List<TextEditingController> languagesKnown = [];
  List<TextEditingController> leadership = [];
  List<TextEditingController> locations = [];
  List<TextEditingController> lookingFor = [];
  List<TextEditingController> skills = [];
  List<TextEditingController> toolsAndPlatforms = [];

  /// Nested Controllers
  List<AchievementController> achievements = [];
  List<AwardController> awards = [];
  List<PublicationController> publications = [];

  /// Other fields
  TextEditingController resume;
  TextEditingController about;
  TextEditingController certifications;
  TextEditingController cgpa;
  TextEditingController college;
  TextEditingController degree;
  TextEditingController degreeCertificate;
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
  TextEditingController servingNoticePeriod;

  Map<String, dynamic> toMap() {
    String? clean(String? v) => v == null || v.trim().isEmpty ? null : v.trim();

    List<String>? cleanList(List<TextEditingController> list) {
      final values = list
          .map((e) => clean(e.text))
          .whereType<String>()
          .toList();
      return values.isEmpty ? null : values;
    }

    Map<String, dynamic> cleanMap(Map<String, dynamic> map) {
      map.removeWhere((key, value) {
        if (value == null) return true;
        if (value is String && value.isEmpty) return true;
        if (value is List && value.isEmpty) return true;
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
      'cgpa': clean(cgpa.text),
      'college': clean(college.text),
      'degree': clean(degree.text),
      'degreeCertificate': clean(degreeCertificate.text),
      'email': clean(email.text),
      'gender': clean(gender.text),
      'github': clean(github.text),
      'linkedin': clean(linkedin.text),
      'name': clean(name.text),
      'openToShift': clean(openToShift.text),
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

      'servingNoticePeriod': servingNoticePeriod.text.toLowerCase() == 'true',

      /// Lists
      'skills': cleanList(skills),
      'domainKnowledge': cleanList(domainKnowledge),
      'employmentType': cleanList(employmentType),
      'experiences': cleanList(experiences),
      'industry': cleanList(industry),
      'internationalExperience': cleanList(internationalExperience),
      'jobRoles': cleanList(jobRoles),
      'languagesKnown': cleanList(languagesKnown),
      'leadership': cleanList(leadership),
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
    cgpa.dispose();
    college.dispose();
    degree.dispose();
    degreeCertificate.dispose();
    email.dispose();
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
    servingNoticePeriod.dispose();

    for (final controller in domainKnowledge) {
      controller.dispose();
    }
    for (final controller in employmentType) {
      controller.dispose();
    }
    for (final controller in experiences) {
      controller.dispose();
    }
    for (final controller in industry) {
      controller.dispose();
    }
    for (final controller in internationalExperience) {
      controller.dispose();
    }
    for (final controller in jobRoles) {
      controller.dispose();
    }
    for (final controller in languagesKnown) {
      controller.dispose();
    }
    for (final controller in leadership) {
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
