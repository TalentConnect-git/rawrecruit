import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/index.dart';
import '../index.dart';

class OnboardingLocalService {
  static const String onboardingStepKey =
      'onboarding_step';

  static const String onboardingUserKey =
      'onboarding_user';

  static const String onboardingCompletedKey =
      'onboarding_completed';

  /// SAVE STEP
  Future<void> saveStep(int step) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setInt(
      onboardingStepKey,
      step,
    );
  }

  /// GET STEP
  Future<int> getStep() async {
    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getInt(onboardingStepKey) ?? 0;
  }

  /// SAVE USER
  Future<void> saveUser(User user) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      onboardingUserKey,
      jsonEncode(user.toJson()),
    );
  }

  /// GET USER
  Future<User?> getUser() async {
    final prefs =
        await SharedPreferences.getInstance();

    final data =
        prefs.getString(onboardingUserKey);

    if (data == null) return null;

    return User.fromJson(jsonDecode(data));
  }

  /// COMPLETE
  Future<void> markCompleted() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool(
      onboardingCompletedKey,
      true,
    );
  }

  /// CHECK
  Future<bool> isCompleted() async {
    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getBool(
          onboardingCompletedKey,
        ) ??
        false;
  }

  /// CLEAR
  Future<void> clear() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove(onboardingStepKey);

    await prefs.remove(onboardingUserKey);
  }
}