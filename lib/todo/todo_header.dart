import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist7/bloc/todo_bloc.dart';
import 'package:todolist7/event/add_todo.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: txtTodoController,
              decoration: const InputDecoration(
                labelText: 'Add todo',
                hintText: 'Add todo',
              ),
            ),
          ),
          const SizedBox(width: 20,),
          ElevatedButton.icon(
            onPressed: (){
              bloc.event.add(AddTodo(txtTodoController.text));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          )
        ],
      ),
    );
  }
}
