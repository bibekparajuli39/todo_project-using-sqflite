import 'package:flutter/material.dart';

import 'package:todo_project/database/database_helper.dart';
import 'package:todo_project/features/todo/todo_screen.dart';
import 'package:todo_project/model/todo_model.dart';

class TodoDetails extends StatefulWidget {
  const TodoDetails({super.key});

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  List<TodoModel> todo = [];

  Future<void> getTodo() async {
    final data = await DatabaseHelper.getTodo();
    setState(() {
      todo = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo detail')),
      body: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          final todoData = todo[index];
          return ListTile(
            leading: Text(todoData.id.toString()),
            title: Text(todoData.title.toString()),
            subtitle: Text(todoData.description.toString()),
            trailing: Column(
              spacing: 5,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TodoScreen(todoUpdate: todoData),
                        ),
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      DatabaseHelper.deleteTodo(todoData.id!.toInt());
                      getTodo();
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
