import 'package:flutter/material.dart';
import 'package:integrated_todo/features/splash/screens/splash_screen.dart';
import 'package:integrated_todo/features/todos/presentation/screens/todo_screen.dart';

class NamedRoutes {
  static const String splashScreen = "/splash";
  static const String todoScreen = "/todo";

  static final Map<String, Widget Function(BuildContext)> getRoutes = {
    splashScreen: (context) => SplashScreen(),
    todoScreen: (context) => ToDoScreen(),
  };
}
