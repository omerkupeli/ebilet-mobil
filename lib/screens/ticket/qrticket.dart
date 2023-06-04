import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  final String parameter;

  QrScreen({required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Kodu ' + parameter),
      ),
      body: Center(
        child: QrImage(
          data: parameter, // Parametre olarak aldığınız değeri burada kullanın
          version: QrVersions.auto,
          size: 300.0,
        ),
      ),
    );
  }
}
