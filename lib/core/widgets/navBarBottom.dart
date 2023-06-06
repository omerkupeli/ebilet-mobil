import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/MyCalendar.dart';
import 'package:mobil_bilet1/screens/bookmark.dart';
import 'package:mobil_bilet1/screens/home.dart';
import 'package:mobil_bilet1/screens/notifications.dart';
import 'package:mobil_bilet1/screens/profilePage.dart';
import 'package:mobil_bilet1/screens/ticket/myTickets.dart';

import 'buildNavIcon.dart';

Widget buildBottomNavBar(BuildContext context, Widget currentPage) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.blue.withOpacity(0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon(
                Icons.home, currentPage is HomePage, context, HomePage()),
            buildNavIcon(Icons.money, currentPage is MyTicketsPage, context,
                MyTicketsPage()),
            buildNavIcon(Icons.calendar_month, currentPage is MyCalendar,
                context, MyCalendar()),
            buildNavIcon(Icons.person, currentPage is ProfilePage, context,
                ProfilePage()),
          ],
        ),
      ),
    ),
  );
}
