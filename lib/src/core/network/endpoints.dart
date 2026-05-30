class Endpoints {
  ///AUTHENTICATION
  static String apiAuthMe = 'api/auth/me';
  static String apiAuthLogin = 'api/auth/login';
  static String apiAuthLogout = 'api/auth/logout';
  static String apiAuthSignup = 'api/auth/signup';
  static String apiAuthSendOtp = 'api/auth/send-otp';
  static String apiAuthForgotPassword = 'api/auth/forgot-password';
  static String apiAuthGoogle = 'api/auth/google';

  static String apiOffCampusJobs = 'api/student-dashboard/off-campus';
  static String apiInternshipPostings =
      'api/student-dashboard/internship-postings';
  static String saveOpportunity = 'application/saveopportunity';
  static const String applyOffCampus = "application/candidate/offcampus";
  static const String applicationStatus =
      "application/status/candidate/Off-campus";

  ///ONBOARDINGS
  static const apiOnboarding = 'api/onboarding';
  static const apiOnboardingMe = 'api/onboarding/me';
  static const apiOnboardingUpdate = 'api/onboarding/update';

  static const String referalListing = "api/student-dashboard/referral-jobs";
  static const String applicationAllReferrals = "/application/all-referrals";
  static const String metrics = "application/professional/metrics";

  static const String applicationUpdateStatus = 'application/update-status';
  static const String applicationMyReferralApplications =
      'application/my-referral-applications';
  static const String apiStudentDashboardPostedReferralJob =
      '/api/student-dashboard/posted-referral-job?showAll=true';
  static const String professionalAppliedJobs =
      'application/status/candidate/Referral';

  static const String chatUserList = 'api/messages/allusers';
  static const String getUnreadCounts = "api/messages/unread-count";
  static const String createConversation = "api/messages/conversation";

  static const String apiNotifications = "api/notifications";
  static const String apiInterviews = '/interviews';

  static const String careerInsights = '/api/career-insights';
  static const String careerRanking = '/api/career-insights/ranking';
  static const String professionalMatrics =
      '/application/professional/referral-metrics';

  //Alumni APIS
  static const String apiCandidateAlumni = 'api/candidate/alumni';
  static const String apiCandidateCollegeAlumni =
      'api/candidate/college-alumni';
  static const String apiCandidateCompanyAlumni =
      'api/candidate/company-alumni';
  static const String apiCandidateHiringNetwork =
      'api/candidate/hiring-network';
}
