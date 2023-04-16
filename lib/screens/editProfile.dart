import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/userModel.dart';
import '../service/userService.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  DateTime now = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  User user = User(
      id: 0,
      name: "",
      email: "",
      image: 'https://i.pravatar.cc/300',
      created_at: "",
      phone: "");

  @override
  void initState() {
    super.initState();
    Api.getProfile().then((value) {
      setState(() {
        user = User.fromJson(jsonDecode(value.body));
        print(user);
      });
    });

    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                              'Edit Profile',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://i.pravatar.cc/300'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //edit text
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Name',
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
                              controller: nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user.name,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              'E mail',
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
                              controller: emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user.email,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            const Text(
                              'Date of Birth',
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
                                      labelText:
                                          "Enter Date" //label text of field
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
                                      print("Not selected");
                                    }
                                    //when click we have to show the datepicker
                                  })),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Phone Number',
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
                              controller: phoneController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user.phone ?? "Phone Number",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Save button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[500],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextButton(
                            onPressed: () {
                              final user = User(
                                  id: 2,
                                  name: nameController.text == ""
                                      ? this.user.name
                                      : nameController.text,
                                  email: emailController.text == ""
                                      ? this.user.email
                                      : emailController.text,
                                  created_at: dateController.text,
                                  image: "https://i.pravatar.cc/300",
                                  phone: phoneController.text == ""
                                      ? this.user.phone
                                      : phoneController.text);

                              Api.updateProfile(user);
                            },
                            child: const Text(
                              'Save Changes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    )));
  }
}
