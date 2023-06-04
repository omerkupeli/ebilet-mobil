import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/MyCalendar.dart';
import 'package:mobil_bilet1/screens/bookmark.dart';
import 'package:mobil_bilet1/screens/home.dart';
import 'package:mobil_bilet1/screens/notifications.dart';
import 'package:mobil_bilet1/screens/profilePage.dart';
import 'package:mobil_bilet1/screens/ticket/myTickets.dart';

import 'buildNavIcon.dart';

Widget buildBottomNavBar(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon(Icons.home, true, context, const HomePage()),
            buildNavIcon(Icons.money, false, context, MyTicketsPage()),
            buildNavIcon(
                Icons.calendar_month, false, context, const MyCalendar()),
            buildNavIcon(Icons.person, false, context, ProfilePage()),
          ],
        ),
      ),
    ),
  );
}
