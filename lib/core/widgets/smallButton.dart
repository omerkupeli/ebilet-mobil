import 'package:flutter/material.dart';
import 'package:mobil_bilet1/main.dart';
import 'package:mobil_bilet1/screens/home.dart';

Widget smallButton(Icon icon, BuildContext context,
    {Widget? nextPage, bool goBack = false}) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      color: Color.fromRGBO(233, 235, 255, 1.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    child: GestureDetector(
      onTap: () {
        if (goBack) {
          Navigator.pop(context);
        } else if (nextPage != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return nextPage;
          }));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
        child: icon,
      ),
    ),
  );
}
