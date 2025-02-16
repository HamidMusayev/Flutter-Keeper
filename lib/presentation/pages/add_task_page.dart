import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/domain/entities/task_add_entity.dart';
import 'package:todo_app/domain/usecases/insert_task_usecase.dart';

class TaskAddPage extends StatefulWidget {
  @override
  _TaskAddPageState createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  String selectedDate = "Tarixi seçin";
  final taskTxt = TextEditingController();

  Future<void> _pickDate() async {
    DateTime? datepick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 2000)),
      lastDate: DateTime.now().add(Duration(days: 1624)),
    );
    if (datepick != null) {
      setState(() {
        selectedDate = DateFormat("dd-MM-yyyy").format(datepick);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 24),
              Text("Yeni tapşırıq",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
              Divider(height: 24, thickness: 4, indent: 120, endIndent: 120),
              SizedBox(height: 24),
              _buildTaskField(),
              SizedBox(height: 12),
              _buildDateField(),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[_buildCloseButton(), _buildSaveButton()],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskField() {
    return TextField(
      controller: taskTxt,
      maxLines: 2,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: "Tapşırıq yazın",
      ),
    );
  }

  Widget _buildDateField() {
    return TextButton(
      onPressed: _pickDate,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.date_range,
                color: Theme.of(context).colorScheme.secondary, size: 30),
            SizedBox(width: 12),
            Text(selectedDate, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return TextButton(
      onPressed: _saveTask,
      child: Text("Yadda saxla"),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildCloseButton() {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text("Bağla"),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _saveTask() async {
   /* await locator<InsertTaskUseCase>().call(TaskAddEntity(
      name: taskTxt.text,
      date: selectedDate,
      isDone: 0,
    ));*/
    Navigator.pop(context);
  }
}
