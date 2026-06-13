import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart'
    show
        NetworkService,
        NavigationRepository,
        AppStateProvider,
        NotificationProvider;
import 'package:rawrecruit/src/core/provider/interview_provider.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show
        ApplicationDataSource,
        ApplicationRepository,
        ApplicationDataSourceImpl,
        ApplicationRepositoryImpl,
        ApplicationViewModel;
import 'package:rawrecruit/src/features/auth/index.dart'
    show AuthDataSource, AuthRepository, AuthDataSourceImpl, AuthRepositoryImpl;
import 'package:rawrecruit/src/features/chat/index.dart'
    show
        ChatDataSource,
        ChatRepository,
        ChatViewModel,
        ChatDataSourceImpl,
        ChatRepositoryImpl;
import 'package:rawrecruit/src/features/dashboard/index.dart'
    show
        DashboardDataSource,
        DashboardRepository,
        DashboardDataSourceImpl,
        DashboardRepositoryImpl,
        DashboardViewModel;
import 'package:rawrecruit/src/features/notifications/index.dart'
    show
        NotificationDataSource,
        NotificationRepository,
        NotificationViewModel,
        NotificationDataSourceImpl,
        NotificationRepositoryImpl;
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show
        OnboardingDataSource,
        OnboardingDataSourceImpl,
        OnboardingRepository,
        OnboardingRepositoryImpl,
        OnboardingLocalService,
        MyProfileViewModel;
import 'package:rawrecruit/src/features/professional/application_listing/data/data_source/application_data_source.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/data_source/application_data_source_impl.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/repository/application_repo.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/repository/application_repo_impl.dart';
import 'package:rawrecruit/src/features/referral/data/data_source/referral_data_source.dart';
import 'package:rawrecruit/src/features/referral/data/repository/referral_repository.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/data/repository/scheduled_interview_repo.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/presentation/view_model/scheduled_interview_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/data/shortlist_data_source_impl.dart';
import 'package:rawrecruit/src/features/shortlist/repository/shortlist_repository.dart';
import 'package:rawrecruit/src/features/shortlist/repository/shortlist_repository_impl.dart';
import 'package:rawrecruit/src/features/web_jobs/presentation/view_models/web_jobs_view_model.dart';

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
import '../../features/shortlist/presentation/view_model/shortlist_view_model.dart'
    show ShortlistViewModel;
import '../../features/web_jobs/data/index.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyLocator() async {
  getIt
    ..registerLazySingleton<NetworkService>(NetworkService.new)
    ..registerLazySingleton<NavigationRepository>(NavigationRepository.new)
    ..registerLazySingleton<AppStateProvider>(AppStateProvider.new)
    ..registerLazySingleton<NotificationProvider>(NotificationProvider.new)
    ..registerLazySingleton<InterviewProvider>(InterviewProvider.new)
    ..registerLazySingleton<OnboardingLocalService>(
      () => OnboardingLocalService(),
    )
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl())
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: getIt()),
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
    ..registerLazySingleton<DashboardViewModel>(() => DashboardViewModel())
    ..registerLazySingleton<ApplicationViewModel>(() => ApplicationViewModel())
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
    )
    ..registerFactory<WebJobViewModel>(() => WebJobViewModel())
    ..registerLazySingleton<WebJobDataSource>(() => WebJobDataSourceImpl())
    ..registerLazySingleton<WebJobRepository>(
      () => WebJobRepositoryImpl(webJobDataSource: getIt<WebJobDataSource>()),
    );
}
