import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Auth/Login.dart';

class ScreenProfil extends StatefulWidget {



  @override
  State<ScreenProfil> createState() => _ScreenProfilState();
}

class _ScreenProfilState extends State<ScreenProfil> {

  TextEditingController fullname = TextEditingController(text: FirebaseAuth.instance.currentUser?.displayName);
  TextEditingController Email = TextEditingController(text: FirebaseAuth.instance.currentUser?.email);
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Edite Profile"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () => _savedata(auth: FirebaseAuth.instance),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              width: double.infinity,
              height: Get.height * 0.40,
              child: Center(
                child: CircleAvatar(
                  maxRadius: Get.height * 0.1,
                  backgroundImage: NetworkImage(
                      "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _form(),
          ],
        ),
      ),
    );
  }

  _form() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      child: Form(
          child: Column(
        children: [
          input(cont: fullname, TitleFiled: "Full Name"),
          SizedBox(
            height: 10,
          ),
          input(cont: Email, TitleFiled: "Email"),
          SizedBox(
            height: 10,
          ),
          input(cont: Password, TitleFiled: "Password"),
          SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }

  input({required TextEditingController cont, required String TitleFiled}) {
    return TextFormField(
      controller: cont,
      decoration: InputDecoration(
        labelText: TitleFiled,
        border: OutlineInputBorder(),
      ),
    );
  }

    Future _savedata({required FirebaseAuth auth}) async {

    var Student =auth.currentUser;

    if (Student ==""){
      Get.to(()=>LoginScreen());
    }

      await Student?.updateDisplayName(fullname.text);
      await Student?.updateEmail(Email.text);

      return Get.showSnackbar(
        GetSnackBar(
          title: "Successfully",
          message: 'Student Update Successfully',
          backgroundColor: Colors.cyanAccent.shade700,
          icon: const Icon(Icons.check),
          duration: const Duration(seconds: 3),
        ),
      );
    }


}
