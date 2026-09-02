import 'package:flutter/material.dart';

class TodoDetails extends StatefulWidget {
  const TodoDetails({super.key});

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo detail')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('Id'),
            title: Text('title'),
            subtitle: Text('desription'),
            trailing: Column(
              spacing: 5,
              children: [
                Expanded(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ),
                Expanded(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
