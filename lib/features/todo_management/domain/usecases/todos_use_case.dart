import '../entities/todo_entity.dart';
import '../repos/todo_repo.dart';

class TodosUseCase {
  final TodoRepo todoRepo;

  TodosUseCase(this.todoRepo);

  Future<List<TodoEntity>> getTodos() async {
    return todoRepo.getTodos();
  }
}
