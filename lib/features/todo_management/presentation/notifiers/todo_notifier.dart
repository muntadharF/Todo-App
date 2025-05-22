import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/create_todo_use_case.dart';
import '../../domain/usecases/todos_use_case.dart';

class TodoNotifier extends StateNotifier<AsyncValue<List<TodoEntity>>> {
  final TodosUseCase todosUseCase;
  final CreateTodoUseCase createTodoUseCase;

  TodoNotifier(this.todosUseCase, this.createTodoUseCase)
    : super(const AsyncValue.loading()) {
    getTodos();
  }

  Future<void> getTodos() async {
    try {
      state = const AsyncValue.loading();
      final todos = await todosUseCase.getTodos();
      state = AsyncValue.data(todos);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Future<void> createTodo(String title, String status) async {
  //   state = const AsyncValue.loading();
  //   try {
  //     final newTodo = await createTodoUseCase.createTodo(title, status);
  //     final currentTodos = state.value ?? [];
  //     final updatedList = [newTodo, ...currentTodos];
  //     state = AsyncValue.data(updatedList);
  //   } catch (error, stackTrace) {
  //     state = AsyncValue.error(error, stackTrace);
  //   }
  // }

  // Future<void> createTodo(String title, String status) async {
  //   final previousTodos = state.value ?? [];

  //   try {
  //     final newTodo = await createTodoUseCase.createTodo(title, status);
  //     final updatedList = [newTodo, ...previousTodos];
  //     state = AsyncValue.data(updatedList);
  //   } catch (error, stackTrace) {
  //     state = AsyncValue.error(error, stackTrace);
  //   }
  // }

  Future<void> createTodo(String title, String status) async {
    try {
      final currentTodos = state.value ?? [];
      final newTodo = await createTodoUseCase.createTodo(title, status);
      final updatedList = [newTodo, ...currentTodos];
      state = AsyncValue.data(updatedList);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
