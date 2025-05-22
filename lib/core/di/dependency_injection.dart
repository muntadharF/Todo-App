import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/todo_management/data/api/todo_api.dart';
import '../../features/todo_management/data/repos/todo_repo_impl.dart';
import '../../features/todo_management/domain/repos/todo_repo.dart';
import '../../features/todo_management/domain/usecases/create_todo_use_case.dart';
import '../../features/todo_management/domain/usecases/todos_use_case.dart';
import '../../features/todo_management/presentation/notifiers/todo_controller.dart';
import '../../features/todo_management/presentation/notifiers/todo_notifier.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<TodoApi>(() => TodoApi(createAndSetupDio()));
  getIt.registerLazySingleton<TodoRepo>(() => TodoRepoImpl(getIt()));
  getIt.registerLazySingleton<TodosUseCase>(() => TodosUseCase(getIt()));
  getIt.registerLazySingleton<CreateTodoUseCase>(() => CreateTodoUseCase(getIt()));
  getIt.registerLazySingleton<TodoNotifier>(
    () => TodoNotifier(getIt<TodosUseCase>(), getIt<CreateTodoUseCase>()),
  );
  getIt.registerLazySingleton<TodoController>(() => TodoController(getIt(), getIt()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(seconds: 10)
    ..options.receiveTimeout = Duration(seconds: 30);
  
  dio.options.headers['Authorization'] = 'Bearer 25349713e28ce7a6202778f652bf8b78418470556a08e2f1d90f0f0acde957a2';

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
