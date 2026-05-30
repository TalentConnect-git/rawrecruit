import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/data/application_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_application/data/application_data_source_impl.dart';
import 'package:rawrecruit/src/feature/revamp_application/repository/application_repository.dart';
import 'package:rawrecruit/src/feature/revamp_application/repository/application_repository_impl.dart';
import 'package:rawrecruit/src/feature/revamp_auth/data/index.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/data_source/dashboard_data_source_impl.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/data_source/dashbooard_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashbard_repository_impl.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/data/data_source/revamp_on_boarding_data_source_impl.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/data/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/index.dart';
import 'package:rawrecruit/src/features/auth/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/index.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/data_source/application_data_source.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/data_source/application_data_source_impl.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/repository/application_repo.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/repository/application_repo_impl.dart';
import 'package:rawrecruit/src/features/referral/data/data_source/referral_data_source.dart';
import 'package:rawrecruit/src/features/referral/data/repository/referral_repository.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/data/repository/scheduled_interview_repo.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/presentation/view_model/scheduled_interview_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/data/shortlist_data_source_impl.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/repository/shortlist_repository.dart';
import 'package:rawrecruit/src/features/shortlist/repository/shortlist_repository_impl.dart';

import '../../feature/revamp_onboarding/data/data_source/revamp_on_boarding_data_source.dart';
import '../../feature/revamp_onboarding/presentation/widgets/onboarding_local_service.dart';
import '../../features/chat/index.dart';
import '../../features/professional/job_postng/data/data_source/job_posting_data_source.dart';
import '../../features/professional/job_postng/data/data_source/job_posting_data_source_impl.dart';
import '../../features/professional/job_postng/data/repository/job_posting_repo.dart';
import '../../features/professional/job_postng/data/repository/job_posting_repo_impl.dart';
import '../../features/professional/professional_dashbaord/data/data_source/data_source.dart';
import '../../features/professional/professional_dashbaord/data/data_source/data_source_impl.dart';
import '../../features/professional/professional_dashbaord/data/repository/prof_dashboard_repository.dart';
import '../../features/professional/professional_dashbaord/data/repository/prof_dashboard_repository_impl.dart';
import '../../features/referral/data/data_source/referral_data_source_impl.dart';
import '../../features/referral/data/repository/referral_repository_impl.dart';
import '../../features/scheduled_interviews/data/data_source/scheduled_data_source.dart';
import '../../features/scheduled_interviews/data/data_source/scheduled_data_source_impl.dart';
import '../../features/scheduled_interviews/data/repository/scheduled_interview_repo_impl.dart';
import '../../features/shortlist/data/shortlist_data_source.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyLocator() async {
  getIt
    ..registerLazySingleton<NetworkService>(NetworkService.new)
    ..registerLazySingleton<NavigationRepository>(NavigationRepository.new)
    ..registerLazySingleton<AppStateProvider>(AppStateProvider.new)
    ..registerLazySingleton<NotificationProvider>(NotificationProvider.new)
    ..registerLazySingleton<OnboardingLocalService>(
      () => OnboardingLocalService(),
    )
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl())
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: getIt()),
    )
    ..registerLazySingleton<RevampAuthDataSource>(
      () => RevampAuthDataSourceImpl(),
    )
    ..registerLazySingleton<RevampAuthRepository>(
      () => RevampAuthRepositoryImpl(authDataSource: getIt()),
    )
    ..registerLazySingleton<ProfessionalDataSource>(
      () => ProfessionalDataSourceImpl(),
    )
    ..registerLazySingleton<ProfessionalRepository>(
      () => ProfessionalRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<ReferralPostDataSource>(
      () => ReferralPostDataSourceImpl(),
    )
    ..registerLazySingleton<ReferralApplicationDataSource>(
      () => ReferralApplicationDataSourceImpl(),
    )
    ..registerLazySingleton<ReferralApplicationRepository>(
      () => ReferralApplicationRepositoryImpl(
        getIt<ReferralApplicationDataSource>(),
      ),
    )
    ..registerLazySingleton<ReferralPostRepository>(
      () => ReferralPostRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<RevampOnboardingDataSource>(
      () => RevampOnboardingDataSourceImpl(),
    )
    ..registerLazySingleton<RevampOnboardingRepository>(
      () => RevampOnboardingRepositoryImpl(
        onboardingDataSource: getIt<RevampOnboardingDataSource>(),
      ),
    )
    ..registerLazySingleton<ShortlistDataSource>(
      () => ShortlistDataSourceImpl(),
    )
    ..registerLazySingleton<ShortlistRepository>(
      () => ShortlistRepositoryImpl(dataSource: getIt()),
    )
    ..registerLazySingleton<ApplicationDataSource>(
      () => ApplicationDataSourceImpl(),
    )
    ..registerLazySingleton<ApplicationRepository>(
      () => ApplicationRepositoryImpl(getIt<ApplicationDataSource>()),
    )
    ..registerLazySingleton<OnboardingDataSource>(
      () => OnboardingDataSourceImpl(),
    )
    ..registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepositoryImpl(onboardingDataSource: getIt()),
    )
    ..registerLazySingleton<DashboardDataSource>(
      () => DashboardDataSourceImpl(),
    )
    ..registerLazySingleton<NotificationDataSource>(
      () => NotificationDataSourceImpl(),
    )
    ..registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl(dataSource: getIt<DashboardDataSource>()),
    )
    ..registerLazySingleton<ShortlistViewModel>(() => ShortlistViewModel())
    ..registerLazySingleton<ChatDataSource>(() => ChatDataSourceImpl())
    ..registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(getIt<ChatDataSource>()),
    )
    ..registerLazySingleton<ChatViewModel>(() => ChatViewModel())
    ..registerLazySingleton<NotificationViewModel>(NotificationViewModel.new)
    ..registerLazySingleton<InterviewDataSource>(
      () => InterviewDataSourceImpl(),
    )
    ..registerLazySingleton<InterviewRepository>(
      () => InterviewRepositoryImpl(dataSource: getIt<InterviewDataSource>()),
    )
    ..registerLazySingleton<MyProfileViewModel>(() => MyProfileViewModel())
    ..registerLazySingleton<InterviewViewModel>(() => InterviewViewModel())
    ..registerLazySingleton<ReferralDataSource>(() => ReferralDataSourceImpl())
    ..registerLazySingleton<ReferralRepository>(
      () => ReferralRepositoryImpl(dataSource: getIt<ReferralDataSource>()),
    );
}
