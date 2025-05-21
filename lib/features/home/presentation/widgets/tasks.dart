import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'task_content.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return TaskCard();
      },
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: TaskContent(),
    );
  }
}
