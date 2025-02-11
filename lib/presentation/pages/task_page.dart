import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/task_list_entity.dart';
import 'package:todo_app/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/domain/usecases/get_tasks_usecase.dart';
import 'package:todo_app/domain/usecases/update_task_usecase.dart';
import 'package:todo_app/service_locator.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int taskCount = 0;
  List<TaskListEntity> tasks = [];

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildTasksList(),
      floatingActionButton: FloatingActionButton(
        onPressed: gotoTaskAdd,
        child: Icon(Icons.add),
      ),
    );
  }

  ListView buildTasksList() {
    return ListView.builder(
      itemCount: taskCount,
      itemBuilder: (context, position) {
        return CheckboxListTile(
          title: Text(tasks[position].name),
          subtitle: Text(tasks[position].date),
          secondary: IconButton(
            onPressed: () => deleteTask(tasks[position].id),
            icon: Icon(Icons.delete, color: Colors.grey),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: tasks[position].isDone,
          onChanged: (value) {
            setState(() {
              tasks[position].isDone = value!;
              updateCompleted(tasks[position].id, tasks[position].name,
                  tasks[position].date, value);
            });
          },
        );
      },
    );
  }

  void getTasks() async {
    var tasksFeature = locator<GetTasksUseCase>().call();
    tasksFeature.then((value) {
      setState(() {
        tasks = value;
        taskCount = value.length;
      });
    });
  }

  void updateCompleted(int id, String name, String date, bool isDone) async {
    await locator<UpdateTaskUseCase>()
        .call(TaskListEntity(id: id, name: name, date: date, isDone: isDone));
    getTasks();
  }

  void deleteTask(int id) async {
    await locator<DeleteTaskUseCase>().call(id);
    getTasks();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Tapşırıq silindi")));
  }

  void gotoTaskAdd() async {
    /*bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskPage()),
    );*/
    /*if (result != null && result) {
      getTasks();
    }*/
  }
}
