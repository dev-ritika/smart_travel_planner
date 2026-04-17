part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskDataModel taskDataModel;

  const AddTaskEvent({required this.taskDataModel});

  @override
  List<Object> get props => [taskDataModel];
}
