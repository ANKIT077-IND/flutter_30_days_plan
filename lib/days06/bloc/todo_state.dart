import 'package:equatable/equatable.dart';
import 'package:flutter_30_days_plan/days06/todo_model.dart';

sealed class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoErrorState extends TodoState {
  final String error;
  TodoErrorState(this.error);
  @override
  List<Object> get props => [error];
}

class TodoSuccessState extends TodoState {
  final List<Todo> todoList;
  TodoSuccessState(this.todoList);
  @override
  List<Object> get props => [todoList];
}
