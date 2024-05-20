import 'package:portfolio/common/env/environment.dart';

class EnvironmentImpl implements Environment {
  factory EnvironmentImpl() {
    return _instance ??= EnvironmentImpl._();
  }

  EnvironmentImpl._();

  static EnvironmentImpl? _instance;

  @override
  String get userName => const String.fromEnvironment('USER_NAME');

  @override
  String get userEmail => const String.fromEnvironment('USER_EMAIL');

  @override
  String get githubUser => const String.fromEnvironment('GITHUB_USER');

  @override
  String get skillsFileName => const String.fromEnvironment('SKILLS_FILE_NAME');

  @override
  String get githubBaseUrl => const String.fromEnvironment('GITHUB_BASE_URL');

  @override
  String get githubAuthToken => const String.fromEnvironment('GITHUB_AUTH_TOKEN');

  @override
  String get linkedInProfileUrl => const String.fromEnvironment('LINKEDIN_PROFILE_URL');
}
