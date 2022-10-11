import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildFeatured() {
  return Padding(
    padding: EdgeInsets.all(16),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Image.asset("assets/images/konser.jpg"),
    ),
  );
}
