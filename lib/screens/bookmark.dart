import 'package:flutter/material.dart';
import 'package:mobil_bilet1/core/widgets/buildEventNav.dart';

import '../core/widgets/buildNavigationButton.dart';
import '../core/widgets/navBarBottom.dart';
import '../core/widgets/smallButton.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          smallButton(const Icon(Icons.arrow_back), context),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            "Bookmark",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      smallButton(const Icon(Icons.more_vert), context)
                    ],
                  ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildEventNav(context, event),
                        const SizedBox(
                          width: 12,
                        ),
                        buildEventNav(context, event),
                        const SizedBox(
                          width: 12,
                        ),
                        buildEventNav(context, event),
                        const SizedBox(
                          width: 12,
                        ),
                        buildEventNav(context, event),
                        const SizedBox(
                          width: 12,
                        ),
                        buildEventNav(context, event),
                        const SizedBox(
                          width: 12,
                        ),
                        buildEventNav(context, event),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          buildBottomNavBar(context),
        ],
      )),
    );
  }
}
