import 'package:flutter_30_days_plan/days06/bloc/todo_event.dart';
import 'package:flutter_30_days_plan/days06/bloc/todo_state.dart';
import 'package:flutter_30_days_plan/days06/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<Todo> todo = [];
  TodoBloc() : super(TodoInitialState()) {
    on<AddTodoEvents>((event, state) {
      emit(TodoLoadingState());
      if (event.todo.title == null || event.todo.title.isEmpty) {
        emit(TodoErrorState("Title is Required"));
      } else {
        todo.add(event.todo);
        emit(TodoSuccessState(todo));
      }
    });
    on<GetTodoEvents>((event, state) {
      emit(TodoLoadingState());
      Future.delayed(Duration(milliseconds: 500));
      emit(TodoSuccessState(todo));
    });
    on<UpdateTodoEvents>((event, state) {
      emit(TodoLoadingState());
      if (event.todo.title == null || event.todo.title.isEmpty) {
        emit(TodoErrorState("Title is Required"));
      } else {
        final index = todo.indexWhere((item) => item.id == event.todo.id);
        if (index != -1) {
          todo.removeAt(index);
          todo.insert(index, event.todo);
        }
        emit(TodoSuccessState(todo));
      }
    });
    on<DeleteTodoEvents>((event, state) {
      emit(TodoLoadingState());
      if (event.id == null || event.id.toString().isEmpty) {
        emit(TodoErrorState("somethings went wrong"));
      } else {
        final index = todo.indexWhere((item) => item.id == event.id);
        if (index != -1) {
          todo.removeAt(index);
        }
        emit(TodoSuccessState(todo));
      }
    });
  }
}
