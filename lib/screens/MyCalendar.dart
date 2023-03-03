import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/widgets/navBarBottom.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
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
            TableCalendar(
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
                  )),
              headerStyle: const HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
            buildBottomNavBar(context),
          ],
        ),
      ),
    );
  }
}
