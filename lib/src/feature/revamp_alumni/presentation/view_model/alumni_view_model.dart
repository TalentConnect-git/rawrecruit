import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../../../revamp_dashboard/data/repository/dashboard_repository.dart';

class AlumniViewModel extends ChangeNotifier {
  final _repo = getIt<DashboardRepository>();

  List<User> _all = [
    // Job(
    //   id: "1",
    //   jobTitle: "Flutter Developer",
    //   description: "Build cross-platform apps using Flutter",
    //   companyName: "HasneticLabs",
    //
    //   contactPerson: User(
    //     id: "u1",
    //     name: "Hasan",
    //     email: "hasan@example.com",
    //     mobile: "9999999999",
    //   ),
    //
    //   candidatePosted: User(
    //     id: "c1",
    //     userId: "user_001",
    //     v: 1,
    //     name: "Rahul Sharma",
    //     email: "rahul@example.com",
    //     mobile: "9876543210",
    //     phone: "9876543210",
    //     profileImage: "https://example.com/profile1.jpg",
    //     profileType: "student",
    //     designation: "Software Engineer Intern",
    //     about: "Flutter dev with backend skills",
    //     gender: "Male",
    //     dob: "2000-01-01",
    //     maritalStatus: "Single",
    //     ethnicity: "Indian",
    //     github: "https://github.com/rahul",
    //     linkedin: "https://linkedin.com/in/rahul",
    //     portfolio: "https://rahul.dev",
    //     college: "IIT Bombay",
    //     degree: "B.Tech",
    //     specialization: "Computer Science",
    //     semester: "8",
    //     yearOfGraduation: "2024",
    //     cgpa: "8.7",
    //     degreeCertificate: "https://example.com/cert1.pdf",
    //     currentCompany: "Intern Corp",
    //     noticePeriod: "30 days",
    //     currentSalaryAmount: "30000",
    //     currentSalaryCurrency: "INR",
    //     expectedSalaryAmount: "60000",
    //     expectedSalaryCurrency: "INR",
    //     visaStatus: "N/A",
    //     skills: ["Flutter", "Dart", "Node.js"],
    //     toolsAndPlatforms: ["Firebase", "Git"],
    //     languagesKnown: ["English", "Hindi"],
    //     domainKnowledge: ["Mobile Development"],
    //     jobRoles: ["Mobile Developer"],
    //     industry: ["IT"],
    //     employmentType: ["Internship"],
    //     lookingFor: ["Full-time"],
    //     locations: ["Mumbai"],
    //     internationalExperience: ["None"],
    //     leadership: ["Project Lead"],
    //     resume: "https://example.com/resume1.pdf",
    //     experiences: [
    //       Experience(
    //         company: "StartupX",
    //         role: "Flutter Intern",
    //         startDate: "2023-01-01",
    //         endDate: "2023-06-01",
    //         description: "Built app features",
    //       ),
    //     ],
    //     achievements: [],
    //     awards: [],
    //     publications: [],
    //     certifications: "Flutter Certification",
    //     referralSource: "LinkedIn",
    //     openToShift: "Yes",
    //     servingNoticePeriod: false,
    //     emailVerified: true,
    //     createdAt: "2024-01-01T00:00:00Z",
    //     updatedAt: "2024-01-10T00:00:00Z",
    //   ),
    // ),
    //
    // Job(
    //   id: "2",
    //   jobTitle: "Backend Developer",
    //   description: "Develop scalable APIs using Node.js",
    //   companyName: "TechCorp",
    //
    //   contactPerson: User(
    //     id: "u2",
    //     name: "Amit Verma",
    //     email: "amit@example.com",
    //     mobile: "8888888888",
    //   ),
    //
    //   candidatePosted: User(
    //     id: "c2",
    //     userId: "user_002",
    //     v: 1,
    //     name: "Priya Singh",
    //     email: "priya@example.com",
    //     mobile: "9123456780",
    //     phone: "9123456780",
    //     profileImage: "https://example.com/profile2.jpg",
    //     profileType: "student",
    //     designation: "Backend Intern",
    //     about: "Node.js developer with DB expertise",
    //     gender: "Female",
    //     dob: "1999-05-12",
    //     maritalStatus: "Single",
    //     ethnicity: "Indian",
    //     github: "https://github.com/priya",
    //     linkedin: "https://linkedin.com/in/priya",
    //     portfolio: "https://priya.dev",
    //     college: "Delhi University",
    //     degree: "B.Sc",
    //     specialization: "Computer Science",
    //     semester: "6",
    //     yearOfGraduation: "2023",
    //     cgpa: "8.3",
    //     degreeCertificate: "https://example.com/cert2.pdf",
    //     currentCompany: "DevHub",
    //     noticePeriod: "15 days",
    //     currentSalaryAmount: "25000",
    //     currentSalaryCurrency: "INR",
    //     expectedSalaryAmount: "50000",
    //     expectedSalaryCurrency: "INR",
    //     visaStatus: "N/A",
    //     skills: ["Node.js", "Express", "MongoDB"],
    //     toolsAndPlatforms: ["Docker", "AWS"],
    //     languagesKnown: ["English"],
    //     domainKnowledge: ["Backend"],
    //     jobRoles: ["Backend Developer"],
    //     industry: ["IT"],
    //     employmentType: ["Internship"],
    //     lookingFor: ["Full-time"],
    //     locations: ["Delhi"],
    //     internationalExperience: ["None"],
    //     leadership: ["Hackathon Lead"],
    //     resume: "https://example.com/resume2.pdf",
    //     experiences: [
    //       Experience(
    //         company: "CodeBase",
    //         role: "Backend Intern",
    //         startDate: "2022-06-01",
    //         endDate: "2022-12-01",
    //         description: "Worked on REST APIs",
    //       ),
    //     ],
    //     achievements: [],
    //     awards: [],
    //     publications: [],
    //     certifications: "Node Certification",
    //     referralSource: "College",
    //     openToShift: "No",
    //     servingNoticePeriod: true,
    //     emailVerified: false,
    //     createdAt: "2024-02-01T00:00:00Z",
    //     updatedAt: "2024-02-10T00:00:00Z",
    //   ),
    // ),
    //
    // Job(
    //   id: "3",
    //   jobTitle: "UI/UX Designer",
    //   description: "Design clean and user-friendly interfaces",
    //   companyName: "Designify",
    //
    //   contactPerson: User(
    //     id: "u3",
    //     name: "Neha Kapoor",
    //     email: "neha@example.com",
    //     mobile: "7777777777",
    //   ),
    //
    //   candidatePosted: User(
    //     id: "c3",
    //     userId: "user_003",
    //     v: 1,
    //     name: "Arjun Mehta",
    //     email: "arjun@example.com",
    //     mobile: "9012345678",
    //     phone: "9012345678",
    //     profileImage: "https://example.com/profile3.jpg",
    //     profileType: "student",
    //     designation: "UI/UX Designer",
    //     about: "Creative designer focused on user experience",
    //     gender: "Male",
    //     dob: "1998-08-20",
    //     maritalStatus: "Single",
    //     ethnicity: "Indian",
    //     github: "https://github.com/arjun",
    //     linkedin: "https://linkedin.com/in/arjun",
    //     portfolio: "https://arjun.design",
    //     college: "NIFT",
    //     degree: "B.Des",
    //     specialization: "UI/UX",
    //     semester: "8",
    //     yearOfGraduation: "2022",
    //     cgpa: "8.9",
    //     degreeCertificate: "https://example.com/cert3.pdf",
    //     currentCompany: "Design Studio",
    //     noticePeriod: "Immediate",
    //     currentSalaryAmount: "40000",
    //     currentSalaryCurrency: "INR",
    //     expectedSalaryAmount: "70000",
    //     expectedSalaryCurrency: "INR",
    //     visaStatus: "N/A",
    //     skills: ["Figma", "Adobe XD"],
    //     toolsAndPlatforms: ["Photoshop"],
    //     languagesKnown: ["English", "Hindi"],
    //     domainKnowledge: ["Design"],
    //     jobRoles: ["UI Designer"],
    //     industry: ["Design"],
    //     employmentType: ["Full-time"],
    //     lookingFor: ["Remote"],
    //     locations: ["Bangalore"],
    //     internationalExperience: ["None"],
    //     leadership: ["Design Lead"],
    //     resume: "https://example.com/resume3.pdf",
    //     experiences: [
    //       Experience(
    //         company: "Creative Labs",
    //         role: "Designer",
    //         startDate: "2021-01-01",
    //         endDate: "2022-01-01",
    //         description: "Worked on product UI",
    //       ),
    //     ],
    //     achievements: [],
    //     awards: [],
    //     publications: [],
    //     certifications: "UX Certification",
    //     referralSource: "Website",
    //     openToShift: "Yes",
    //     servingNoticePeriod: false,
    //     emailVerified: true,
    //     createdAt: "2024-03-01T00:00:00Z",
    //     updatedAt: "2024-03-10T00:00:00Z",
    //   ),
    // ),
  ];
  List<User> filtered = [];
  bool isLoading = false;

