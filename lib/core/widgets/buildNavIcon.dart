import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/home.dart';

Widget buildNavIcon(
    IconData iconData, bool active, BuildContext context, Widget page) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            color:
                active ? Colors.blue : const Color.fromARGB(166, 201, 201, 201),
            padding: const EdgeInsets.all(8),
            child: Icon(
              iconData,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ));
}
