part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksSuccess extends TasksState {
  final List<TaskModel> tasks;

  const TasksSuccess({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class TasksFailure extends TasksState {
  final String errorMessage;

  const TasksFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}