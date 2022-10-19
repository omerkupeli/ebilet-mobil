import 'package:flutter/material.dart';
import 'package:mobil_bilet1/core/widgets/navBarBottom.dart';

import '../core/widgets/buildBaslik.dart';
import '../core/widgets/buildEventNav.dart';
import '../core/widgets/buildFeatured.dart';
import '../core/widgets/button.dart';
import '../core/widgets/searchBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //BASLİK
                    Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_sharp,
                                color: Colors.black,
                              ),
                              Column(
                                children: const [
                                  Text(
                                    "Event",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 43, 0, 0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Event Hall",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    //SEARCH BAR
                    buildSearchBar(context),

                    Container(
                      child: Column(
                        children: [buildFeatured()],
                      ),
                    ),

                    //BUTONLAR
                    Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildNavigation(
                                "Öne Çıkanlar",
                                const Color.fromARGB(115, 117, 117, 117),
                                context),
                            const SizedBox(
                              width: 8,
                            ),
                            buildNavigation(
                                "Müzik",
                                const Color.fromARGB(115, 117, 117, 117),
                                context),
                            const SizedBox(
                              width: 8,
                            ),
                            buildNavigation(
                                "Sahne",
                                const Color.fromARGB(115, 117, 117, 117),
                                context),
                            const SizedBox(
                              width: 8,
                            ),
                            buildNavigation(
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
                    Container(
                      child: Column(
                        children: [
                          buidBaslik("Öne Çıkanlar"),
                          const SizedBox(
                            height: 8,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //Yakında..
                    Container(
                      child: Column(
                        children: [
                          buidBaslik("Öne Çıkanlar"),
                          const SizedBox(
                            height: 8,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: Column(
                        children: [
                          buidBaslik("Öne Çıkanlar"),
                          const SizedBox(
                            height: 8,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                                const SizedBox(
                                  width: 12,
                                ),
                                buildEventNav(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
            //Alt Kontrol Bar
            BuildBottomNavBar(),
          ],
        ),
      ),
    );
  }
}
