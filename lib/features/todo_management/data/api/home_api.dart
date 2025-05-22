import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/todo.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/users/7439479")
abstract class HomeApi {
  factory HomeApi(Dio dio) = _HomeApi;

  @GET('/todos')
  Future<List<Todo>> getTodos();
}
