import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/index.dart';

class MyProfileViewModel extends ViewStateProvider {
  final OnboardingRepository _onboardingRepository =
      getIt<OnboardingRepository>();
  Map<String, dynamic>? careerInsights;
  Map<String, dynamic>? careerRanking;
  List<Map<String, dynamic>> degrees = [];
  List<Map<String, dynamic>> streams = [];
  XFile? pickedImage;
  bool _isUploadingProfileImage = false;

  bool get isUploadingProfileImage => _isUploadingProfileImage;
  String? selectedDegreeId;
  Future<void> getDegrees() async {
    final result = await _onboardingRepository.getDegrees();

    result.fold((_) {}, (r) {
      degrees = r;

      /// fallback if less than 5
      if (degrees.length < 5) {
        degrees.addAll([
          {"_id": "local1", "value": "B.Tech"},
          {"_id": "local2", "value": "MBA"},
          {"_id": "local3", "value": "BCA"},
        ]);
      }

      notifyListeners();
    });
  }

  Future<void> getStreams(String degreeId) async {
    selectedDegreeId = degreeId;

    final result = await _onboardingRepository.getStreams(degreeId: degreeId);

    result.fold((_) {}, (r) {
      streams = r;

      /// fallback
      if (streams.length < 5) {
        streams.addAll([
          {"value": "General"},
          {"value": "Other"},
        ]);
      }

      notifyListeners();
    });
  }

  Future<Failure?> updateProfileImage(XFile image) async {
    Failure? failure;

    _isUploadingProfileImage = true;
    notifyListeners();

    final result = await _onboardingRepository.updateOnboardingUser(
      body: {},
      image: image,
    );

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        user = r;
      },
    );

    _isUploadingProfileImage = false;
    notifyListeners();

    return failure;
  }

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

  Map<String, dynamic>? referralMetrics;
  Map<String, dynamic>? candidateStats;

  Future<Failure?> getCandidateStats() async {
    Failure? failure;

    try {
      final request = Request(
        method: RequestMethod.get,
        endpoint: "/application/dashboard/candidate/stats",
        isSafeRoute: true,
      );

      final response = await getIt<NetworkService>().request(request);

      candidateStats = response.data['data'];
    } catch (e) {
      failure = APIFailure.fromException(exception: APIException.from(e));
    }

    notifyListeners();
    return failure;
  }

  Future<void> addDegreeIfNeeded(String value) async {
    final exists = degrees.any(
      (e) =>
          e['value'].toString().toLowerCase().trim() ==
          value.toLowerCase().trim(),
    );

    if (exists) return;

    final result = await _onboardingRepository.createMasterData(
      type: "DEGREE",

      value: value,
    );

    result.fold((_) {}, (r) {
      degrees.add(r);

      notifyListeners();
    });
  }

  Future<void> addStreamIfNeeded({
    required String value,

    required String parentId,
  }) async {
    final exists = streams.any(
      (e) =>
          e['value'].toString().toLowerCase().trim() ==
          value.toLowerCase().trim(),
    );

    if (exists) return;

    final result = await _onboardingRepository.createMasterData(
      type: "STREAM",

      value: value,

      parent: parentId,
    );

    result.fold((_) {}, (r) {
      streams.add(r);

      notifyListeners();
    });
  }

  Future<Failure?> getReferralMetrics() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.getReferralMetrics();

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        referralMetrics = r;
      },
    );

    setViewState(ViewState.complete);
    return failure;
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
        getIt<NetworkService>()
            .request(request1)
            .catchError((_) => null), // prevent crash
        getIt<NetworkService>().request(request2).catchError((_) => null),
      ]);

      /// ✅ HANDLE RESPONSES
      if (responses[0] != null) {
        careerInsights = responses[0]!.data['data'];
      }

      if (responses[1] != null) {
        careerRanking = responses[1]!.data['data'];
      }
    } catch (e) {
      failure = APIFailure.fromException(exception: APIException.from(e));
    }

    setViewState(ViewState.complete);

    notifyListeners();

    return failure;
  }

  int get savedJobs => candidateStats?['savedCount'] ?? 0;

  int get totalApps => candidateStats?['totalApplications'] ?? 0;

  int get referralApps => candidateStats?['referralApplications'] ?? 0;
  int get totalReferrals => referralMetrics?['totalReferralsPosted'] ?? 0;

  int get totalApplications =>
      referralMetrics?['totalApplicationsReceived'] ?? 0;

  int get referredToCompany => referralMetrics?['totalReferredToCompany'] ?? 0;

  int get acceptedByCompany => referralMetrics?['totalAcceptedByCompany'] ?? 0;

  double get responseRate =>
      (referralMetrics?['responseRate'] as num?)?.toDouble() ?? 0;

  double get referralSuccessRate =>
      (referralMetrics?['referralSuccessRate'] as num?)?.toDouble() ?? 0;
  int get hiringScore => careerInsights?['hiringScore'] ?? 0;

  int get resumeScore => careerInsights?['resumeScore'] ?? 0;

  int get profileScore =>
      careerInsights?['hiringBreakdown']?['profileScore'] ?? 0;
  int get activityScore =>
      careerInsights?['hiringBreakdown']?['activityScore'] ?? 0;

  int get applicationQualityScore =>
      careerInsights?['hiringBreakdown']?['applicationQualityScore'] ?? 0;
  String get rankingLabel => careerRanking?['rankingLabel'] ?? "-";

  List<String> get missingSkills =>
      List<String>.from(careerInsights?['missingSkills'] ?? []);

  List<String> get highDemandSkills => List<String>.from(
    careerInsights?['categorizedSkills']?['highInDemand'] ?? [],
  );

  List<String> get suggestions =>
      List<String>.from(careerInsights?['suggestions'] ?? []);
}
