import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/index.dart';

class MyProfileViewModel extends ViewStateProvider {
  final OnboardingRepository _onboardingRepository =
      getIt<OnboardingRepository>();
Map<String, dynamic>? careerInsights;
Map<String, dynamic>? careerRanking;
  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  bool get isProfileAvailable =>
      user?.profileImage != null && (user?.profileImage?.isNotEmpty ?? false);

  bool get canEdit => _user != null;

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  set isEditing(bool value) {
    _isEditing = value;
    notifyListeners();
  }

  Future<Failure?> getUser() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.getOnboardingUser();

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        user = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> updateUser() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.updateOnboardingUser(body: {});

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        user = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
Future<Failure?> getCareerInsights() async {
  Failure? failure;

  setViewState(ViewState.busy);

  try {
    final request1 = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.careerInsights,
      isSafeRoute: true,
    );

    final request2 = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.careerRanking,
      isSafeRoute: true,
    );

    /// 🔥 CALL BOTH SAFELY
    final responses = await Future.wait([
      getIt<NetworkService>().request(request1)
          .catchError((_) => null), // prevent crash
      getIt<NetworkService>().request(request2)
          .catchError((_) => null),
    ]);

    /// ✅ HANDLE RESPONSES
    if (responses[0] != null) {
      careerInsights = responses[0]!.data['data'];
    }

    if (responses[1] != null) {
      careerRanking = responses[1]!.data['data'];
    }

  } catch (e) {
    failure = APIFailure.fromException(
      exception: APIException.from(e),
    );
  }

  setViewState(ViewState.complete);
  notifyListeners();

  return failure;
}
  int get hiringScore => careerInsights?['hiringScore'] ?? 0;

int get resumeScore => careerInsights?['resumeScore'] ?? 0;

int get profileScore =>
    careerInsights?['hiringBreakdown']?['profileScore'] ?? 0;

String get rankingLabel =>
    careerRanking?['rankingLabel'] ?? "-";

List<String> get missingSkills =>
    List<String>.from(careerInsights?['missingSkills'] ?? []);

List<String> get highDemandSkills =>
    List<String>.from(
        careerInsights?['categorizedSkills']?['highInDemand'] ?? []);

List<String> get suggestions =>
    List<String>.from(careerInsights?['suggestions'] ?? []);
}
