import 'dart:ui';

import 'package:flutter/material.dart';

buidBaslik(String baslik) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Text(
      baslik,
      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Colors.black,
          fontStyle: FontStyle.italic),
    ),
  );
}
