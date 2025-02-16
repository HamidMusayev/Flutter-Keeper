import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/task_add_entity.dart';
import 'package:todo_app/domain/entities/task_list_entity.dart';
import 'package:todo_app/domain/entities/task_update_entity.dart';
import 'package:todo_app/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/domain/usecases/get_tasks_usecase.dart';
import 'package:todo_app/domain/usecases/insert_task_usecase.dart';
import 'package:todo_app/domain/usecases/update_task_usecase.dart';
import 'package:todo_app/presentation/pages/add_task_page.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<TaskListEntity> tasks = [];

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: tasks.length,
      itemBuilder: (context, position) => Dismissible(
        key: Key(tasks[position].id.toString()),
        background: tasks[position].isDone == 0
            ? Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(Icons.done, color: Colors.white),
              )
            : Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(Icons.settings_backup_restore_rounded,
                    color: Colors.white),
              ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            /*await locator<UpdateTaskUseCase>().call(
              TaskUpdateEntity(
                id: tasks[position].id,
                name: tasks[position].name,
                date: tasks[position].date,
                isDone: tasks[position].isDone == 1 ? 0 : 1,
              ),
            );
            getTasks();

            return false;*/
          } else if (direction == DismissDirection.endToStart) {
            deleteTask(tasks[position]);
            return true;
          }
          return false;
        },
        child: Card(
          elevation: 0,
          color: tasks[position].isDone == 1
              ? Theme.of(context).primaryColor.withAlpha(45)
              : Colors.white,
          child: ListTile(
            title: Text(
              tasks[position].name,
              style: TextStyle(
                decoration: tasks[position].isDone == 1
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(tasks[position].date),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          //title: Text(tasks[position].name),
          //subtitle: Text(tasks[position].date),
          //controlAffinity: ListTileControlAffinity.leading,
          //value: tasks[position].isDone == 1,
          /*onChanged: (value) {
            setState(
              () {
                tasks[position].isDone = value! ? 1 : 0;
                updateCompleted(tasks[position].id, tasks[position].name,
                    tasks[position].date, value ? 1 : 0);
              },
            );
          },*/
        ),
      ),
    );
  }

  void getTasks() async {
    /*var taskList = await locator<GetTasksUseCase>().call();

    setState(() => tasks = taskList);*/
  }

  void deleteTask(TaskListEntity task) async {
    /*await locator<DeleteTaskUseCase>().call(task.id);
    getTasks();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Tapşırıq silindi"),
      action: SnackBarAction(
        label: "Qaytar",
        onPressed: () async {
          await locator<InsertTaskUseCase>().call(TaskAddEntity(
            name: task.name,
            date: task.date,
            isDone: task.isDone,
          ));
          getTasks();
        },
      ),
    ));*/
  }

  void gotoTaskAdd() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskAddPage()),
    );

    getTasks();
  }
}
