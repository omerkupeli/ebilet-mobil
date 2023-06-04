import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:mobil_bilet1/constants.dart';
import 'package:mobil_bilet1/main.dart';
import 'package:mobil_bilet1/screens/eventDetails.dart';
import 'package:mobil_bilet1/Event.dart';
import 'package:mobil_bilet1/screens/home.dart';

import '../../models/eventModel.dart';

buildEventNav(BuildContext context, List<Events> event, int index) {
  List<String> images = [
    'https://picsum.photos/seed/980/600',
    'https://picsum.photos/seed/980/600',
    'https://picsum.photos/seed/980/600'
  ];
  return Align(
    alignment: const AlignmentDirectional(0, 0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventDetails(event, index)),
              );
            },
            child: Container(
              width: 220,
              height: 268,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color(0xFFEBEEF2),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 150,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                        "https://cdn.bubilet.com.tr/files/Blog/resim-adi-76524.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 12),
                    child: Text(
                      event.elementAt(index).name.toString(),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3),
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            border: Border.all(
                              color: const Color.fromRGBO(81, 100, 255, 1),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              //Mask holder Template
                              SizedBox(width: 8, height: 20, child: null),
                              Text(
                                event.elementAt(index).category.toString(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color.fromRGBO(81, 100, 255, 1),
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  //height: 1.5 /*PERCENT not supported*/
                                ),
                              ),
                              //Mask holder Template
                              SizedBox(width: 8, height: 20, child: null),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: SizedBox(
                          height: 22,
                          child: ImageStack(
                            imageBorderColor: Colors.transparent,
                            imageList: images,
                            totalCount: images.length,
                            // If larger than images.length, will show extra empty circle
                            imageRadius: 25,
                            // Radius of each images
                            imageCount: 3,
                            // Maximum number of images to be shown in stack
                            imageBorderWidth:
                                1, // Border width around the images
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "25k+ people",
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Source Sans Pro',
                              color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 9),
                        child: Icon(
                          Icons.location_on,
                          color: Constants.primary,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, top: 11),
                        child: Text(
                          event.elementAt(index).location.toString(),
                          style: const TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
              right: 15,
              bottom: 15,
              child: Icon(
                Icons.bookmark_border,
                color: Constants.primary,
                size: 24,
              )),
          Positioned(
              right: 15,
              top: 15,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 246, 249, 255),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                  child: Text(
                    event
                        .elementAt(index)
                        .startDate
                        .toString()
                        .substring(0, 16),
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Constants.primary),
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}
