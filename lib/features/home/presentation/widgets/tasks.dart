import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../domain/entities/todo_entity.dart';
import '../controllers/home_controller.dart';
import 'task_content.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = getIt<HomeController>();
    homeController.onInit();

    return Obx(() {
      if (homeController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: homeController.todos.length,
        itemBuilder: (context, index) {
          final todo = homeController.todos[index];
          return TaskCard(todo: todo);
        },
      );
    });
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: TaskContent(todo: todo),
    );
  }
}
