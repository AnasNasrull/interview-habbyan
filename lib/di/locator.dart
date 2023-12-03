import 'package:get_it/get_it.dart';
import 'package:interview_test/data/datasource/auth_remote_datasource.dart';
import 'package:interview_test/data/datasource/recent_event_remote_data_source.dart';
import 'package:interview_test/data/repository/auth_repo_impl.dart';
import 'package:interview_test/data/repository/recent_event_repo_impl.dart';
import 'package:interview_test/domain/repository/auth_repository.dart';
import 'package:interview_test/domain/repository/recent_event_repo.dart';
import 'package:interview_test/domain/use%20case/auth_use_case.dart';
import 'package:interview_test/domain/use%20case/recent_event_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

void init() async {
  locator.registerLazySingleton(() => RecentEventRemoteDataSource());

  locator.registerLazySingleton<RecentEventRepository>(
    () => RecentEventRepositoryImpl(locator<RecentEventRemoteDataSource>()),
  );

  locator.registerLazySingleton<RecentEventUseCase>(
    () => RecentEventUseCase(locator<RecentEventRepository>()),
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();

  locator.registerLazySingleton(() => AuthRemoteDatasource(prefs));

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator<AuthRemoteDatasource>()),
  );

  locator.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(locator<AuthRepository>()),
  );
}
