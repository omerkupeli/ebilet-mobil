import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:mobil_bilet1/Event.dart';
import 'package:mobil_bilet1/core/widgets/navBarBottom.dart';
import 'package:mobil_bilet1/main.dart';
import 'package:mobil_bilet1/screens/ticket.dart';

import '../constants.dart';
import '../models/eventModel.dart';

class EventDetails extends StatelessWidget {
  final Events event;

  EventDetails(this.event);

  final ScrollController _scrollController = ScrollController();
  final double _targetOffset = 400.0;
  void _scrollToTarget() {
    // ScrollController'ın animateTo yöntemini kullanarak sayfanın hedef bölgesine kaydırın.
    _scrollController.animateTo(
      _targetOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://picsum.photos/seed/980/600',
      'https://picsum.photos/seed/980/600',
      'https://picsum.photos/seed/980/600'
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Stack(
                children: [
                  Container(
                    child: event.image != null
                        ? Image.network(
                            event.image.toString(),
                            fit: BoxFit.cover,
                            height: 300,
                          )
                        : Image.asset(
                            'assets/images/placeholder.png',
                            fit: BoxFit.cover,
                            height: 300,
                          ),
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 35),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 305, 8, 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 151, 185, 229),
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            event.category,
                                            style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  81, 100, 255, 1),
                                              fontFamily: 'Source Sans Pro',
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              //height: 1.5 /*PERCENT not supported*/),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 190,
                                ),
                                Text(
                                  "25k+ people are going",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    //height: 1.5 /*PERCENT not supported*/),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromRGBO(81, 100, 255, 1),
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  child: Text(
                                    event.name.toString(),
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      //height: 1.5 /*PERCENT not supported*/),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 14, 8, 0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 151, 185, 229),
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.calendar_month_sharp,
                                        color: Color.fromRGBO(81, 100, 255, 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 0, 0),
                                      child: Column(
                                        children: [
                                          Text(
                                            event.startDate.toString(),
                                            style: const TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Source Sans Pro',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              //height: 1.5 /*PERCENT not supported*/),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            event.endDate.toString(),
                                            style: const TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Source Sans Pro',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              //height: 1.5 /*PERCENT not supported*/),
                                            ),
                                          ),
                                          //add to my calendar button
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 151, 185, 229),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                      " Add to My Calendar",
                                                      style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            81, 100, 255, 1),
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        //height: 1.5 /*PERCENT not supported*/),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 14, 8, 14),
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 151, 185, 229),
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.location_on,
                                        color: Color.fromRGBO(81, 100, 255, 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 10, 0, 0),
                                      child: Column(
                                        children: [
                                          Text(
                                            event.location.toString(),
                                            style: const TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Source Sans Pro',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              //height: 1.5 /*PERCENT not supported*/),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            event.location.toString(),
                                            style: const TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Source Sans Pro',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              //height: 1.5 /*PERCENT not supported*/),
                                            ),
                                          ),
                                          //see on maps button
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 151, 185, 229),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                      " See on Maps",
                                                      style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            81, 100, 255, 1),
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        //height: 1.5 /*PERCENT not supported*/),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                                gradient: LinearGradient(
                                    begin: Alignment(-0.9, -0.9),
                                    end: Alignment(1, 1),
                                    colors: [
                                      Color.fromRGBO(117, 132, 255, 1),
                                      Color.fromRGBO(82, 101, 255, 1)
                                    ]),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 0),
                              child: ElevatedButton(
                                onPressed: _scrollToTarget,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 13),
                                      child: const Text(
                                        "Organizatör Bilgilerini Görüntüle",
                                        style: TextStyle(
                                            fontFamily: 'Source Sans Pro',
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 151, 185, 229),
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.share,
                                      color: Color.fromRGBO(81, 100, 255, 1),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 151, 185, 229),
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.bookmark_border,
                                      color: Color.fromRGBO(81, 100, 255, 1),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                      gradient: LinearGradient(
                                          begin: Alignment(-0.9, -0.9),
                                          end: Alignment(1, 1),
                                          colors: [
                                            Color.fromRGBO(117, 132, 255, 1),
                                            Color.fromRGBO(82, 101, 255, 1)
                                          ]),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const MyApp();
                                        }));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TicketScreen()));
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 13),
                                              child: const Text(
                                                "                   Bilet Satın Al                   ",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Container(
                                  child: Column(children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              "https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659651_960_720.png"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Organizatör",
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    //height: 1.5 /*PERCENT not supported*/),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  "Organizatör",
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    //height: 1.5 /*PERCENT not supported*/),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              120, 8, 8, 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 151, 185, 229),
                                                width: 1,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "Takip Et",
                                                    style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          81, 100, 255, 1),
                                                      fontFamily:
                                                          'Source Sans Pro',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      //height: 1.5 /*PERCENT not supported*/),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: const Text(
                                            "Etkinlik Açıklaması",
                                            style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Source Sans Pro',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              //height: 1.5 /*PERCENT not supported*/),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            event.description.toString(),
                                            softWrap: true,
                                            style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Source Sans Pro',
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              //height: 1.5 /*PERCENT not supported*/),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 8,
            //   left: 0,
            //   right: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Container(
            //           width: 40,
            //           height: 40,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20),
            //               shape: BoxShape.rectangle,
            //               border: Border.all(
            //                 color: Color.fromARGB(255, 151, 185, 229),
            //                 width: 1,
            //               ),
            //               color: Color.fromRGBO(82, 101, 255, 1)),
            //           child: const Icon(
            //             Icons.share,
            //             color: Color.fromRGBO(253, 253, 255, 1),
            //           ),
            //         ),
            //         Container(
            //           width: 40,
            //           height: 40,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20),
            //               shape: BoxShape.rectangle,
            //               border: Border.all(
            //                 color: Color.fromARGB(255, 151, 185, 229),
            //                 width: 1,
            //               ),
            //               color: Color.fromRGBO(82, 101, 255, 1)),
            //           child: const Icon(
            //             Icons.bookmark_border,
            //             color: Color.fromRGBO(255, 255, 255, 1),
            //           ),
            //         ),
            //         Container(
            //           decoration: const BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(32)),
            //             gradient: LinearGradient(
            //                 begin: Alignment(-0.9, -0.9),
            //                 end: Alignment(1, 1),
            //                 colors: [
            //                   Color.fromRGBO(117, 132, 255, 1),
            //                   Color.fromRGBO(82, 101, 255, 1)
            //                 ]),
            //           ),
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 5, vertical: 0),
            //           child: GestureDetector(
            //             onTap: () {
            //               Navigator.push(context,
            //                   MaterialPageRoute(builder: (context) {
            //                 return const MyApp();
            //               }));
            //             },
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Container(
            //                   padding: const EdgeInsets.symmetric(
            //                       horizontal: 10, vertical: 13),
            //                   child: const Text(
            //                     "                   Bilet Satın Al                   ",
            //                     style: TextStyle(
            //                         fontFamily: 'Source Sans Pro',
            //                         color: Colors.white,
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.w500),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
