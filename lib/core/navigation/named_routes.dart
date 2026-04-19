import 'package:flutter/material.dart';
import 'package:integrated_todo/features/splash/screens/splash_screen.dart';
import 'package:integrated_todo/features/todos/presentation/screens/addtask_screen.dart';
import 'package:integrated_todo/features/todos/presentation/screens/tasks_screen.dart';

class NamedRoutes {
  static const String splashScreen = "/splash";
  static const String addTaskScreen = "/addTask";
  static const String tasksScreen = "/allTasks";

  static final Map<String, Widget Function(BuildContext)> getRoutes = {
    splashScreen: (context) => SplashScreen(),
    addTaskScreen: (context) => AddTaskScreen(),
    tasksScreen: (context) => TasksScreen(),
  };
}
