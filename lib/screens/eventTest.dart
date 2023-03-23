import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobil_bilet1/models/eventModel.dart';

import '../service/eventService.dart';

class EventTestPage extends StatefulWidget {
  const EventTestPage({Key? key}) : super(key: key);
  @override
  _EventTestPageState createState() => _EventTestPageState();
}

class _EventTestPageState extends State<EventTestPage> {
  List<Events> events = [];
  var ivent;
  Future<void> getEvents() async {
    final response = await EventApi.getEvents();

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (ivent in data['data']) {
          events.add(Events.fromJson(ivent));
          print("***************");
          print(ivent);
        }
        setState(() {});
      } else {
        print('Hata');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Event Test',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(events.elementAt(index).name.toString()),
                    subtitle: Text(events.elementAt(index).description.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
