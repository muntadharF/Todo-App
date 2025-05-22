import '../entities/todo_entity.dart';

abstract class HomeRepo {
  Future<List<TodoEntity>> getTodos();
  Future<TodoEntity> createTodo(String title, String status);
}
