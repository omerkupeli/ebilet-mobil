import 'package:flutter/material.dart';

Widget buildNavIcon(IconData iconData, bool active) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    child: Container(
      color: active ? Colors.blue : const Color.fromARGB(166, 201, 201, 201),
      padding: const EdgeInsets.all(8),
      child: Icon(
        iconData,
        size: 25,
        color: Colors.white,
      ),
    ),
  );
}
