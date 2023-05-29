import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobil_bilet1/models/eventModel.dart';
import 'package:mobil_bilet1/service/eventService.dart';
import 'dart:convert';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime now = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventTagsController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  //selected status
  String selectedStatus = "Aktif";
  //status
  List<String> status = ["Aktif", "Pasif"];
  Events event = Events();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_outlined),
                                ),
                                const Text(
                                  'Yeni Etkinlik',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // add image
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //4 more images
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Etkinlik Adı",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: eventNameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Etkinlik Adı"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Etkinlik Türü",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: eventTagsController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Etkinlik Türü"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Etkinlik Tarihi',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //date picker
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                                controller:
                                    dateController, //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText: "Tarih Seç" //label text of field
                                    ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat("yyyy-MM-dd")
                                            .format(pickedDate);

                                    setState(() {
                                      dateController.text =
                                          formattedDate.toString();
                                    });
                                  } else {
                                    print("Seçilmedi");
                                  }
                                  //when click we have to show the datepicker
                                })),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Etkinlik Süresi",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: durationController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Etkinlik Süresi"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Row(
                        children: [
                          const Text(
                            "Etkinlik Adresi",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: eventLocationController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Etkinlik Adresi"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   children: [
                      //     const Text(
                      //       "Adres Detayı",
                      //       style: TextStyle(
                      //           fontSize: 15, fontWeight: FontWeight.normal),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.transparent,
                      //     borderRadius: BorderRadius.circular(16),
                      //     border: Border.all(
                      //       color: Colors.blue[500]!,
                      //     ),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 10),
                      //     child: TextFormField(
                      //       decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           hintText: "Adres Detayı"),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Etkinlik Açıklaması",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: eventDescriptionController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Etkinlik Açıklaması"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   children: [
                      //     const Text(
                      //       "Etkinlik Konumu Ekle",
                      //       style: TextStyle(
                      //           fontSize: 15, fontWeight: FontWeight.normal),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   height: 150,
                      //   decoration: BoxDecoration(
                      //     color: Colors.transparent,
                      //     borderRadius: BorderRadius.circular(16),
                      //     border: Border.all(
                      //       color: Colors.blue[500]!,
                      //     ),
                      //   ),
                      //   child: Padding(
                      //       padding: const EdgeInsets.only(left: 10),
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         child: Icon(
                      //           Icons.add_location_alt,
                      //           color: Colors.blue,
                      //         ),
                      //       )),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      //status
                      Row(
                        children: [
                          const Text(
                            "Etkinlik Durumu",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text("Etkinlik Durumu"),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              value: selectedStatus,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedStatus = newValue.toString();
                                });
                              },
                              items: status.map((status) {
                                return DropdownMenuItem(
                                  child: new Text(status),
                                  value: status,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text("Biletler Ve Ödeme",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Vip Bilet Fiyatı",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "000",
                                icon: Icon(Icons.attach_money)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Ekonomi Bilet Fiyatı",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "000",
                                icon: Icon(Icons.attach_money)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Bilet Satış Başlangıç Tarihi",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                                controller:
                                    dateController, //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText:
                                        "00/00/0000" //label text of field
                                    ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat("yyyy-MM-dd")
                                            .format(pickedDate);

                                    setState(() {
                                      dateController.text =
                                          formattedDate.toString();
                                    });
                                  } else {
                                    print("Seçilmedi");
                                  }
                                  //when click we have to show the datepicker
                                })),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Bilet Satış Bitiş Tarihi",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                                controller:
                                    dateController, //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText:
                                        "00/00/0000" //label text of field
                                    ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat("yyyy-MM-dd")
                                            .format(pickedDate);

                                    setState(() {
                                      dateController.text =
                                          formattedDate.toString();
                                    });
                                  } else {
                                    print("Seçilmedi");
                                  }
                                  //when click we have to show the datepicker
                                })),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Bilet Satış Başlangıç Saati",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                                controller:
                                    timeController, //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(
                                        Icons.access_time), //icon of text field
                                    labelText:
                                        "Başlangıç Saati" //label text of field
                                    ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    String formattedTime =
                                        pickedTime.format(context);

                                    setState(() {
                                      timeController.text =
                                          formattedTime.toString();
                                    });
                                  } else {
                                    print("Seçilmedi");
                                  }
                                  //when click we have to show the datepicker
                                })),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Bilet Satış Bitiş Saati",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.blue[500]!,
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                                controller:
                                    timeController, //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(
                                        Icons.access_time), //icon of text field
                                    labelText:
                                        "Bitiş Saati" //label text of field
                                    ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    String formattedTime =
                                        pickedTime.format(context);

                                    setState(() {
                                      timeController.text =
                                          formattedTime.toString();
                                    });
                                  } else {
                                    print("Seçilmedi");
                                  }
                                  //when click we have to show the datepicker
                                })),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextButton(
                          onPressed: () {
                            final event = Events(
                                name: " eventNameController.text",
                                merchantId: null,
                                categoryId: null,
                                description: "eventDescriptionController.text",
                                minPrice: null,
                                seats: null,
                                tags: null,
                                startDate: DateFormat("yyyy-MM-dd HH:mm:ss")
                                    .parse(DateTime.now().toString()),
                                endDate: DateFormat("yyyy-MM-dd HH:mm:ss")
                                    .parse(DateTime.now().toString()),
                                location: "eventLocationController.text",
                                image:
                                    "https://cdn.bubilet.com.tr/files/Blog/resim-adi-76524.png",
                                status: null,
                                category: null);
                            EventApi.createEvent(event);
                            // // ScaffoldMessenger.of(context).showSnackBar(
                            // //   const SnackBar(
                            // //     content:
                            // //         Text('Etkinlik Oluşturuldu ve Yayınlandı'),
                            // //     duration: Duration(seconds: 2),
                            // //     backgroundColor: Colors.grey,
                            // //   ),
                            // // );
                          },
                          child: const Text(
                            'Etkinlik Oluştur ve Yayınla',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
