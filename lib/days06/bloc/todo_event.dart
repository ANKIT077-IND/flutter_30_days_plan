import 'package:equatable/equatable.dart';
import 'package:flutter_30_days_plan/days06/todo_model.dart';

sealed class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTodoEvents extends TodoEvent {
  final Todo todo;
  AddTodoEvents({required this.todo});
  @override
  List<Object> get props => [todo];
}

class UpdateTodoEvents extends TodoEvent {
  final Todo todo;
  UpdateTodoEvents({required this.todo});
  @override
  List<Object> get props => [todo];
}

class DeleteTodoEvents extends TodoEvent {
  final int id;
  DeleteTodoEvents({required this.id});
  @override
  List<Object> get props => [id];
}

class GetTodoEvents extends TodoEvent {
  @override
  List<Object?> get props => [];
}
