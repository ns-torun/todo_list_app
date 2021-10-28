import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallBack,
  }) : super(key: key);

  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        activeColor: Colors.cyan[700],
        value: isChecked,
        onChanged: checkboxCallBack(isChecked),
      ),
    );
  }
}
