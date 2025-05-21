import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_constants/app_strings.dart';

class SaveTodoBtn extends StatelessWidget {
  const SaveTodoBtn({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          final title = titleController.text.trim();
          final description = descriptionController.text.trim();

          if (title.isNotEmpty) {
            Navigator.pop(context, {
              'title': title,
              'description': description,
            });
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
