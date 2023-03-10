import 'package:flutter/material.dart';

Widget buildNotification(
    String image, String title, String description, String time) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
    child: Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    description,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Source Sans Pro',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      //height: 1.5 /*PERCENT not supported*/),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
