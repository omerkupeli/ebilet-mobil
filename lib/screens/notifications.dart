import 'package:flutter/material.dart';
import 'package:mobil_bilet1/core/widgets/buildBaslik.dart';
import 'package:mobil_bilet1/core/widgets/navBarBottom.dart';
import 'package:mobil_bilet1/core/widgets/smallButton.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                          smallButton(Icon(Icons.arrow_back), context),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            "Notifications",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      smallButton(Icon(Icons.more_vert), context)
                    ],
                  )
                ],
              ),
            ),
          ),
          BuildBottomNavBar(),
        ],
      )),
    );
  }
}
