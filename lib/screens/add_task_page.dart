import 'package:flutter/material.dart';
import 'package:todo_app/data/db_helper_task.dart';
import 'package:todo_app/models/task.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTaskPageState();
  }
}

class _AddTaskPageState extends State {
  var dbTask = DbHelperTask();
  String selectedDate = "Tarixi seçin";

  var taskTxt = TextEditingController();

  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -2000)),
        lastDate: new DateTime.now().add(Duration(days: 1624)));
    if (datepick != null)
      setState(() {
        selectedDate = DateFormat("dd-MM-yyyy").format(datepick);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Yeni tapşırıq",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Divider(
                    color: Theme.of(context).accentColor,
                    height: 24,
                    thickness: 4,
                    indent: 120,
                    endIndent: 120),
                SizedBox(
                  height: 24,
                ),
                buildTaskField(),
                SizedBox(height: 12),
                buildDateFiled(),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[buildCloseButton(), buildSaveButton()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTaskField() {
    return TextField(
      controller: taskTxt,
      maxLines: 2,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          labelText: "Tapşırıq yazın"),
    );
  }

  Widget buildDateFiled() {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: _pickDate,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.date_range,
                color: Theme.of(context).accentColor, size: 30),
            SizedBox(width: 12),
            Text(selectedDate, style: TextStyle(fontSize: 14))
          ],
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    return FlatButton(
        onPressed: () {
          saveTask();
        },
        child: Text("Yadda saxla"),
        color: Theme.of(context).accentColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ));
  }

  Widget buildCloseButton() {
    return FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Bağla"),
        color: Colors.white,
        textColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ));
  }

  void saveTask() async {
    await dbTask
        .insert(Task(name: taskTxt.text, date: selectedDate, completed: 0));
    Navigator.pop(context, true);
  }
}
