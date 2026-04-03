import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';

enum UserType { student, fresher, professional }

enum AuthProvider { manual, google, linkedIn }

enum UserStatus { active, pending, blocked }

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

  String get desc {
    switch (this) {
      case UserType.student:
        return 'Let others find and refer you';
      case UserType.fresher:
        return 'Let others find and refer you';
      case UserType.professional:
        return 'Help candidates land roles at your company';
    }
  }

  IconData get icon {
    switch (this) {
      case UserType.student:
        return Icons.person_add_alt_1;
      case UserType.fresher:
        return Icons.group;
      case UserType.professional:
        return Icons.work_outline;
    }
  }

  String get apiLabel {
    switch (this) {
      case UserType.student:
        return 'student';
      case UserType.fresher:
        return 'fresher';
      case UserType.professional:
        return 'professional';
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
      case AuthProvider.manual:
        return 'manual';
      case AuthProvider.google:
        return 'google';
      case AuthProvider.linkedIn:
        return 'linkedin';
    }
  }

  static AuthProvider fromValue(String value) {
    switch (value) {
      case 'manual':
        return AuthProvider.manual;
      case 'google':
        return AuthProvider.google;
      case 'linkedin':
        return AuthProvider.linkedIn;
      default:
        throw UnimplementedError();
    }
  }
}

extension UserStatusExt on UserStatus {
  String get label {
    switch (this) {
      case UserStatus.active:
        return 'active';
      case UserStatus.pending:
        return 'pending';
      case UserStatus.blocked:
        return 'blocked';
    }
  }

  static UserStatus fromValue(String value) {
    switch (value) {
      case 'active':
        return UserStatus.active;
      case 'pending':
        return UserStatus.pending;
      case 'blocked':
        return UserStatus.blocked;
      default:
        throw UnimplementedError();
    }
  }
}

enum NavItem { home, referrer, applications, shortlist, chat }

extension NavItemExt on NavItem {
  static List<NavItem> get professionals => NavItem.values
      .where((element) => element != NavItem.applications)
      .toList();

  static List<NavItem> get freshers =>
      NavItem.values.where((element) => element != NavItem.referrer).toList();

  String get label {
    switch (this) {
      case NavItem.home:
        return 'Home';
      case NavItem.referrer:
        return 'Referrer';
      case NavItem.applications:
        return 'Application';
      case NavItem.shortlist:
        return 'Shortlist';
      // case NavItem.profile:
      //   return 'Profile';
      case NavItem.chat:
        return 'Chat';
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
      case NavItem.referrer:
        return Icons.group;
      // case NavItem.profile:
      //   return Icons.person;
      case NavItem.chat:
        return Icons.chat_bubble;
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
      // case NavItem.profile:
      //   return Icons.person_outline;
      case NavItem.referrer:
        return Icons.group_outlined;
      case NavItem.chat:
        return Icons.chat_bubble_outline;
    }
  }

  String get path {
    switch (this) {
      case NavItem.home:
        return RouteNames.dashboard;
      case NavItem.applications:
        return RouteNames.application;
      case NavItem.shortlist:
        return RouteNames.shortlist;
      // case NavItem.profile:
      //   return Icons.person_outline;
      case NavItem.referrer:
        return RouteNames.jobPosted;
      case NavItem.chat:
        return RouteNames.chatUserList;
    }
  }
}
