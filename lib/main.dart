import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/MyCalendar.dart';
import 'package:mobil_bilet1/screens/home.dart';
import 'package:mobil_bilet1/screens/loginPage.dart';
import 'package:mobil_bilet1/screens/registerPage.dart';

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
      home: LoginPage(),
    );
  }
}

Event event = Event(
    name: "Tarkan Konseri",
    category: "Müzik",
    location: "Altıeylül, Balıkesir",
    date: "17 Aralık, 2023",
    imageUrl: "https://cdn.bubilet.com.tr/files/Blog/resim-adi-76524.png",
    going: "20K+ Gidiyor...",
    time: "20:00 - 23:00",
    venue: "Altıeylül, Balıkesir Spor Salonu",
    images: [
      "https://picsum.photos/seed/980/600",
      "https://picsum.photos/seed/980/600",
      "https://picsum.photos/seed/980/600"
    ],
    description:
        "Bu örnekte, SingleChildScrollView ile sarmalanmış bir Column widget'ı var. ScrollController örneği oluşturuldu ve SingleChildScrollView'a atandı. Hedef bölge, yeşil renkteki bir Container ile temsil edilir ve _targetOffset sabiti ile belirlenir. Düğme, _scrollToTarget yöntemi çağrılarak tıklanır ve ScrollController'ın animateTo yöntemi kullanılarak sayfa hedef bölgeye kaydırılır.");

Event event2 = Event(
    name: "Haluk Levent Konseri",
    category: "Müzik",
    location: "Bandırma, Balıkesir",
    date: "24 Mart 2023",
    imageUrl:
        "https://iasbh.tmgrup.com.tr/611b76/650/344/0/49/800/470?u=https://isbh.tmgrup.com.tr/sbh/2021/09/01/balikesirde-konser-veren-haluk-leventten-uzen-haber-haluk-levent-koronaviruse-yakalandigini-acikladi-1630516590439.jpg",
    going: "25K+ Gidiyor...",
    venue: "Bandırma, Bandrma Spor Salonu",
    time: "20:00 - 23:00",
    images: [
      "https://picsum.photos/seed/980/600",
      "https://picsum.photos/seed/980/600",
      "https://picsum.photos/seed/980/600"
    ],
    description:
        "Bu örnekte, SingleChildScrollView ile sarmalanmış bir Column widget'ı var. ScrollController örneği oluşturuldu ve SingleChildScrollView'a atandı. Hedef bölge, yeşil renkteki bir Container ile temsil edilir ve _targetOffset sabiti ile belirlenir. Düğme, _scrollToTarget yöntemi çağrılarak tıklanır ve ScrollController'ın animateTo yöntemi kullanılarak sayfa hedef bölgeye kaydırılır.");

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
