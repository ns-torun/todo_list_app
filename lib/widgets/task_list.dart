import 'package:flutter/material.dart';
import './task_tile.dart';
import 'package:todo_list/models/task_class.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key, required this.tasks}) : super(key: key);

  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
              taskTitle: widget.tasks[index].taskName,
              isChecked: widget.tasks[index].isDone,
              checkboxCallBack: (isChecked) {
                setState(() {
                  widget.tasks[index].toggleDone();
                });
              });
        });
  }
}
