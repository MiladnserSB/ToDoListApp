part of 'add_task_bloc.dart';

abstract class AddTaskEvent extends Equatable {
  const AddTaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends AddTaskEvent {
  final TaskModel task;

  const AddTask(this.task);

  @override
  List<Object> get props => [task];
}