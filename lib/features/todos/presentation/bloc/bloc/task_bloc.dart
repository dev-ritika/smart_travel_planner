import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:integrated_todo/features/todos/data/models/task_data_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
