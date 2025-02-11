import 'package:flutter/material.dart';
import 'package:todo_app/data/db_helper_event.dart';
import 'package:todo_app/models/event.dart';

class EditEventPage extends StatefulWidget {
  Event event;

  EditEventPage(this.event);

  @override
  _EditEventPageState createState() => _EditEventPageState(event);
}

class _EditEventPageState extends State<EditEventPage> {
  Event event;

  _EditEventPageState(this.event);

  var dbEvent = DbHelperEvent();
  var nameTxt = TextEditingController();
  var descriptionTxt = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    nameTxt.text = event.name;
    descriptionTxt.text = event.description;
    super.initState();
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
                  "Hadisəni dəyiş",
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
      controller: nameTxt,
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

  Widget buildSaveButton() {
    return FlatButton(
        onPressed: () {
          updateEvent();
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

  void updateEvent() async {
    await dbEvent.update(Event.withid(
        id: event.id,
        name: nameTxt.text,
        description: descriptionTxt.text,
        date: event.date,
        time: event.time));
    Navigator.pop(context, true);
  }
}
