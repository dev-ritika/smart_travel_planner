part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskDataModel taskDataModel;

  const AddTaskEvent({required this.taskDataModel});

  @override
  List<Object?> get props => [taskDataModel];
}

class FormValidEvent extends TaskEvent {
  final bool isFormValid;

  const FormValidEvent({required this.isFormValid});

  @override
  List<Object?> get props => [isFormValid];
}

class AddImageEvent extends TaskEvent {
  final XFile? taskImage;

  const AddImageEvent({required this.taskImage});

  @override
  List<Object?> get props => [taskImage];
}

class DeleteTaskEvent extends TaskEvent {
  final TaskDataModel taskDataModel;

  const DeleteTaskEvent({required this.taskDataModel});

  @override
  List<Object?> get props => [taskDataModel];
}

class EditTaskEvent extends TaskEvent {
  final TaskDataModel taskDataModel;

  const EditTaskEvent({required this.taskDataModel});

  @override
  List<Object?> get props => [taskDataModel];
}
