import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/todo.dart';

part 'todo_api.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/users/7439481")
abstract class TodoApi {
  factory TodoApi(Dio dio) = _TodoApi;

  @GET('/todos')
  Future<List<Todo>> getTodos();

  @POST('/todos')
  Future<Todo> createTodo(@Body() Map<String, dynamic> todo);
}
