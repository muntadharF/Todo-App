import 'package:flutter/material.dart';
import 'package:todo_app/core/routing/app_screens.dart';

import '../../../../core/app_constants/app_colors.dart';
import '../../../../core/app_constants/app_strings.dart';
import '../../../../core/app_constants/app_text_styles.dart';
import '../widgets/home/tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.homeBackgroundColor,
        centerTitle: true,
        title: Text(
          AppStrings.appBarTitleForHome,
          style: ApptTextStyles.font20BlackMedium,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SafeArea(child: const Tasks()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppScreens.addTodoScreen);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
