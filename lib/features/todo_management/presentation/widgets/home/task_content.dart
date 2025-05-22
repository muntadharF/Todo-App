import 'package:flutter/material.dart';

import '../../../../../core/app_constants/app_text_styles.dart';
import '../../../domain/entities/todo_entity.dart';

class TaskContent extends StatelessWidget {
  const TaskContent({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title, style: ApptTextStyles.font14PrimaryColorMedium),
      subtitle: Text(todo.title, overflow: TextOverflow.ellipsis),
      trailing: Text(todo.status),
    );
  }
}
