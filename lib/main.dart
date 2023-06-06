import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/MyCalendar.dart';
import 'package:mobil_bilet1/screens/bookmark.dart';
import 'package:mobil_bilet1/screens/createEvent.dart';
import 'package:mobil_bilet1/screens/editProfile.dart';
import 'package:mobil_bilet1/screens/eventDetails.dart';
import 'package:mobil_bilet1/screens/eventTest.dart';
import 'package:mobil_bilet1/screens/home.dart';
import 'package:mobil_bilet1/screens/loginPage.dart';
import 'package:mobil_bilet1/screens/profilePage.dart';
import 'package:mobil_bilet1/screens/registerPage.dart';
import 'package:mobil_bilet1/screens/ticket/buyTicket.dart';
import 'package:mobil_bilet1/screens/ticket/myTickets.dart';
import 'package:mobil_bilet1/screens/ticket/payment.dart';
import 'package:mobil_bilet1/screens/ticket/qrReader.dart';

import 'Event.dart';
import 'MyNotifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

MyNotificaitons myNotificaitons = MyNotificaitons(
    title: "Tarkan Konseri",
    description: "Tarkan Konseri 17 Aralıkta Balıkesir'de!",
    image: "https://cdn.bubilet.com.tr/files/Blog/resim-adi-76524.png",
    time: DateTime(2023, 12, 17, 20, 00));

MyNotificaitons myNotificaitons2 = MyNotificaitons(
    title: "Haluk Levent Konseri",
    description: "Haluk Levent Konseri 24 Martta Balıkesir'de!",
    image:
        "https://iasbh.tmgrup.com.tr/611b76/650/344/0/49/800/470?u=https://isbh.tmgrup.com.tr/sbh/2021/09/01/balikesirde-konser-veren-haluk-leventten-uzen-haber-haluk-levent-koronaviruse-yakalandigini-acikladi-1630516590439.jpg",
    time: DateTime(2026, 3, 24, 20, 00));

MyNotificaitons myNotificaitons3 = MyNotificaitons(
    title: "baslik",
    description: "aciklama alsdjhaskasasdasd",
    image:
        "https://iasbh.tmgrup.com.tr/611b76/650/344/0/49/800/470?u=https://isbh.tmgrup.com.tr/sbh/2021/09/01/balikesirde-konser-veren-haluk-leventten-uzen-haber-haluk-levent-koronaviruse-yakalandigini-acikladi-1630516590439.jpg",
    time: DateTime(2027, 3, 24, 20, 00));
