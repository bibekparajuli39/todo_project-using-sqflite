import 'package:flutter/material.dart';
import 'package:todo_project/database/database_helper.dart';
import 'package:todo_project/features/todo/todo_details.dart';
import 'package:todo_project/model/todo_model.dart';

class TodoScreen extends StatefulWidget {
  final TodoModel? todoUpdate;
  const TodoScreen({super.key, this.todoUpdate});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  // it save the data
  Future saveTodo(String title, String description) async {
    final finalValue = TodoModel(
      id: widget.todoUpdate?.id,
      title: title,
      description: description,
    );

    if (widget.todoUpdate?.id == null) {
      await DatabaseHelper.insertTodo(finalValue);
    } else {
      await DatabaseHelper.updateTodo(finalValue);
    }
  }

  @override
  void initState() {
    //
    super.initState();
    titleController = TextEditingController(text: widget.todoUpdate?.title);
    descriptionController = TextEditingController(
      text: widget.todoUpdate?.description,
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: Container(
        margin: EdgeInsets.all(1),
        child: Column(
          spacing: 10,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            TextFormField(
              maxLines: 4,
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  saveTodo(
                    titleController.text.toString(),
                    descriptionController.text.toString(),
                  );
                  titleController.clear();
                  descriptionController.clear();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodoDetails()),
                  );
                },
                child: Text(widget.todoUpdate?.id == null ? 'Save' : 'Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
