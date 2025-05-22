import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/core/di/dependency_injection.dart';

import '../../data/api/todo_api.dart';
import '../../data/repos/todo_repo_impl.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/repos/todo_repo.dart';
import '../../domain/usecases/create_todo_use_case.dart';
import '../../domain/usecases/todos_use_case.dart';
import '../notifiers/todo_notifier.dart';

final todoApiProvider = Provider<TodoApi>((ref) {
  return TodoApi(createAndSetupDio());
});

final todoRepoProvider = Provider<TodoRepo>((ref) {
  final homeApi = ref.read(todoApiProvider);
  return TodoRepoImpl(homeApi);
});

final todosUseCaseProvider = Provider<TodosUseCase>((ref) {
  final homeRepo = ref.read(todoRepoProvider);
  return TodosUseCase(homeRepo);
});

final createTodoUseCaseProvider = Provider<CreateTodoUseCase>((ref) {
  final todoRepo = ref.read(todoRepoProvider);
  return CreateTodoUseCase(todoRepo);
});

final todoProvider =
    StateNotifierProvider<TodoNotifier, AsyncValue<List<TodoEntity>>>((ref) {
      final todosUseCase = ref.read(todosUseCaseProvider);
      final createTodoUseCase = ref.read(createTodoUseCaseProvider);

      return TodoNotifier(todosUseCase, createTodoUseCase);
    });
