import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/api/home_api.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/home/domain/usecases/todos_use_case.dart';
import '../../features/home/presentation/controllers/home_controller.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<HomeApi>(() => HomeApi(createAndSetupDio()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerLazySingleton<TodosUseCase>(() => TodosUseCase(getIt()));
  getIt.registerLazySingleton<HomeController>(() => HomeController(getIt()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(seconds: 10)
    ..options.receiveTimeout = Duration(seconds: 30);

  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true,
    ),
  );

  return dio;
}
