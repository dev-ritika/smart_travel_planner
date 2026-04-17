import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:integrated_todo/core/app_consts/color_consts.dart';
import 'package:integrated_todo/core/app_consts/image_consts.dart';
import 'package:integrated_todo/core/utilities/ui_utilities/lens_clipper.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final valueListenable = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(ImageConsts.screenBg),
                // scale: 1,
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Add a task"),
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: SizedBox(
                        width: double.infinity,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            dropdownStyleData: DropdownStyleData(
                              //maxHeight: 260,
                              decoration: BoxDecoration(
                                color: ColorConsts.whiteColor,
                                // borderRadius: BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                  color: ColorConsts.primaryColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              width: double.infinity,

                              decoration: BoxDecoration(
                                color: ColorConsts.whiteColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),

                                border: Border.all(
                                  color: ColorConsts.primaryColor,
                                  width: 2,
                                ),
                              ),
                            ),

                            items: [
                              DropdownItem(child: Text("Work"), value: "Work"),
                              DropdownItem(child: Text("Home"), value: "Home"),
                              DropdownItem(
                                child: Text("Personal"),
                                value: "Personal",
                              ),
                              DropdownItem(
                                child: Text("Casual"),
                                value: "Casual",
                              ),
                              DropdownItem(
                                child: Text("Other"),
                                value: "Other",
                              ),
                            ],

                            valueListenable: valueListenable,

                            underline: null,

                            onChanged: (value) {
                              valueListenable.value = value;
                            },

                            hint: Text("Select a category"),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter title of your task",

                          labelText: "Title",
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: TextFormField(
                        maxLines: 15,
                        decoration: InputDecoration(
                          constraints: BoxConstraints(maxHeight: 200),
                          hintText: "Enter decription of your task",

                          labelText: "Description",
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          inputDecorationTheme: InputDecorationTheme.of(context)
                              .copyWith(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                        ),
                        child: InputDatePickerFormField(
                          fieldHintText: "mm/dd/yyyy",
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2070),
                          fieldLabelText: "enterrr",
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: ColorConsts.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                            color: ColorConsts.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              // backgroundColor: ColorConsts.primaryColor,
                              child: Image.file(
                                File(""),
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error, size: 50),
                              ),
                            ),
                            SizedBox(width: 10),

                            Flexible(
                              child: Text(
                                "name jh jhjh jh jh kiuiujh jkh kj hkjh ",
                                //style: TextStyle(color: Colors.white),
                                style: TextTheme.of(context).bodyMedium,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10),

                            ClipPath(
                              clipper: LensRoundedClipper(
                                centerHeight: 44,
                                cornerHeight: 40,
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: Ink(
                                      width: 100,
                                      height: 44,

                                      //  padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: ColorConsts.secondaryColor,
                                      ),

                                      child: Center(
                                        child: Text(
                                          "Upload",
                                          //style: TextStyle(color: Colors.white),
                                          style: TextTheme.of(context)
                                              .bodyMedium
                                              ?.copyWith(
                                                color: ColorConsts.primaryColor,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 60),

                    ClipPath(
                      clipper: LensRoundedClipper(),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            child: Ink(
                              width: double.infinity,
                              height: 52,

                              decoration: BoxDecoration(
                                color: ColorConsts.primaryColor,
                              ),

                              child: Center(
                                child: Text(
                                  "Add Task",
                                  //style: TextStyle(color: Colors.white),
                                  style: TextTheme.of(context).titleLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
