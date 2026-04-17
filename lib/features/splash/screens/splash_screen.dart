import 'package:flutter/material.dart';
import 'package:integrated_todo/features/splash/widgets/start_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/splash_bg.png",
            height: MediaQuery.of(context).size.height * 0.65,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Task Management & To-Do List",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "This productive tool is designed to help you better manage your task project-wise conveniently!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                SizedBox(height: 40),

                SplashStartButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
