import 'dart:ui';

import 'package:flutter/material.dart';

buildEventNav() {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        child: Image.asset(
          "assets/images/konser.jpg",
          height: 150,
          width: 250,
        ),
      ),
      Text(
        "Haluk Levent Konseri",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: const [
            Icon(
              Icons.music_note_sharp,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 32,
            ),
            Icon(
              Icons.people_alt,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "20K+ Going",
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
      Row(
        children: const [
          Icon(
            Icons.location_on_sharp,
            color: Color.fromARGB(255, 0, 52, 95),
            size: 25,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            "İstanbul Arena, İstanbul",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            width: 14,
          ),
          Icon(
            Icons.bookmark,
            color: Colors.white,
            size: 25,
          )
        ],
      )
    ],
  );
}
