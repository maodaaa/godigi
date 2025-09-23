import 'package:get_it/get_it.dart';
import 'package:godigi/data/data.dart';
import 'package:godigi/domain/domain.dart';

final getIt = GetIt.instance;

void initDependency() {
  getIt.registerSingletonAsync<SharedPrefAdapter>(() async {
    final instance = SharedPrefAdapter.instance;
    await instance.init();
    return instance;
  });

  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(prefService: getIt()));

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(localDataSource: getIt()),
  );

  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(localDataSource: getIt()),
  );
}
