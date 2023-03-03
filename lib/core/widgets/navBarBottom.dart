import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/MyCalendar.dart';
import 'package:mobil_bilet1/screens/home.dart';
import 'package:mobil_bilet1/screens/notifications.dart';

import 'buildNavIcon.dart';

Widget buildBottomNavBar(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: const Color.fromARGB(143, 117, 117, 117),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon(Icons.home, true, context, const HomePage()),
            buildNavIcon(Icons.location_on_outlined, false, context,
                const Notifications()),
            buildNavIcon(Icons.feedback, false, context, const MyCalendar()),
            buildNavIcon(Icons.person, false, context, const MyCalendar()),
          ],
        ),
      ),
    ),
  );
}
