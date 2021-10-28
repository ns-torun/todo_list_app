import 'package:flutter/material.dart';
import './add_task_screen.dart';
//import './widgets/task_list.dart';
import 'models/task_class.dart';
//import 'widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [Task(taskName: 'Example')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[700],
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(
                    addTaskCallback: (newTaskTitle) {
                      setState(() {
                        tasks.add(Task(taskName: newTaskTitle));
                      });
                      Navigator.pop(context);
                    },
                  ));
        },
      ),
      backgroundColor: Colors.cyan[700],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      color: Colors.cyan[700],
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'ToDo-List',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    '${tasks.length} Tasks',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(tasks[index].taskName,
                            style: TextStyle(
                                decoration: tasks[index].isDone
                                    ? TextDecoration.lineThrough
                                    : null)),
                        trailing: Checkbox(
                          activeColor: Colors.cyan[700],
                          value: tasks[index].isDone,
                          onChanged: (newValue) {
                            setState(() {
                              tasks[index].toggleDone();
                            });
                          },
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
