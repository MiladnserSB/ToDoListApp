import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/models/task_model.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskInitial()) {
    // Register the event handler for AddTask
    on<AddTask>((event, emit) async {
      emit(AddTaskLoading()); // Emit loading state
      try {
        var tasksBox = Hive.box<TaskModel>(kTasksBox);
        await tasksBox.add(event.task);
        emit(AddTaskSuccess()); // Emit success state when the task is added
      } catch (e) {
        emit(AddTaskFailure(errorMessage: e.toString())); // Emit failure state if an error occurs
      }
    });
  }
}