import 'dart:io';

import 'package:image_picker/image_picker.dart';

class TaskDataModel {
  final String category;
  final String title;
  final String description;
  final DateTime dueDate;
  final XFile? imageFile;

  TaskDataModel({
    required this.description,
    required this.category,
    DateTime? dueDate,
    this.imageFile,
    required this.title,
  }) : dueDate = dueDate ?? DateTime.now();

  TaskDataModel copyWith({
    String? category,
    String? title,
    String? description,
    DateTime? dueDate,
    XFile? imageFile,
  }) {
    return TaskDataModel(
      description: description ?? this.description,
      category: category ?? this.category,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson(TaskDataModel taskDataModel) {
    return {
      "category": taskDataModel.category,
      "title": taskDataModel.title,
      "description": taskDataModel.description,
      "dueDate": taskDataModel.dueDate,
      "imageFile": taskDataModel.imageFile,
    };
  }

  TaskDataModel fromJson(Map<String, dynamic> data) {
    return TaskDataModel(
      description: data["description"],
      category: data["category"],
      title: data["title"],
      dueDate: data["dueDate"],
      imageFile: data["imageFile"],
    );
  }
}
