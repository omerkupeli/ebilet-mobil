import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'package:qr_flutter/qr_flutter.dart';

String generateTicketNumber() {
  Random random = Random();
  String ticketNumber = "";
  for (int i = 0; i < 6; i++) {
    ticketNumber += random.nextInt(10).toString();
  }
  return ticketNumber;
}

QrImage qrImage = QrImage(
  data: ticketNumber,
  version: QrVersions.auto,
  size: 200.0,
);
String ticketNumber = "812736";

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  String ticketNumber = "812736";

  int count = 0;
  Widget build(BuildContext context) {
    void createNewTicket() {
      setState(() {
        ticketNumber = generateTicketNumber();
        qrImage = QrImage(
          data: ticketNumber,
          version: QrVersions.auto,
          size: 200.0,
        );
      });
      count++;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bilet Oluştur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bilet Numarası:',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              //butona basılmadığında 000000 gözükecek
              ticketNumber,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            qrImage ?? SizedBox(),
            // ElevatedButton(
            //     onPressed: () {
            //       count == 0 ? createNewTicket() : null;
            //     },
            //     child: Text('E-Bilet Oluştur'))
          ],
        ),
      ),
    );
  }
}
