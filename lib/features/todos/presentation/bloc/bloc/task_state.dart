part of 'task_bloc.dart';

class TaskState extends Equatable {
  final bool isLoading;
  final List<TaskDataModel>? taskDataModel;
  final bool? isAdded;
  final bool? isFormAdded;

  const TaskState({
    required this.isLoading,
    this.taskDataModel,
    this.isAdded = false,
    this.isFormAdded = false,
  });

  TaskState copyWith({
    bool? isLoading,
    List<TaskDataModel>? taskDataModel,
    bool? isAdded,
    bool? isFormAdded,
  }) {
    return TaskState(
      isLoading: isLoading ?? this.isLoading,
      taskDataModel: taskDataModel ?? this.taskDataModel,
      isAdded: isAdded ?? this.isAdded,
      isFormAdded: isFormAdded ?? this.isFormAdded,
    );
  }

  @override
  List<Object?> get props => [isLoading, taskDataModel, isAdded, isFormAdded];
}
