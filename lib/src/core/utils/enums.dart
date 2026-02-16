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
