import '../entities/todo_entity.dart';

abstract class HomeRepo {
  Future<List<TodoEntity>> getTodos();
}
