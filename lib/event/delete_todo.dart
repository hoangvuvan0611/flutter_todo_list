import 'package:todolist7/base/base_event.dart';
import 'package:todolist7/model/todo.dart';

class DeleteTodo extends BaseEvent{
  Todo todo;
  DeleteTodo(this.todo);
}