  Map<String, List<Job>> collegeAlumni = {};
  Map<String, List<Job>> companyAlumni = {};

  List<List<Job>> get hiringAlumni {
    final college = collegeAlumni.values
        .where((jobs) => jobs.isNotEmpty)
        .toList();

    final company = companyAlumni.values
        .where((jobs) => jobs.isNotEmpty)
        .toList();

    return [...college, ...company];
  }

  List<List<Job>> jobs(AlumniType type) {
    switch (type) {
      case AlumniType.hiring:
        return hiringAlumni;
      case AlumniType.college:
        return collegeAlumni.values.toList();
      case AlumniType.company:
        return companyAlumni.values.toList();
    }
  }

  /// 🔥 SEARCH
  Future<void> fetchCollegeAlumni() async {
    isLoading = true;
    notifyListeners();

    final result = await _repo.getCollegeAlumni();

    result.fold((_) {}, (data) {
      if (data.isNotEmpty) {
        _all = data;
        filtered = data;
      }

      /// 🔥 GROUP BY USER ID
      collegeAlumni = {};

      for (var job in _all) {
        final id = job.id ?? "unknown";

        if (!collegeAlumni.containsKey(id)) {
          collegeAlumni[id] = [];
        }

        collegeAlumni[id]!.add(Job(candidatePosted: job));
      }
    });

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCompanyAlumni() async {
    isLoading = true;
    notifyListeners();

    final result = await _repo.getCompanyAlumni();

    result.fold((_) {}, (res) {
      final userCompany = getIt<AppStateProvider>().user?.currentCompany;

      final data = res.alumni?[userCompany] ?? [];
      _all = data;
      filtered = data;

      /// 🔥 GROUP BY USER ID
      companyAlumni = {};

      for (var job in data) {
        final id = job.id ?? "unknown";

        if (!companyAlumni.containsKey(id)) {
          companyAlumni[id] = [];
        }

        companyAlumni[id]!.add(Job(candidatePosted: job));
      }
    });

    isLoading = false;
    notifyListeners();
  }

  void search(String query, AlumniType type) {
    if (query.isEmpty) {
      filtered = _all;
    } else {
      filtered = _all.where((job) {
        final name = job.name?.toLowerCase() ?? '';
        return name.contains(query.toLowerCase());
      }).toList();
    }

    /// 🔥 regroup filtered list
    collegeAlumni = {};

    for (var job in filtered) {
      final id = job.id ?? "unknown";

      if (!collegeAlumni.containsKey(id)) {
        collegeAlumni[id] = [];
      }

      collegeAlumni[id]!.add(Job(candidatePosted: job));
    }

    notifyListeners();
  }
}
