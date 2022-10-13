import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildNavIcon(@required IconData iconData, @required bool active) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    child: Container(
      color: active ? Colors.blue : Color.fromARGB(166, 201, 201, 201),
      padding: EdgeInsets.all(8),
      child: Icon(
        iconData,
        size: 25,
        color: Colors.white,
      ),
    ),
  );
}
