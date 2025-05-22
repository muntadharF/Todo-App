import '../../domain/entities/todo_entity.dart';
import '../models/todo.dart';

class TodoMapper {
  TodoMapper._();

  static TodoEntity toTodoEntity(Todo todo) => TodoEntity(
    title: todo.title ?? "Default title",
    status: todo.status ?? 'Default status',
  );
}
