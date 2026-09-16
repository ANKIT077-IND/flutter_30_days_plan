import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_30_days_plan/days06/bloc/todo_bloc.dart';
import 'package:flutter_30_days_plan/days06/bloc/todo_event.dart';
import 'package:flutter_30_days_plan/days06/bloc/todo_state.dart';
import 'package:flutter_30_days_plan/days06/todo_model.dart';
import 'package:flutter_30_days_plan/days06/widgets/todo_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Days06 extends StatefulWidget {
  const Days06({super.key});

  @override
  State<Days06> createState() => _Days06State();
}

class _Days06State extends State<Days06> {
  final todo = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    todo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo CRUD",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TodoErrorState) {
                return Center(child: Text(state.error.toString()));
              } else if (state is TodoSuccessState) {
                if (state.todoList.isEmpty) {
                  return Center(child: Text("Todo not found please add"));
                } else {
                  return ListView.builder(
                    itemCount: state.todoList.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Todo item = state.todoList[index];
                      return TodoItem(
                        deleteOnTap: () {
                          deleteTodoDialog(context, item);
                        },
                        updateOnTap: () {
                          updateTodoDialog(context, item);
                        },
                        item: item,
                      );
                    },
                  );
                }
              }
              return SizedBox();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todo.clear();
          createTodoDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void createTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Create Todo"),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: todo,
              keyboardType: TextInputType.text,
              inputFormatters: [LengthLimitingTextInputFormatter(150)],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hint: Text("Enter your todo"),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Title is required";
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  int id = Random().nextInt(10000000);
                  final obj = Todo(
                    id: id,
                    title: todo.text.trim(),
                    status: TodoStatus.pending,
                  );
                  context.read<TodoBloc>().add(AddTodoEvents(todo: obj));
                  Navigator.of(context).pop();
                }
              },
              child: Text("Create"),
            ),
          ],
        );
      },
    );
  }

  void updateTodoDialog(BuildContext context, Todo item) {
    todo.text = item.title.toString();
    String status = item.status.toString();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Update Todo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: todo,
                keyboardType: TextInputType.text,
                inputFormatters: [LengthLimitingTextInputFormatter(150)],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hint: Text("Enter your todo"),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(child: Text("Pending"), value: "pending"),
                  DropdownMenuItem(
                    child: Text("Completed"),
                    value: "completed",
                  ),
                ],
                onChanged: (val) {
                  if (val != null) {
                    if (val == "pending") {
                      status = "pending";
                    } else {
                      status = "completed";
                    }
                  }
                },
                decoration: InputDecoration(hintText: "Status"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final obj = Todo(
                  id: item.id,
                  title: todo.text.trim(),
                  status: status.toString() == "pending"
                      ? TodoStatus.pending
                      : TodoStatus.completed,
                );
                context.read<TodoBloc>().add(UpdateTodoEvents(todo: obj));
                Navigator.of(context).pop();
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void deleteTodoDialog(BuildContext context, Todo item) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                context.read<TodoBloc>().add(DeleteTodoEvents(id: item.id));
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
