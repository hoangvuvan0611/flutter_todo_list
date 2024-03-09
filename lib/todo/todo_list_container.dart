import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist7/todo/todo_header.dart';
import 'package:todolist7/todo/todo_list.dart';

class TodoListContainer extends StatelessWidget{
  const TodoListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Column(
        children: [
          TodoHeader(),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}