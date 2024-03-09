import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist7/bloc/todo_bloc.dart';
import 'package:todolist7/event/delete_todo.dart';
import 'package:todolist7/model/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
      builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
        stream: bloc.todoListStream,
        // snapshot get data from stream
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.active:
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].content),
                    trailing: GestureDetector(
                      onTap: () {
                        // Call event delete
                        bloc.event.add(DeleteTodo(snapshot.data![index]));
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  );
                },
              );
            case ConnectionState.waiting:
                return const Center(
                  child: SizedBox(
                    width: 60,
                    height: 40,
                    child: Text(
                      'Empty',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey
                      ),
                    ),
                  ),
                );
            case ConnectionState.none:
            default:
              return const Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
