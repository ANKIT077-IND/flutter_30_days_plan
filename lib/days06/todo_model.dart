import 'package:equatable/equatable.dart';

enum TodoStatus { pending, completed }

class Todo extends Equatable {
  final int id;
  final String title;
  final TodoStatus status;

  const Todo({required this.id, required this.title, required this.status});

  Todo copyWith({String? title, TodoStatus? status}) {
    return Todo(
      id: id,
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [id, title, status];
}
