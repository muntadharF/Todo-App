import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_constants/app_strings.dart';
import '../../providers/todo_provider.dart';

final isSavingProvider = StateProvider<bool>((ref) => false);

class SaveTodoBtn extends ConsumerWidget {
  const SaveTodoBtn({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaving = ref.watch(isSavingProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed:
            isSaving
                ? null
                : () async {
                  final title = titleController.text.trim();
                  if (title.isNotEmpty) {
                    ref.read(isSavingProvider.notifier).state = true;

                    await ref
                        .read(todoProvider.notifier)
                        .createTodo(title, 'Pending');

                    ref.read(isSavingProvider.notifier).state = false;

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
        icon:
            isSaving
                ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                : const Icon(Icons.check),
        label: Text(isSaving ? 'Saving...' : AppStrings.todoTextBtnSave),
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
