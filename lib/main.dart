import 'package:flutter/material.dart';
import 'package:todolist7/bloc/todo_bloc.dart';
import 'package:todolist7/db/todo_database.dart';
import 'todo/todo_list_container.dart';
import 'package:provider/provider.dart';

void main() {
  // TodoDatabase.instance.init();
  runApp(MyHomePage());
}

// top: add list
// center: show list
class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOAPP',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'TODOLIST',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        body: Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: const TodoListContainer()
        ),
      ),
    );
  }
}







