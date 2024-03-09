import 'dart:async';
import 'dart:math';
import 'dart:core';

import 'package:todolist7/base/base_bloc.dart';
import 'package:todolist7/base/base_event.dart';
import 'package:todolist7/db/todo_table.dart';
import 'package:todolist7/event/add_todo.dart';
import 'package:todolist7/event/delete_todo.dart';
import 'package:todolist7/model/todo.dart';

class TodoBloc extends BaseBloc{
  final StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();

  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  final _randomInt = Random();
  List<Todo> _todoList = [];
  final TodoTable _todoTable = TodoTable();

  @override
  void dispatchEvent(BaseEvent event) {
    if(event is AddTodo){
      Todo todo = Todo(_randomInt.nextInt(1000000), event.content);
      _addTodo(todo);
    } else if(event is DeleteTodo){
      _deleteTodo(event.todo);
    }
  }

  initData() async{
    _todoList = await _todoTable.todos();
  }

  _addTodo(Todo todo) async{
    //Insert to DB
    await _todoTable.insertTodo(todo);

    _todoList.add(todo);
    _todoListStreamController.sink.add(_todoList);
  }

  _deleteTodo(Todo todo) async{
    // Remove from db
    await _todoTable.deleteTodo(todo);

    _todoList.remove(todo);
    _todoListStreamController.sink.add(_todoList);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoListStreamController.close();
  }
}