enum UserType { student, fresher, professional }

enum AuthProvider { google, email }

extension UserTypeExt on UserType {
  String get label {
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
      case AuthProvider.email:
        return 'email';
      case AuthProvider.google:
        return 'google';
    }
  }
}
