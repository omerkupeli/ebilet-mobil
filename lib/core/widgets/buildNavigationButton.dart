import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobil_bilet1/main.dart';

Widget buildNavigationButton(
    String text,
    Color color,
    //Widget widget,
    BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      gradient: LinearGradient(
          begin: Alignment(-0.9, -0.9),
          end: Alignment(1, 1),
          colors: [
            Color.fromRGBO(117, 132, 255, 1),
            Color.fromRGBO(82, 101, 255, 1)
          ]),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MyApp();
        }));
      },
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ),
  );
}
