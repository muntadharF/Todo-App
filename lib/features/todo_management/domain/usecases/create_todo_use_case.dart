import '../entities/todo_entity.dart';
import '../repos/home_repo.dart';

class CreateTodoUseCase {
  final HomeRepo homeRepo;

  CreateTodoUseCase(this.homeRepo);

  Future<TodoEntity> createTodo(String title, String status) async {
    return homeRepo.createTodo(title, status);
  }
}
