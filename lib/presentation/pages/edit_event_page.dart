import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/event_list_entity.dart';

class EditEventPage extends StatefulWidget {
  EventListEntity event;

  EditEventPage(this.event);

  @override
  _EditEventPageState createState() => _EditEventPageState(event);
}

class _EditEventPageState extends State<EditEventPage> {
  EventListEntity event;
  _EditEventPageState(this.event);
  var nameTxt = TextEditingController();
  var descriptionTxt = TextEditingController();

  @override
  void initState() {
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
                SizedBox(height: 24),
                Text(
                  'Hadisəni dəyiş',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    height: 24,
                    thickness: 4,
                    endIndent: 120),
                SizedBox(height: 24),
                buildNameField(),
                SizedBox(height: 12),
                buildDescriptionField(),
                SizedBox(height: 12),
                SizedBox(height: 24),
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
          labelText: 'Hadisənin adı'),
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      controller: descriptionTxt,
      maxLines: 5,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          labelText: 'Qeydlər'),
    );
  }

  Widget buildSaveButton() {
    return TextButton(
        onPressed: () {
          updateEvent();
        },
        child: Text('Yadda saxla'),
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
        child: Text('Ləğv et'),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ));
  }

  void updateEvent() async {
    /*await locator<UpdateEventUseCase>().call(EventUpdateEntity(
        id: event.id,
        name: event.name,
        description: event.description,
        date: event.date,
        time: event.time));*/
    Navigator.pop(context, true);
  }
}
