import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/MyCalendar.dart';
import 'package:mobil_bilet1/screens/home.dart';

import 'Event.dart';

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
      home: const MyCalendar(),
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
    name: "Tarkan Konseri2",
    category: "Müzik",
    location: "Altıeylül, Balıkesir",
    date: "17 Aralık 2023",
    imageUrl: "https://cdn.bubilet.com.tr/files/Blog/resim-adi-76524.png",
    going: "20K+ Gidiyor...",
    venue: "Altıeylül, Balıkesir Spor Salonu",
    time: "20:00 - 23:00",
    images: [
      "https://picsum.photos/seed/980/600",
      "https://picsum.photos/seed/980/600",
      "https://picsum.photos/seed/980/600"
    ],
    description:
        "Bu örnekte, SingleChildScrollView ile sarmalanmış bir Column widget'ı var. ScrollController örneği oluşturuldu ve SingleChildScrollView'a atandı. Hedef bölge, yeşil renkteki bir Container ile temsil edilir ve _targetOffset sabiti ile belirlenir. Düğme, _scrollToTarget yöntemi çağrılarak tıklanır ve ScrollController'ın animateTo yöntemi kullanılarak sayfa hedef bölgeye kaydırılır.");
