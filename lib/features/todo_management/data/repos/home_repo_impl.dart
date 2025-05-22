import '../../domain/entities/todo_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../api/home_api.dart';
import '../mappers/todo_mapper.dart';
import '../models/todo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeApi homeApi;

  HomeRepoImpl(this.homeApi);

  @override
  Future<List<TodoEntity>> getTodos() async {
    List<Todo> todos = await homeApi.getTodos();

    List<TodoEntity> todosAsEntity =
        todos.map((todo) => TodoMapper.toTodoEntity(todo)).toList();
    return todosAsEntity;
  }
}
