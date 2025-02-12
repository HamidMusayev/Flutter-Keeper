import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/domain/entities/event_add_entity.dart';
import 'package:todo_app/domain/usecases/insert_event_usecase.dart';
import 'package:todo_app/service_locator.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String selectedDate = "Tarix seçin";
  String selectedTime = "Vaxt seçin";

  var eventTxt = TextEditingController();
  var descriptionTxt = TextEditingController();

  Future _pickDate() async {
    DateTime? datepick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -2000)),
        lastDate: new DateTime.now().add(Duration(days: 1624)));
    if (datepick != null)
      setState(() {
        selectedDate = DateFormat("dd-MM-yyyy").format(datepick);
      });
  }

  Future _pickTime() async {
    TimeOfDay? timepick = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());
    if (timepick != null) {
      setState(() {
        selectedTime =
            timepick.hour.toString() + ":" + timepick.minute.toString();
      });
    }
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
                  "Yeni hadisə",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Divider(height: 24, thickness: 4, indent: 120, endIndent: 120),
                SizedBox(
                  height: 24,
                ),
                buildNameField(),
                SizedBox(height: 12),
                buildDescriptionField(),
                SizedBox(height: 12),
                buildDateFiled(),
                buildTimeField(),
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

  Widget buildNameField() {
    return TextField(
      controller: eventTxt,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          labelText: "Hadisənin adı"),
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      controller: descriptionTxt,
      maxLines: 5,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          labelText: "Qeydlər"),
    );
  }

  Widget buildDateFiled() {
    return TextButton(
      onPressed: _pickDate,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.date_range,
                color: Theme.of(context).colorScheme.secondary, size: 30),
            SizedBox(width: 12),
            Text(selectedDate, style: TextStyle(fontSize: 14))
          ],
        ),
      ),
    );
  }

  Widget buildTimeField() {
    return TextButton(
      onPressed: _pickTime,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.access_time,
                color: Theme.of(context).colorScheme.secondary, size: 30),
            SizedBox(width: 12),
            Text(selectedTime, style: TextStyle(fontSize: 14))
          ],
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    return TextButton(
        onPressed: () {
          saveEvent();
        },
        child: Text("Yadda saxla"),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ));
  }

  Widget buildCloseButton() {
    return TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Ləğv et"),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ));
  }

  void saveEvent() async {
    await locator<InsertEventUseCase>().call(EventAddEntity(
        name: eventTxt.text,
        description: descriptionTxt.text,
        date: selectedDate,
        time: selectedTime));
    Navigator.pop(context, true);
  }
}
