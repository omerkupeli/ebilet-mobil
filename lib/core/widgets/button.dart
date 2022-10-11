import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobil_bilet1/main.dart';

Widget buidNavigation(
    String text,
    Color color,
    //Widget widget,
    BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MyApp();
      }));
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
