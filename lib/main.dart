import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrated_todo/core/navigation/named_routes.dart';
import 'package:integrated_todo/core/utilities/ui_utilities/app_themedata.dart';
import 'package:integrated_todo/features/splash/screens/splash_screen.dart';
import 'package:integrated_todo/features/todos/presentation/bloc/bloc/task_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TaskBloc())],

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: NamedRoutes.getRoutes,
        theme: AppThemedata.getAppThemeData(),
        home: SplashScreen(),
      ),
    );
  }
}
