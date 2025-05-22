import 'package:get/get.dart';

import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/create_todo_use_case.dart';
import '../../domain/usecases/todos_use_case.dart';

class TodoController extends GetxController {
  final TodosUseCase todosUseCase;
  final CreateTodoUseCase createTodoUseCase;

  TodoController(this.todosUseCase, this.createTodoUseCase);

  RxList<TodoEntity> todos = <TodoEntity>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    try {
      isLoading.value = true;
      todos.value = await todosUseCase.getTodos();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createTodo(String title, String status) async {
    try {
      isLoading.value = true;
      TodoEntity newTodo = await createTodoUseCase.createTodo(title, status);
      todos.insert(0, newTodo);
    } finally {
      isLoading.value = false;
    }
  }
}
