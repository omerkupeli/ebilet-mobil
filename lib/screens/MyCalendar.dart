import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/ticket/qrticket.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/widgets/navBarBottom.dart';
import '../models/bookingModel.dart';
import '../models/eventModel.dart';
import '../service/eventService.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
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
  List<Bookings> matchedBookings = [];
  List<Events> matchEvents(List<Bookings> bookings, List<Events> events) {
    for (var i = 0; i < bookings.length; i++) {
      for (var j = 0; j < events.length; j++) {
        if (bookings[i].eventId == events[j].id) {
          matchedEvents.add(events[j]);
          matchedBookings.add(bookings[i]);
        }
      }
    }
    return matchedEvents;
  }

  bool isDatePassed(DateTime date) {
    final now = DateTime.now();
    return date.isBefore(DateTime(now.year, now.month, now.day));
  }

  List<Events> selectedDaysEvents = [];

  Future<void> _selectedDaysEvent(DateTime selectedDay) async {
    for (var i = 0; i < bookings.length; i++) {
      if (matchedEvents[i].startDate.toString().substring(0, 10) ==
          selectedDay.toString().substring(0, 10)) {
        selectedDaysEvents.add(matchedEvents[i]);
      }
    }
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
      appBar: AppBar(
        title: Text("Etkinlik Takvimim"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: TableCalendar(
                      focusedDay: selectedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2050),
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      daysOfWeekVisible: true,
                      //day Changed
                      onDaySelected: (DateTime selectDay, focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                        });
                        print(focusedDay);
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },
                      //to style to calendar
                      calendarStyle: const CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: true,
                        titleCentered: true,
                        formatButtonShowsNext: true,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        formatButtonTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var j = 0; j < events.length; j++)
                                  for (var i = 0; i < bookings.length; i++)
                                    if (bookings.elementAt(i).eventId ==
                                            events.elementAt(j).id &&
                                        events
                                                .elementAt(j)
                                                .startDate
                                                .toString()
                                                .substring(0, 10) ==
                                            selectedDay
                                                .toString()
                                                .substring(0, 10))
                                      Column(
                                        children: [
                                          Container(
                                            height: 200,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        events
                                                            .elementAt(j)
                                                            .name
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      "Adres : ",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      )),
                                                                  Text(
                                                                    events
                                                                        .elementAt(
                                                                            j)
                                                                        .location
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
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
                                                                  Text(
                                                                      "Tarih : ",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      )),
                                                                  Text(
                                                                    events
                                                                        .elementAt(
                                                                            j)
                                                                        .startDate
                                                                        .toString()
                                                                        .substring(
                                                                            0,
                                                                            10),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      "Bilet No : ",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      )),
                                                                  Text(
                                                                      bookings
                                                                          .elementAt(
                                                                              i)
                                                                          .bookingNumber
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      )),
                                                                  SizedBox(
                                                                    width: 16,
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 24,
                                                              ),
                                                              //isDatePassed
                                                              isDatePassed(DateTime.parse(events
                                                                      .elementAt(
                                                                          j)
                                                                      .startDate
                                                                      .toString()
                                                                      .substring(
                                                                          0,
                                                                          10)))
                                                                  ? Text(
                                                                      "! Etkinlik Tarihi Geçmiş !",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ))
                                                                  : Text(
                                                                      "Etkinlik Başlamadı",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      )),
                                                            ],
                                                          ),
                                                          TextButton(
                                                            //qr code button
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          QrScreen(
                                                                            parameter:
                                                                                bookings.elementAt(i).bookingNumber.toString(),
                                                                          )));
                                                            },
                                                            child: Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              child: Icon(
                                                                Icons.qr_code,
                                                                color: Colors
                                                                    .white,
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildBottomNavBar(context, MyCalendar()),
          ],
        ),
      ),
    );
  }
}
