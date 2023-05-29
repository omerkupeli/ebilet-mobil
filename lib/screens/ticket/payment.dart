import 'package:flutter/material.dart';
import 'package:mobil_bilet1/screens/ticket/qrticket.dart';

import '../../core/widgets/smallButton.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TicketScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
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
                            "Ödeme",
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
                    height: 24,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ödeme Yöntemi",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        TextButton(
                            onPressed: _onButtonPressed,
                            child: Text("Kart Ekle")),
                      ]),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.credit_card),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text("***** Kartım"),
                                const SizedBox(
                                  width: 80,
                                ),
                                Text("**** **** **** 1234"),
                              ],
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.credit_card),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text("****** Kartım"),
                                const SizedBox(
                                  width: 80,
                                ),
                                Text("**** **** **** 1234"),
                              ],
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  //add voucher
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("İndirim Kodu Ekle",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                      ]),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "İndirim Kodu",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 165,
                  ),
                  //ödemeyi tamamla butonu
                  GestureDetector(
                    onTap: _onButtonPressed,
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        color: Colors.blue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Ödemeyi Tamamla",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
