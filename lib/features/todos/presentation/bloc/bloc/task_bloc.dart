import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:integrated_todo/features/todos/data/models/task_data_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  //bool isLoading = false;

  TaskBloc() : super(TaskState(isLoading: false)) {
    on<AddTaskEvent>((event, emit) async {
      emit(state.copyWith(isAdded: false, isLoading: true));

      print("herreee bloc " + event.taskDataModel.title.toString());

      await Future.delayed(Duration(seconds: 2));

      print("herreee bloc 1 " + event.taskDataModel.title.toString());

      emit(
        state.copyWith(
          isLoading: false,
          // taskDataModel: [event.taskDataModel],
          taskDataModel: [...(state.taskDataModel ?? []), event.taskDataModel],
          isAdded: true,
        ),
      );

      emit(state.copyWith(isAdded: false, isFormAdded: false));
    });

    on<FormValidEvent>((event, emit) {
      emit(state.copyWith(isFormAdded: event.isFormValid));
    });

    on<DeleteTaskEvent>((event, emit) {
      final x = state.taskDataModel!
          .where((x) => x.taskId != event.taskDataModel.taskId)
          .toList();
      emit(state.copyWith(taskDataModel: x));
    });

    on<EditTaskEvent>((event, emit) async {
      emit(state.copyWith(isAdded: false, isLoading: true));

      print("herreee bloc " + event.taskDataModel.title.toString());

      await Future.delayed(Duration(seconds: 2));

      print("herreee bloc 1 " + event.taskDataModel.title.toString());
      final updatedList = state.taskDataModel!.map((task) {
        if (task.taskId == event.taskDataModel.taskId) {
          return task.copyWith(
            category: event.taskDataModel.category,
            description: event.taskDataModel.description,
            dueDate: event.taskDataModel.dueDate,
            imageFile: event.taskDataModel.imageFile,
            taskId: event.taskDataModel.taskId,
            title: event.taskDataModel.title,
          );
        }
        return task;
      }).toList();

      emit(
        state.copyWith(
          taskDataModel: updatedList,
          isLoading: false,

          // taskDataModel: [event.taskDataModel],
          isAdded: true,
        ),
      );

      emit(state.copyWith(isAdded: false, isFormAdded: false));
    });
  }
}
