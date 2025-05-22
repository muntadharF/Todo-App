import '../../domain/entities/todo_entity.dart';
import '../../domain/repos/todo_repo.dart';
import '../api/todo_api.dart';
import '../mappers/todo_mapper.dart';
import '../models/todo.dart';

class TodoRepoImpl extends TodoRepo {
  final TodoApi todoApi;

  TodoRepoImpl(this.todoApi);

  @override
  Future<List<TodoEntity>> getTodos() async {
    List<Todo> todos = await todoApi.getTodos();

    List<TodoEntity> todosAsEntity =
        todos.map((todo) => TodoMapper.toTodoEntity(todo)).toList();
    return todosAsEntity;
  }

  @override
  Future<TodoEntity> createTodo(String title, String status) async {
    final todoMap = {"title": title, "status": status};

    final Todo createdTodo = await todoApi.createTodo(todoMap);
    return TodoMapper.toTodoEntity(createdTodo);
  }
}
