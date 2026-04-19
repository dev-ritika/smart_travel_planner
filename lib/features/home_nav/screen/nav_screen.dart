import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:integrated_todo/core/app_consts/color_consts.dart';
import 'package:integrated_todo/features/home/screen/home_screen.dart';
import 'package:integrated_todo/features/todos/presentation/screens/addtask_screen.dart';
import 'package:integrated_todo/features/todos/presentation/screens/tasks_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final NotchBottomBarController navController = NotchBottomBarController();

  final List<Widget> screens = [HomeScreen(), AddTaskScreen(), TasksScreen()];

  Widget currentPage = HomeScreen();

  void goToPage(int index) {
    setState(() {
      currentPage = screens[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: Text("Home")),
      // bottomNavigationBar:
      body: Stack(
        children: [
          currentPage,

          Positioned(
            bottom: 0,

            child: AnimatedNotchBottomBar(
              onTap: (index) {
                goToPage(index);
              },
              kIconSize: 30,
              kBottomRadius: 20,
              color: ColorConsts.secondaryColor,
              notchBottomBarController: navController,
              notchColor: ColorConsts.primaryColor,
              itemLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorConsts.primaryColor,
                fontWeight: FontWeight.bold,
              ),

              bottomBarItems: [
                BottomBarItem(
                  itemLabel: "Home",
                  inActiveItem: Icon(
                    Icons.home_outlined,
                    color: ColorConsts.primaryColor,
                    size: 35,
                  ),
                  activeItem: Transform.translate(
                    offset: Offset(-5, -5),
                    child: Icon(
                      Icons.home,
                      color: ColorConsts.whiteColor,
                      size: 35,
                    ),
                  ),
                ),

                BottomBarItem(
                  itemLabel: "Add",
                  inActiveItem: Icon(
                    Icons.add_circle_outline,
                    color: ColorConsts.primaryColor,
                    size: 35,
                  ),
                  activeItem: Transform.translate(
                    offset: Offset(-5, -5),
                    child: Icon(
                      Icons.add_circle,
                      color: ColorConsts.whiteColor,
                      size: 35,
                    ),
                  ),
                ),

                BottomBarItem(
                  itemLabel: "Tasks",
                  inActiveItem: Icon(
                    Icons.view_list_outlined,
                    color: ColorConsts.primaryColor,
                    size: 35,
                  ),
                  activeItem: Transform.translate(
                    offset: Offset(-5, -5),
                    child: Icon(
                      Icons.view_list,
                      color: ColorConsts.whiteColor,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
