import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:integrated_todo/core/app_consts/color_consts.dart';
import 'package:integrated_todo/core/app_consts/image_consts.dart';
import 'package:integrated_todo/core/navigation/named_routes.dart';
import 'package:integrated_todo/core/utilities/ui_utilities/lens_clipper.dart';
import 'package:integrated_todo/features/todos/data/data_source/task_image_datasource.dart';
import 'package:integrated_todo/features/todos/data/models/task_data_model.dart';
import 'package:integrated_todo/features/todos/presentation/bloc/bloc/task_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final valueListenable = ValueNotifier<String?>(null);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String category = "";
  String title = "";
  String description = "";
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TaskBloc, TaskState, bool>(
      selector: (state) => state.isLoading,
      builder: (context, isLoading) {
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
                    child: Form(
                      onChanged: () {
                        print("validating...");
                        context.read<TaskBloc>().add(
                          FormValidEvent(
                            isFormValid:
                                _formKey.currentState?.validate() ?? false,
                          ),
                        );
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
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
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
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
                                    DropdownItem(
                                      child: Text("Work"),
                                      value: "Work",
                                    ),
                                    DropdownItem(
                                      child: Text("Home"),
                                      value: "Home",
                                    ),
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
                                    category = value ?? "";
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
                              initialValue: "",
                              validator: (value) {
                                if ((value?.length ?? 0) < 3 &&
                                    (value?.isNotEmpty ?? true)) {
                                  return "Enter valid title";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Enter title of your task",

                                labelText: "Title",
                              ),
                              onChanged: (value) {
                                title = value;
                              },
                            ),
                          ),

                          SizedBox(height: 40),

                          Material(
                            elevation: 6,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: TextFormField(
                              validator: (value) {
                                if ((value?.length ?? 0) < 3 &&
                                    (value?.isNotEmpty ?? true)) {
                                  return "Enter valid title";
                                } else {
                                  return null;
                                }
                              },
                              initialValue: "",
                              maxLines: 15,
                              onChanged: (value) {
                                description = value;
                              },
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
                                inputDecorationTheme:
                                    InputDecorationTheme.of(context).copyWith(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                              ),
                              child: InputDatePickerFormField(
                                fieldHintText: "mm/dd/yyyy",
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2070),
                                errorInvalidText: "Enter valid dob",
                                errorFormatText:
                                    "Enter correct format mm/dd/yyyy",
                                fieldLabelText: "Enter date",
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(
                                  color: ColorConsts.primaryColor,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  // CircleAvatar(

                                  //   radius: 40,
                                  //   // backgroundColor: ColorConsts.primaryColor,
                                  //   child: Image.file(
                                  //     image == null
                                  //         ? File("")
                                  //         : File(image?.path ?? ""),
                                  //     height: 80,
                                  //     width: 80,
                                  //     fit: BoxFit.cover,

                                  //     errorBuilder:
                                  //         (context, error, stackTrace) =>
                                  //             Icon(Icons.error, size: 50),
                                  //   ),
                                  // ),
                                  CircleAvatar(
                                    radius: 44,
                                    backgroundColor: ColorConsts.secondaryColor,
                                    child: CircleAvatar(
                                      radius: 40,

                                      backgroundImage: image != null
                                          ? FileImage(File(image?.path ?? ""))
                                          : null,
                                      child: image == null
                                          ? Icon(Icons.image, size: 40)
                                          : null,
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  Flexible(
                                    child: Text(
                                      image?.path.split('/').last ?? "",
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
                                        onTap: () async {
                                          final x =
                                              await ImagePickerDataSourceImpl()
                                                  .getCameraImage();

                                          if (x == null) return;

                                          setState(() {
                                            image = x;
                                            print("heyyy $x");
                                          });
                                        },
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
                                                      color: ColorConsts
                                                          .primaryColor,
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
                            child:
                                BlocSelector<
                                  TaskBloc,
                                  TaskState,
                                  ({bool isValid, bool isAdded})
                                >(
                                  selector: (state) => (
                                    isValid: state.isFormAdded ?? false,
                                    isAdded: state.isAdded ?? false,
                                  ),

                                  builder: (context, status) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: !status.isValid
                                            ? null
                                            : () {
                                                context.read<TaskBloc>().add(
                                                  AddTaskEvent(
                                                    taskDataModel:
                                                        TaskDataModel(
                                                          description:
                                                              description,
                                                          category: category,
                                                          title: title,
                                                          imageFile: image,
                                                        ),
                                                  ),
                                                );
                                              },
                                        child: Ink(
                                          child: Ink(
                                            width: double.infinity,
                                            height: 52,

                                            decoration: BoxDecoration(
                                              color: !status.isValid
                                                  ? ColorConsts.primaryColor
                                                        .withAlpha(100)
                                                  : ColorConsts.primaryColor,
                                            ),

                                            child: Center(
                                              child: Text(
                                                "Add Task",
                                                //style: TextStyle(color: Colors.white),
                                                style: TextTheme.of(context)
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                          ),

                          SizedBox(height: 30),

                          ClipPath(
                            clipper: LensRoundedClipper(),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(
                                    context,
                                  ).pushNamed(NamedRoutes.tasksScreen);
                                },
                                child: Ink(
                                  child: Ink(
                                    width: double.infinity,
                                    height: 52,

                                    decoration: BoxDecoration(
                                      color: ColorConsts.primaryColor,
                                    ),

                                    child: Center(
                                      child: Text(
                                        "Next",
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
            ),

            Visibility(
              visible: isLoading,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withAlpha(150),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 7,
                    color: ColorConsts.secondaryColor,
                  ),
                ),
              ),
            ),

            BlocListener<TaskBloc, TaskState>(
              listener: (context, state) async {
                state.isLoading;

                print("is added ${state.isAdded}");

                // if ((state.isAdded ?? false) && !state.isLoading) {
                if ((state.isAdded ?? false)) {
                  Fluttertoast.showToast(msg: "Task added successfully !");
                }
              },
              child: Container(),
            ),

            BlocListener<TaskBloc, TaskState>(
              listener: (context, state) {
                if (state.isAdded ?? false) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _formKey.currentState?.reset();
                    valueListenable.value = null;
                  });
                }
              },
              child: Container(),
            ),
          ],
        );
      },
    );
  }
}
