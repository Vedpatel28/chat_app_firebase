// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:chat_app_firebase/helper/fire_store_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String id = "";
  String name = "";
  String password = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(20),
              TextFormField(
                initialValue: id,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter User ID";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  id = newValue!;
                  log("Id = $id");
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("ID"),
                ),
              ),
              const Gap(20),
              TextFormField(
                initialValue: name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter User Name";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  name = newValue!;
                  log("Name = $name");
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("User Name"),
                ),
              ),
              const Gap(20),
              TextFormField(
                initialValue: password,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Password";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  password = newValue!;
                  log("Password = $password");
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password"),
                ),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    FireStoreHelper.fireStoreHelper.getCredential(
                      id: int.parse(id),
                    );
                    log("Successful");
                    Get.offNamed("/HomePage");
                  }
                },
                child: const Text(
                  "SUBMIT",
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFDDE2E5),
    );
  }
}
