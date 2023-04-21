import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:proj_01_todo_app/Todo.dart';

class AddTodo extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  Box todoBox = Hive.box<Todo>('todo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 30,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text != '') {
                      Todo newTodo =
                          Todo(title: titleController.text, isCompleted: false);
                      todoBox.add(newTodo);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Add To Dos Here',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
