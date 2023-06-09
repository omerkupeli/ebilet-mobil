import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobil_bilet1/core/widgets/smallButton.dart';
import 'package:mobil_bilet1/screens/home.dart';
import 'package:mobil_bilet1/screens/profilePage.dart';
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
  bool uyariStatus = false;

  Future<void> useTicket(String bookingNumber) async {
    final response = EventApi.useTicket(bookingNumber);
    response.then((value) {
      if (value.statusCode == 200) {
        setState(() {
          uyari = 'Bilet Geçerli';
          uyariStatus = true;
        });
      } else {
        setState(() {
          uyari = 'Bilet Geçersiz';
          uyariStatus = false;
        });
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          smallButton(const Icon(Icons.arrow_back), context,
                              nextPage: const HomePage()),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            "Biletlerim",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
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
                          Text(
                            uyari,
                            style: TextStyle(
                              fontSize: 16,
                              color: uyariStatus ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
