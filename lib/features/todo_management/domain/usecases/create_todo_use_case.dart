import '../entities/todo_entity.dart';
import '../repos/todo_repo.dart';

class CreateTodoUseCase {
  final TodoRepo todoRepo;

  CreateTodoUseCase(this.todoRepo);

  Future<TodoEntity> createTodo(String title, String status) async {
    return todoRepo.createTodo(title, status);
  }
}
