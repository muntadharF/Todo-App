import 'package:flutter/material.dart';

import '../../../../../core/app_constants/app_strings.dart';
import '../../../../../core/helpers/spacing_helper.dart';
import 'app_text_field.dart';
import 'save_todo_btn.dart';

class AddTodoBody extends StatelessWidget {
  const AddTodoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextField(
          controller: titleController,
          label: AppStrings.appTextFieldLableTitle,
        ),
        verticalSpace(24),

        SaveTodoBtn(titleController: titleController),
      ],
    );
  }
}
