// ignore_for_file: unnecessary_null_comparison, must_be_immutable

import 'dart:developer';

import 'package:chat_app_firebase/helper/fire_store_helper.dart';
import 'package:chat_app_firebase/helper/signup_helper.dart';
import 'package:chat_app_firebase/modal/fire_store_modal.dart';
import 'package:chat_app_firebase/modal/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  late String name;
  late int age;
  late int id;

  @override
  Widget build(BuildContext context) {
    UserModal? userModal = Get.arguments;
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Visibility(
                visible: userModal != null,
                child: CircleAvatar(
                  foregroundImage: NetworkImage("${userModal?.userImage}"),
                ),
              ),
              accountName: Visibility(
                visible: userModal != null,
                child: Text(
                  userModal?.userName ?? "Geste Account",
                  style: GoogleFonts.headlandOne(),
                ),
              ),
              accountEmail: Visibility(
                visible: userModal != null,
                child: Text(
                  userModal?.userEmail ?? "Geste Account",
                  style: GoogleFonts.headlandOne(),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                bool logout = await SignupHelper.signupHelper.logoutUser();
                log("$logout");
                (logout == true)
                    ? Get.offNamed("/")
                    : Get.snackbar(
                        "Something Wrong",
                        "Your Logout Failed",
                      );
              },
              icon: const Icon(
                Icons.logout_outlined,
              ),
              label: Text(
                "Log-out",
                style: GoogleFonts.headlandOne(),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: s.height * 0.8,
          width: s.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
          ),
          child: StreamBuilder(
            stream: FireStoreHelper.fireStoreHelper.db
                .collection("student")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = FireStoreHelper.fireStoreHelper.readData();

                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      height: s.height * 0.02,
                      child: Text(
                        data[index],
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            FireStoreHelper.fireStoreHelper.addData();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onSubmitted: (value) {
                        name = value;
                        log(name);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Name",
                      ),
                    ),
                    SizedBox(height: s.height * 0.02),
                    TextField(
                      onSubmitted: (value) {
                        age = int.parse(value);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Age",
                      ),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    label: const Text("Continue"),
                    icon: const Icon(
                      Icons.keyboard_double_arrow_right,
                    ),
                  )
                ],
              ),
            );
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
