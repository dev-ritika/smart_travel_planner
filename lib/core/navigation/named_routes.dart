import 'package:flutter/material.dart';
import 'package:integrated_todo/features/home/screen/home_screen.dart';
import 'package:integrated_todo/features/home_nav/screen/nav_screen.dart';
import 'package:integrated_todo/features/splash/screens/splash_screen.dart';
import 'package:integrated_todo/features/todos/data/models/task_data_model.dart';
import 'package:integrated_todo/features/todos/presentation/screens/addtask_screen.dart';
import 'package:integrated_todo/features/todos/presentation/screens/tasks_screen.dart';

class NamedRoutes {
  static const String splashScreen = "/splash";
  static const String addTaskScreen = "/addTask";
  static const String tasksScreen = "/allTasks";
  static const String navScreen = "/navScreen";
  static const String homeScreen = "/homeScreen";

  static final Map<String, Widget Function(BuildContext)> getRoutes = {
    splashScreen: (context) => SplashScreen(),
    addTaskScreen: (context) {
      TaskDataModel data;
      if (ModalRoute.of(context)?.settings.arguments != null) {
        data = ModalRoute.of(context)?.settings.arguments as TaskDataModel;
        return AddTaskScreen(taskData: data);
      }
      return AddTaskScreen();
    },
    tasksScreen: (context) => TasksScreen(),
    navScreen: (context) => NavScreen(),
    homeScreen: (context) => HomeScreen(),
  };
}
