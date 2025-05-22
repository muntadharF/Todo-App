import 'package:flutter/material.dart';

import '../../features/todo_management/presentation/screens/add_todo_screen.dart';
import '../../features/todo_management/presentation/screens/home_screen.dart';
import 'app_screens.dart';

class AppRoutes {
  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      case AppScreens.addTodoScreen:
        {
          return MaterialPageRoute(builder: (_) => const AddTodoScreen());
        }

      default:
        return null;
    }
  }
}
