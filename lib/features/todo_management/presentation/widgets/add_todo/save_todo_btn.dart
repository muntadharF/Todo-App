import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_constants/app_strings.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../controllers/todo_controller.dart';

class SaveTodoBtn extends StatelessWidget {
  const SaveTodoBtn({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    final todoController = getIt<TodoController>();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          final title = titleController.text.trim();

          if (title.isNotEmpty) {
            todoController.createTodo(title, 'pending');
            Navigator.pop(context);
          }
        },

        icon: const Icon(Icons.check),
        label: const Text(AppStrings.todoTextBtnSave),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
