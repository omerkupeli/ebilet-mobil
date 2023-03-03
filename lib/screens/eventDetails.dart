import 'package:flutter/material.dart';
import 'package:mobil_bilet1/Event.dart';
import 'package:mobil_bilet1/core/widgets/navBarBottom.dart';

class EventDetails extends StatelessWidget {
  final Event event;

  EventDetails(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.network(event.imageUrl),
            Text(event.name),
            Text(event.date),
            Text(event.location),
            Text(event.category),
            Text(event.going),
            Text(event.images.toString()),
          ],
        ),
      ),
    );
  }
}
