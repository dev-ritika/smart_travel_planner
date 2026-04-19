import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrated_todo/core/app_consts/color_consts.dart';
import 'package:integrated_todo/features/todos/presentation/bloc/bloc/task_bloc.dart';
import 'package:intl/intl.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your tasks")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: state.taskDataModel?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = state.taskDataModel?[index];
                      final image = state.taskDataModel?[index].imageFile?.path;
                      return Dismissible(
                        key: ValueKey("value"),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        direction: DismissDirection.endToStart,

                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(0, 0),
                                color: Colors.black.withAlpha(100),
                                spreadRadius: 0,
                                //spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: ColorConsts.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  radius: 50,

                                  backgroundImage: image == null
                                      ? null
                                      : FileImage(File(image)),
                                  child: image == null
                                      ? Icon(Icons.image, size: 40)
                                      : null,
                                ),
                              ),
                              SizedBox(width: 20),
                              SizedBox(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?.title ?? "",
                                      style: TextStyle(fontSize: 20),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      data?.description ?? "",
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 9),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConsts.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),

                                    child: Text(
                                      data?.category ?? "",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Text(
                                    DateFormat(
                                      'dd MMMM yyyy',
                                    ).format(data?.dueDate ?? DateTime.now()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );

                      // ListTile(
                      //   title: Text(state.taskDataModel?[index].title ?? ""),
                      //   subtitle: Text(
                      //     state.taskDataModel?[index].description ?? "",
                      //   ),
                      //   contentPadding: EdgeInsets.all(0),
                      //   minVerticalPadding: 20,
                      //   horizontalTitleGap: 0,
                      //   minLeadingWidth: 50,
                      //   trailing: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       Icons.delete,
                      //       color: ColorConsts.primaryColor,
                      //     ),
                      //   ),
                      //   leading: Container(
                      //     padding: EdgeInsets.all(5),
                      //     decoration: BoxDecoration(
                      //       color: ColorConsts.primaryColor,
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: CircleAvatar(
                      //       radius: 50,

                      //       backgroundImage: image == null
                      //           ? null
                      //           : FileImage(File(image)),
                      //       child: image == null
                      //           ? Icon(Icons.image, size: 40)
                      //           : null,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
