import 'package:todo_app/features/home/domain/entities/todo_entity.dart';

import '../repos/home_repo.dart';

class TodosUseCase {
  final HomeRepo homeRepo;

  TodosUseCase(this.homeRepo);

  Future<List<TodoEntity>> getTodos() async {
    return homeRepo.getTodos();
  }
}