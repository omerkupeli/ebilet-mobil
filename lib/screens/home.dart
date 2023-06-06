import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobil_bilet1/core/widgets/navBarBottom.dart';

import '../Event.dart';
import '../core/widgets/buildBaslik.dart';
import '../core/widgets/buildEventNav.dart';
import '../core/widgets/buildFeatured.dart';
import '../core/widgets/buildNavigationButton.dart';
import '../core/widgets/searchBar.dart';
import 'package:mobil_bilet1/main.dart';

import '../models/eventModel.dart';
import '../service/eventService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Events> events = [];
  var ivent;
  Future<void> getEvents() async {
    final response = await EventApi.getEvents();

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (ivent in data['data']) {
          events.add(Events.fromJson(ivent));
        }
        setState(() {});
      } else {
        print('Hata');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildSearchBar(context),
                    ),

                    Column(
                      children: [buildFeatured()],
                    ),

                    //BUTONLAR
                    Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildNavigationButton(
                                "Öne Çıkanlar",
                                const Color.fromARGB(115, 117, 117, 117),
                                context),
                            const SizedBox(
                              width: 8,
                            ),
                            buildNavigationButton(
                                "Müzik",
                                const Color.fromARGB(115, 117, 117, 117),
                                context),
                            const SizedBox(
                              width: 8,
                            ),
                            buildNavigationButton(
                                "Sahne",
                                const Color.fromARGB(115, 117, 117, 117),
                                context),
                            const SizedBox(
                              width: 8,
                            ),
                            buildNavigationButton(
                                "Sahne",
                                const Color.fromARGB(115, 117, 117, 117),
                                context),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //Öne Çıkanlar
                    Column(
                      children: [
                        buidBaslik("Öne Çıkanlar"),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0; i < events.length; i++)
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    child: buildEventNav(context, events, i))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //Yakında..
                    Column(
                      children: [
                        buidBaslik("Öne Çıkanlar"),
                        const SizedBox(
                          height: 8,
                        ),
                        // ListView.builder(
                        //   itemCount: events.length,
                        //   itemBuilder: (context, index) {
                        //     return buildEventNav(context, events, index);
                        //   },
                        // )
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0; i < events.length; i++)
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    child: buildEventNav(context, events, i))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        buidBaslik("Öne Çıkanlar"),
                        const SizedBox(
                          height: 8,
                        ),
                        // ListView.builder(
                        //   itemCount: events.length,
                        //   itemBuilder: (context, index) {
                        //     return buildEventNav(context, events, index);
                        //   },
                        // )
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0; i < events.length; i++)
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    child: buildEventNav(context, events, i))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
            //Alt Kontrol Bar
            buildBottomNavBar(context, HomePage()),
          ],
        ),
      ),
    );
  }
}
