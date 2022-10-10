import 'dart:ui';

import 'package:flutter/material.dart';

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
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
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
                                    color: Colors.white,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "Event",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Color.fromARGB(255, 43, 0, 0),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Event Hall",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),

                        //BUTONLAR
                        Padding(
                          padding: const EdgeInsets.only(top: 48),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buidNavigation(
                                    "Öne Çıkanlar",
                                    const Color.fromARGB(115, 117, 117, 117),
                                    context),
                                const SizedBox(
                                  width: 8,
                                ),
                                buidNavigation(
                                    "Müzik",
                                    const Color.fromARGB(115, 117, 117, 117),
                                    context),
                                const SizedBox(
                                  width: 8,
                                ),
                                buidNavigation(
                                    "Sahne",
                                    const Color.fromARGB(115, 117, 117, 117),
                                    context),
                                const SizedBox(
                                  width: 8,
                                ),
                                buidNavigation(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/movie.jpeg",
                                      height: 150,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Image.asset(
                                      "assets/images/movie1.jpg",
                                      height: 150,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Image.asset(
                                      "assets/images/movie3.jpeg",
                                      height: 150,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Image.asset(
                                      "assets/images/movie.jpeg",
                                      height: 150,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Image.asset(
                                      "assets/images/movie.jpeg",
                                      height: 150,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Image.asset(
                                      "assets/images/movie.jpeg",
                                      height: 150,
                                      width: 100,
                                    ),
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
                              buidBaslik("Yakında"),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/images/movie2.jpg",
                                    height: 150,
                                    width: 100,
                                  ),
                                  Image.asset(
                                    "assets/images/movie.jpeg",
                                    height: 150,
                                    width: 100,
                                  ),
                                  Image.asset(
                                    "assets/images/movie1.jpg",
                                    height: 150,
                                    width: 100,
                                  ),
                                ],
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
                              buidBaslik("Yakında"),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      "assets/images/movie2.jpg",
                                      height: 150,
                                      width: 100,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/movie.jpeg",
                                    height: 150,
                                    width: 100,
                                  ),
                                  Image.asset(
                                    "assets/images/movie1.jpg",
                                    height: 150,
                                    width: 100,
                                  ),
                                ],
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    color: const Color.fromARGB(206, 117, 117, 117),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildNavIcon(Icons.home, true),
                        buildNavIcon(Icons.location_on_outlined, false),
                        buildNavIcon(Icons.feedback, false),
                        buildNavIcon(Icons.person, false),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

Widget buildNavIcon(@required IconData iconData, @required bool active) {
  return Icon(
    iconData,
    size: 25,
    color: active ? Colors.red : Colors.white,
  );
}

Widget buidNavigation(
    String text,
    Color color,
    //Widget widget,
    BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MyApp();
      }));
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

buidBaslik(String baslik) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Text(
      baslik,
      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Colors.white,
          fontStyle: FontStyle.italic),
    ),
  );
}
