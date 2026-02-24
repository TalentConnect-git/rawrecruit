class Endpoints {
  ///AUTHENTICATION
  static String apiAuthMe = 'api/auth/me';
  static String apiAuthLogin = 'api/auth/login';
  static String apiAuthLogout = 'api/auth/logout';
  static String apiAuthSignup = 'api/auth/signup';
  static String apiAuthSendOtp = 'api/auth/send-otp';

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
  static String saveOpportunity = 'application/saveopportunity';
  static const String applyOffCampus = "application/candidate/offcampus";
  static const String applicationStatus =
      "application/status/candidate/Off-campus";

  static const String referalListing = "api/student-dashboard/referral-jobs";
  static const String metrics = "application/professional/metrics";
}
