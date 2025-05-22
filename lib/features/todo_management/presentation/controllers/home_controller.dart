import 'package:get/get.dart';

import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/todos_use_case.dart';

class HomeController extends GetxController {
  final TodosUseCase todosUseCase;

  HomeController(this.todosUseCase);

  RxList<TodoEntity> todos = <TodoEntity>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  void getTodos() async {
    try {
      isLoading.value = true;
      todos.value = await todosUseCase.getTodos();
    } finally {
      isLoading.value = false;
    }
  }
}
