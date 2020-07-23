import 'package:flutter/material.dart';
import 'package:todo_app/data/db_helper_event.dart';
import 'package:todo_app/models/event_model.dart';
import 'package:todo_app/screens/add_event_page.dart';
import 'package:todo_app/screens/edit_event_page.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  var dbEvent = DbHelperEvent();
  int eventCount = 0;
  List<Event> events;

  @override
  void initState() {
    // TODO: implement initState
    getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildEventList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotoEventAdd();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView buildEventList() {
    return ListView.builder(
      itemCount: eventCount,
      itemBuilder: (BuildContext context, int position) {
        return ExpansionTile(
          title: Text(
            this.events[position].name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(this.events[position].description),
          leading: Wrap(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 6,
                  ),
                  Text(this.events[position].date),
                  Text(this.events[position].time),
                ],
              ),
            ],
          ),
          children: <Widget>[
            ListTile(
              title: Text("Dəyiş"),
              leading: Icon(Icons.edit),
              onTap: () {
                gotoEventEdit(events[position]);
              },
            ),
            ListTile(
              title: Text("Sil"),
              leading: Icon(
                Icons.delete,
                color: Theme.of(context).accentColor,
              ),
              onTap: () {
                deleteEvent(events[position]);
              },
            ),
          ],
        );
      },
    );
  }

  void getEvents() async {
    var eventsFeature = dbEvent.getEvents();
    eventsFeature.then((value) {
      setState(() {
        this.events = value;
        eventCount = value.length;
      });
    });
  }

  void deleteEvent(Event event) async {
    await dbEvent.delete(event.id);
    setState(() {
      getEvents();
    });

    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Qeyd silindi"),
        action: SnackBarAction(
            label: "Qaytar",
            onPressed: () async {
              await dbEvent.insert(event);
              setState(() {
                getEvents();
              });
            })));
  }

  void gotoEventAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddEventPage()));
    if (result != null) {
      if (result) {
        getEvents();
      }
    }
  }

  void gotoEventEdit(Event event) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditEventPage(event)));
    if (result != null) {
      if (result) {
        getEvents();
      }
    }
  }
}
