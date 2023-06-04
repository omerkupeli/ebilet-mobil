import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/home.dart';
import 'package:mobil_bilet1/screens/ticket/qrticket.dart';
import 'package:mobil_bilet1/service/eventService.dart';

import '../../core/widgets/smallButton.dart';
import '../../models/bookingModel.dart';
import '../../models/eventModel.dart';

class MyTicketsPage extends StatefulWidget {
  @override
  _MyTicketsPageState createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  List<Bookings> bookings = [];
  List<Bookings> parseBookings(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Bookings>((json) => Bookings.fromJson(json)).toList();
  }

  Future<void> getBookings() async {
    final response = await EventApi.getBookings();

    try {
      if (response.statusCode == 200) {
        bookings = parseBookings(response.body);

        setState(() {});
      } else {
        print('Hata');
      }
    } catch (e) {
      print(e);
    }
  }

  List<Events> events = [];
  List<Events> parseEvents(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
    return parsed.map<Events>((json) => Events.fromJson(json)).toList();
  }

  Future<void> getEvents() async {
    final response = await EventApi.getEvents();

    try {
      if (response.statusCode == 200) {
        events = parseEvents(response.body);
        print(events.elementAt(0).name);
        setState(() {});
      } else {
        print('Hata');
      }
    } catch (e) {
      print(e);
    }
  }

  List<Events> matchedEvents = [];
  List<Events> matchEvents(List<Bookings> bookings, List<Events> events) {
    for (var i = 0; i < bookings.length; i++) {
      for (var j = 0; j < events.length; j++) {
        if (bookings[i].eventId == events[j].id) {
          matchedEvents.add(events[j]);
        }
      }
    }
    return matchedEvents;
  }

  @override
  void initState() {
    super.initState();
    getBookings();
    getEvents();
    matchEvents(bookings, events);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            smallButton(const Icon(Icons.arrow_back), context,
                                nextPage: const HomePage()),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              "Biletlerim",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    for (var i = 0; i < bookings.length; i++)
                      Column(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var j = 0; j < events.length; j++)
                                    if (bookings[i].eventId == events[j].id)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            events.elementAt(j).name.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Adres : ",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                        Text(
                                                          events
                                                              .elementAt(j)
                                                              .location
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    //start date substring
                                                    Row(
                                                      children: [
                                                        Text("Tarih : ",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                        Text(
                                                          events
                                                              .elementAt(j)
                                                              .startDate
                                                              .toString()
                                                              .substring(0, 10),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Bilet No : ",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                        Text(
                                                            bookings
                                                                .elementAt(i)
                                                                .bookingNumber
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: TextButton(
                                                  //qr code button
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    QrScreen(
                                                                      parameter: bookings
                                                                          .elementAt(
                                                                              i)
                                                                          .bookingNumber
                                                                          .toString(),
                                                                    )));
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Colors.black,
                                                    ),
                                                    child: Icon(
                                                      Icons.qr_code,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
