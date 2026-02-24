import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/data/application_data_source.dart';
import 'package:rawrecruit/src/features/application/data/application_data_source_impl.dart';
import 'package:rawrecruit/src/features/application/repository/application_repository.dart';
import 'package:rawrecruit/src/features/application/repository/application_repository_impl.dart';
import 'package:rawrecruit/src/features/auth/index.dart';
import 'package:rawrecruit/src/features/dashboard/data/data_source/dashboard_data_source_impl.dart';
import 'package:rawrecruit/src/features/dashboard/data/data_source/dashbooard_data_source.dart';
import 'package:rawrecruit/src/features/dashboard/data/repository/dashbard_repository_impl.dart';
import 'package:rawrecruit/src/features/dashboard/data/repository/dashboard_repository.dart';
import 'package:rawrecruit/src/features/onboarding/data/index.dart';
import 'package:rawrecruit/src/features/shortlist/data/shortlist_data_source_impl.dart';
import 'package:rawrecruit/src/features/shortlist/repository/shortlist_repository.dart';
import 'package:rawrecruit/src/features/shortlist/repository/shortlist_repository_impl.dart';

import '../../features/application/data/application_data_source.dart';
import '../../features/professional/professional_dashbaord/data/data_source/data_source.dart';
import '../../features/shortlist/data/shortlist_data_source.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyLocator() async {
  getIt
    ..registerLazySingleton<NetworkService>(NetworkService.new)
    ..registerLazySingleton<AppStateProvider>(AppStateProvider.new)
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl())
    ..registerLazySingleton<ShortlistDataSource>(
      () => ShortlistDataSourceImpl(),
    )
    ..registerLazySingleton<ApplicationDataSource>(
      () => ApplicationDataSourceImpl(),
    )
    ..registerLazySingleton<ApplicationRepository>(
      () => ApplicationRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<ProfessionalDataSource>(
      () => ProfessionalDataSourceImpl(),
    )
    ..registerLazySingleton<ProfessionalRepository>(
      () => ProfessionalRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<ShortlistRepository>(
      () => ShortlistRepositoryImpl(dataSource: getIt()),
    )
    ..registerLazySingleton<ReferralPostDataSource>(
      () => ReferralPostDataSourceImpl(),
    )
    ..registerLazySingleton<ReferralPostRepository>(
      () => ReferralPostRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: getIt()),
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
    ..registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl(dataSource: getIt<DashboardDataSource>()),
    );
}
