import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/models/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  List<TaskModel>? tasks;

  TasksBloc() : super(TasksInitial()) {
    // Register the event handler for FetchTasks
    on<FetchTasks>((event, emit) async {
      emit(TasksLoading()); // Emit loading state
      try {
        var tasksBox = Hive.box<TaskModel>(kTasksBox);
        tasks = tasksBox.values.toList();
        emit(TasksSuccess(tasks: tasks!)); // Emit success with tasks
      } catch (e) {
        emit(TasksFailure(errorMessage: e.toString())); // Emit failure if an error occurs
      }
    });
  }
}