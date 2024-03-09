import 'package:todolist7/base/base_event.dart';

class AddTodo extends BaseEvent{
  String content;

  AddTodo(this.content);
}