/// Centralized keys for SecretRepo / SharedPreferences access.
///
/// Keeping these in one place avoids typos from duplicated string literals
/// scattered across services, and gives you a single spot to update if a
/// key ever needs to change.
abstract class StorageKeys {
  static const authToken = 'auth_token';
  static const refreshToken = 'refresh_token';
  static const referralPostDraft = 'referral_post_draft';
  static const experience = 'experience';
}
