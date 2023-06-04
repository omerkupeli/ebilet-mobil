import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobil_bilet1/service/eventService.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  String qrCode = '';
  String uyari = '';

  Future<void> useTicket(String bookingNumber) async {
    final response = EventApi.useTicket(bookingNumber);
    uyari = response.toString();
    print(uyari);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Kod Okuyucusu'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Bilet No: $qrCode',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          useTicket(qrCode);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Bilet Kullan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrCode = scanData.code!;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
