import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/db_helper_event.dart';
import 'package:todo_app/models/event_model.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  var dbEvent = DbHelperEvent();
  String selectedDate = "Tarix seçin";
  String selectedTime = "Vaxt seçin";

  var eventTxt = TextEditingController();
  var descriptionTxt = TextEditingController();

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

  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
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
                Divider(
                    color: Theme.of(context).accentColor,
                    height: 24,
                    thickness: 4,
                    indent: 120,
                    endIndent: 120),
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

  Widget buildTimeField() {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: _pickTime,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.access_time,
                color: Theme.of(context).accentColor, size: 30),
            SizedBox(width: 12),
            Text(selectedTime, style: TextStyle(fontSize: 14))
          ],
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    return FlatButton(
        onPressed: () {
          saveEvent();
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
        child: Text("Ləğv et"),
        color: Colors.white,
        textColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ));
  }

  void saveEvent() async {
    await dbEvent.insert(Event(
        name: eventTxt.text,
        description: descriptionTxt.text,
        date: selectedDate,
        time: selectedTime));
    Navigator.pop(context, true);
  }
}
