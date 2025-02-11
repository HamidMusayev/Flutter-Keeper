import 'package:flutter/material.dart';
import 'package:todo_app/data/db_helper_task.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/add_task_page.dart';

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaskPageState();
  }
}

class _TaskPageState extends State {
  var dbTask = DbHelperTask();
  int taskCount = 0;
  List<Task> tasks;

  @override
  void initState() {
    // TODO: implement initState
    getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildTasksList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotoTaskAdd();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView buildTasksList() {
    return ListView.builder(
        itemCount: taskCount,
        itemBuilder: (BuildContext context, int position) {
          return CheckboxListTile(
            title: Text(this.tasks[position].name),
            subtitle: Text(this.tasks[position].date),
            secondary: IconButton(
                onPressed: () {
                  deleteTask(tasks[position].id);
                },
                icon: Icon(Icons.delete, color: Colors.grey)),
            controlAffinity: ListTileControlAffinity.leading,
            value: this.tasks[position].completed == 1 ? true : false,
            onChanged: (bool value) {
              setState(() {
                //update completed
                if (value == true) {
                  this.tasks[position].completed = 1;
                  updateCompleted(tasks[position].id, tasks[position].name,
                      tasks[position].date, 1);
                } else {
                  this.tasks[position].completed = 0;
                  updateCompleted(tasks[position].id, tasks[position].name,
                      tasks[position].date, 0);
                }
              });
            },
          );
        });
  }

  void getTasks() async {
    var tasksFeature = dbTask.getTasks();
    tasksFeature.then((value) {
      setState(() {
        this.tasks = value;
        taskCount = value.length;
      });
    });
  }

  void updateCompleted(
      int selectedId, String name, String date, int state) async {
    await dbTask.update(
        Task.withid(id: selectedId, name: name, date: date, completed: state));
    setState(() {
      getTasks();
    });
  }

  void deleteTask(int id) async {
    await dbTask.delete(id);
    setState(() {
      getTasks();
    });

    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Tapşırıq silindi")));
  }

  void gotoTaskAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskPage()));
    if (result != null) {
      if (result) {
        getTasks();
      }
    }
  }
}
