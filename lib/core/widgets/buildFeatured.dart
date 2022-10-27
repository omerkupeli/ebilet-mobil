import 'package:flutter/material.dart';

Widget buildFeatured() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Image.asset("assets/images/konser.jpg"),
    ),
  );
}
