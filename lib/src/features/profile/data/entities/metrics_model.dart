class ReferralMetrics {
  final int totalReferralsPosted;
  final int totalApplicationsReceived;
  final int totalReferredToCompany;
  final int totalAcceptedByCompany;
  final int responseRate;
  final int referralSuccessRate;

  ReferralMetrics.fromJson(Map<String, dynamic> json)
    : totalReferralsPosted = json['totalReferralsPosted'] ?? 0,
      totalApplicationsReceived = json['totalApplicationsReceived'] ?? 0,
      totalReferredToCompany = json['totalReferredToCompany'] ?? 0,
      totalAcceptedByCompany = json['totalAcceptedByCompany'] ?? 0,
      responseRate = json['responseRate'] ?? 0,
      referralSuccessRate = json['referralSuccessRate'] ?? 0;
}
