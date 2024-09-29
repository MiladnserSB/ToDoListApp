part of 'add_task_bloc.dart';

abstract class AddTaskState extends Equatable {
  const AddTaskState();

  @override
  List<Object> get props => [];
}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskFailure extends AddTaskState {
  final String errorMessage;

  const AddTaskFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}