import 'package:flutter/material.dart';
import 'package:mobil_bilet1/core/widgets/buildNotification.dart';
import 'package:mobil_bilet1/core/widgets/navBarBottom.dart';
import 'package:mobil_bilet1/core/widgets/smallButton.dart';
import 'package:mobil_bilet1/main.dart';
import 'package:mobil_bilet1/MyNotifications.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<MyNotificaitons> notifications = [
    myNotificaitons,
    myNotificaitons2,
    myNotificaitons3,
  ];

  @override
  Widget build(BuildContext context) {
    notifications.sort((a, b) => b.time.compareTo(a.time));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                              "Notifications",
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
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(notifications[index].title),
                          onDismissed: (direction) {
                            setState(() {
                              notifications.removeAt(index);
                            });
                          },
                          child: buildNotification(
                            notifications[index].image,
                            notifications[index].title,
                            notifications[index].description,
                            notifications[index].time.toString(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            buildBottomNavBar(context, Notifications()),
          ],
        ),
      ),
    );
  }
}
