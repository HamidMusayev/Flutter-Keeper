import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/event_list_entity.dart';
import 'package:todo_app/domain/usecases/delete_event_usecase.dart';
import 'package:todo_app/domain/usecases/get_events_usecase.dart';
import 'package:todo_app/domain/usecases/insert_event_usecase.dart';
import 'package:todo_app/service_locator.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int eventCount = 0;
  List<EventListEntity> events = [];

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildEventList(),
      floatingActionButton: FloatingActionButton(
        onPressed: gotoEventAdd,
        child: Icon(Icons.add),
      ),
    );
  }

  ListView buildEventList() {
    return ListView.builder(
      itemCount: eventCount,
      itemBuilder: (context, position) {
        return ExpansionTile(
          title: Text(
            events[position].name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(events[position].description),
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 6),
              Text(events[position].date),
              Text(events[position].time),
            ],
          ),
          children: [
            ListTile(
              title: Text("Dəyiş"),
              leading: Icon(Icons.edit),
              onTap: () => gotoEventEdit(events[position]),
            ),
            ListTile(
              title: Text("Sil"),
              leading: Icon(Icons.delete,
                  color: Theme.of(context).colorScheme.secondary),
              onTap: () => deleteEvent(events[position]),
            ),
          ],
        );
      },
    );
  }

  void getEvents() async {
    var eventsFeature = locator<GetEventsUseCase>().call();
    eventsFeature.then((value) {
      setState(() {
        events = value;
        eventCount = value.length;
      });
    });
  }

  void deleteEvent(EventListEntity event) async {
    await locator<DeleteEventUseCase>().call(event.id);
    getEvents();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Qeyd silindi"),
      action: SnackBarAction(
        label: "Qaytar",
        onPressed: () async {
          await locator<InsertEventUseCase>().call(event);
          getEvents();
        },
      ),
    ));
  }

  void gotoEventAdd() async {
    /*bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddEventPage()));
    if (result != null && result) {
      getEvents();
    }*/
  }

  void gotoEventEdit(EventListEntity event) async {
    /*bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditEventPage(event)));
    if (result != null && result) {
      getEvents();
    }*/
  }
}
