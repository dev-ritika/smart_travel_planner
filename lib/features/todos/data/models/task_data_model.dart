import 'dart:io';

class TaskDataModel {
  final String category;
  final String title;
  final String description;
  final DateTime dueDate;
  final File? imageFile;

  TaskDataModel({
    required this.description,
    required this.category,
    DateTime? dueDate,
    this.imageFile,
    required this.title,
  }) : dueDate = dueDate ?? DateTime.now();
}
