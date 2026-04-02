import 'dart:convert';

import 'package:rawrecruit/src/feature/revamp_onboarding/data/revamp_entities/achievement_model.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/data/revamp_entities/award_model.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/data/revamp_entities/publication_model.dart';

class OnboardingData {
  OnboardingData();
  /// ================= BASIC =================
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? dob;
  String? ethnicity;
  String? maritalStatus;
  String? visaStatus;

  /// ================= EDUCATION =================
  String? college;
  String? degree;
  String? specialization;
  String? semester;
  String? yearOfGraduation;
  String? cgpa;

  /// ================= LINKS =================
  String? github;
  String? linkedin;
  String? portfolio;
  String? resumeUrl;

  /// ================= CAREER =================
  String? openToShift;
  String? currentSalaryAmount;
  String? currentSalaryCurrency;
  String? expectedSalaryAmount;
  String? expectedSalaryCurrency;
  String? about;

  String? certifications;

  /// ================= SKILLS =================
  List<String> skills = [];

  /// ================= WORK PREF =================
  List<String> jobRoles = [];
  List<String> industry = [];
  List<String> employmentType = [];
  List<String> lookingFor = [];
  List<String> languagesKnown = [];
  List<String> locations = [];

  /// ================= ACHIEVEMENTS =================
  List<AchievementModel> achievements = [];
  List<AwardModel> awards = [];
  List<PublicationModel> publications = [];

  /// ================= TO JSON =================
  Map<String, dynamic> toJson() {
    return {
      /// BASIC
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender,
"dob": (dob != null && dob!.isNotEmpty) ? dob : null,      "ethnicity": ethnicity,
      "maritalStatus": maritalStatus,
      "visaStatus": visaStatus,

      /// EDUCATION
      "college": college,
      "degree": degree,
      "specialization": specialization,
      "semester": semester,
      "yearOfGraduation": yearOfGraduation,
      "cgpa": cgpa,

      /// LINKS
      "github": github,
      "linkedin": linkedin,
      "portfolio": portfolio,
      "resumeUrl": resumeUrl,

      /// CAREER
      "openToShift": openToShift,
      "currentSalaryAmount": currentSalaryAmount,
      "currentSalaryCurrency": currentSalaryCurrency,
      "expectedSalaryAmount": expectedSalaryAmount,
      "expectedSalaryCurrency": expectedSalaryCurrency,
      "about": about,

      /// ⚠️ backend expects string sometimes → adjust if needed
"certifications": certifications,
      /// SKILLS
      "skills": skills,

      /// WORK PREF
      "jobRoles": jobRoles,
      "industry": industry,
      "employmentType": employmentType,
      "lookingFor": lookingFor,
      "languagesKnown": languagesKnown,
      "locations": locations,

      /// ACHIEVEMENTS
    "achievements": jsonEncode(
  achievements.map((e) => e.toJson()).toList(),
),

"awards": jsonEncode(
  awards.map((e) => e.toJson()).toList(),
),

"publications": jsonEncode(
  publications.map((e) => e.toJson()).toList(),
),
    };
  }
  factory OnboardingData.fromJson(Map<String, dynamic> json) {
  return OnboardingData()
    ..name = json["name"]
    ..email = json["email"]
    ..phone = json["phone"]
    ..gender = json["gender"]
    ..dob = json["dob"]
    ..ethnicity = json["ethnicity"]
    ..maritalStatus = json["maritalStatus"]
    ..visaStatus = json["visaStatus"]

    /// EDUCATION
    ..college = json["college"]
    ..degree = json["degree"]
    ..specialization = json["specialization"]
    ..semester = json["semester"]
    ..yearOfGraduation = json["yearOfGraduation"]
    ..cgpa = json["cgpa"]

    /// LINKS
    ..github = json["github"]
    ..linkedin = json["linkedin"]
    ..portfolio = json["portfolio"]
    ..resumeUrl = json["resumeUrl"]

    /// CAREER
    ..openToShift = json["openToShift"]
    ..currentSalaryAmount = json["currentSalaryAmount"]
    ..currentSalaryCurrency = json["currentSalaryCurrency"]
    ..expectedSalaryAmount = json["expectedSalaryAmount"]
    ..expectedSalaryCurrency = json["expectedSalaryCurrency"]
    ..about = json["about"]

    /// LISTS (SAFE PARSE)
    ..certifications = json["certifications"]
    ..skills = List<String>.from(json["skills"] ?? [])

    ..jobRoles = List<String>.from(json["jobRoles"] ?? [])
    ..industry = List<String>.from(json["industry"] ?? [])
    ..employmentType = List<String>.from(json["employmentType"] ?? [])
    ..lookingFor = List<String>.from(json["lookingFor"] ?? [])
    ..languagesKnown = List<String>.from(json["languagesKnown"] ?? [])
    ..locations = List<String>.from(json["locations"] ?? [])

    /// ACHIEVEMENTS
    ..achievements = (json["achievements"] as List? ?? [])
        .map((e) => AchievementModel.fromJson(e))
        .toList()

    ..awards = (json["awards"] as List? ?? [])
        .map((e) => AwardModel.fromJson(e))
        .toList()

    ..publications = (json["publications"] as List? ?? [])
        .map((e) => PublicationModel.fromJson(e))
        .toList();
}
}
