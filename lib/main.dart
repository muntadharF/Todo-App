import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_constants/app_colors.dart';
import 'core/app_constants/app_strings.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();

  // Ensure screen size for flutter_screenutil (fixes hidden text in release mode)
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base screen size for scaling
      minTextAdapt: true, // Ensures text scales properly
      splitScreenMode: true, // Supports split-screen and multi-window mode
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
          ),
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
