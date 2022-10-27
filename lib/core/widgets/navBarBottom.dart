import 'package:flutter/material.dart';

import 'buildNavIcon.dart';

Widget buildBottomNavBar() {
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
            buildNavIcon(Icons.home, true),
            buildNavIcon(Icons.location_on_outlined, false),
            buildNavIcon(Icons.feedback, false),
            buildNavIcon(Icons.person, false),
          ],
        ),
      ),
    ),
  );
}
