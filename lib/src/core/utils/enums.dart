import 'package:flutter/material.dart';

enum UserType { student, fresher, professional }

enum AuthProvider { google, email }

extension UserTypeExt on UserType {
  String get label {
    switch (this) {
      case UserType.student:
        return 'Student';
      case UserType.fresher:
        return 'Fresher';
      case UserType.professional:
        return 'Professional';
    }
  }

  static UserType fromValue(String value) {
    switch (value) {
      case 'student':
        return UserType.student;
      case 'fresher':
        return UserType.fresher;
      case 'professional':
        return UserType.professional;
      default:
        throw UnimplementedError();
    }
  }
}

extension AuthProviderExt on AuthProvider {
  String get label {
    switch (this) {
      case AuthProvider.email:
        return 'email';
      case AuthProvider.google:
        return 'google';
    }
  }
}

enum NavItem { home, shortlist, applications, profile }

extension NavItemExt on NavItem {
  String get label {
    switch (this) {
      case NavItem.home:
        return 'Home';
      case NavItem.applications:
        return 'Application';
      case NavItem.shortlist:
        return 'Shortlist';
      case NavItem.profile:
        return 'Profile';
    }
  }

  IconData get selectedIcon {
    switch (this) {
      case NavItem.home:
        return Icons.home;
      case NavItem.applications:
        return Icons.assignment;
      case NavItem.shortlist:
        return Icons.bookmark;
      case NavItem.profile:
        return Icons.person;
    }
  }

  IconData get unSelectedIcon {
    switch (this) {
      case NavItem.home:
        return Icons.home_outlined;
      case NavItem.applications:
        return Icons.assignment_outlined;
      case NavItem.shortlist:
        return Icons.bookmark_outline;
      case NavItem.profile:
        return Icons.person_outline;
    }
  }
}
