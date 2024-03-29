import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  final String parameter;

  QrScreen({required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Kodu'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 150, 8, 8),
          child: Column(
            children: [
              QrImage(
                data:
                    parameter, // Parametre olarak aldığınız değeri burada kullanın
                version: QrVersions.auto,
                size: 300.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  'Bilet No : ' + parameter,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
