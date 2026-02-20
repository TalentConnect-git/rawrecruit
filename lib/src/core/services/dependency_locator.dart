import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/auth/index.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyLocator() async {
  getIt
    ..registerLazySingleton<NetworkService>(NetworkService.new)
    ..registerLazySingleton<AppStateProvider>(AppStateProvider.new)
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl())
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: getIt()),
    );
}
