import 'package:flutter/material.dart';
import 'package:mobil_bilet1/core/widgets/smallButton.dart';

@override
Widget buildSearchBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 250,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(244, 246, 249, 1.0),
          borderRadius: BorderRadius.circular(32),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 15, height: 1.5),
            hintText: 'Search',
            suffixIcon: Icon(
              Icons.search,
              size: 16,
            ),
            iconColor: Color.fromRGBO(133, 140, 148, 1.0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          ),
        ),
      ),
      smallButton(
          const Icon(
            Icons.filter_list,
            color: Color.fromRGBO(82, 101, 255, 1.0),
          ),
          context)
    ],
  );
}
