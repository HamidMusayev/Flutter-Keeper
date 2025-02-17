import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventAddPage extends StatefulWidget {
  @override
  _EventAddPageState createState() => _EventAddPageState();
}

class _EventAddPageState extends State<EventAddPage> {
  String selectedDate = 'Tarix seçin';
  String selectedTime = 'Vaxt seçin';
  final eventTxt = TextEditingController();
  final descriptionTxt = TextEditingController();

  Future<void> _pickDate() async {
    DateTime? datepick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 2000)),
      lastDate: DateTime.now().add(Duration(days: 1624)),
    );
    if (datepick != null) {
      setState(() {
        selectedDate = DateFormat('dd-MM-yyyy').format(datepick);
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? timepick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timepick != null) {
      setState(() {
        selectedTime = '${timepick.hour}:${timepick.minute}';
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
              Text('Yeni hadisə',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
              Divider(height: 24, thickness: 4, indent: 120, endIndent: 120),
              SizedBox(height: 24),
              _buildNameField(),
              SizedBox(height: 12),
              _buildDescriptionField(),
              SizedBox(height: 12),
              _buildDateField(),
              _buildTimeField(),
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

  Widget _buildNameField() {
    return TextField(
      controller: eventTxt,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: 'Hadisənin adı',
      ),
    );
  }

  Widget _buildDescriptionField() {
    return TextField(
      controller: descriptionTxt,
      maxLines: 5,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: 'Qeydlər',
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

  Widget _buildTimeField() {
    return TextButton(
      onPressed: _pickTime,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.access_time,
                color: Theme.of(context).colorScheme.secondary, size: 30),
            SizedBox(width: 12),
            Text(selectedTime, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return TextButton(
      onPressed: _saveEvent,
      child: Text('Yadda saxla'),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildCloseButton() {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text('Ləğv et'),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _saveEvent() async {
    /*await locator<InsertEventUseCase>().call(EventAddEntity(
      name: eventTxt.text,
      description: descriptionTxt.text,
      date: selectedDate,
      time: selectedTime,
    ));*/
    Navigator.pop(context, true);
  }
}
