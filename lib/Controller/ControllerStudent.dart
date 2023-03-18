import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Models/Models_Conf.dart';
import 'package:student/Servers/ServiceStudent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class StudentController extends GetxController {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controllerQR;


  @override
  void dispose() {
    controllerQR?.dispose();
  }

  ServiceStudent ServiceStudents = ServiceStudent();
  RxList<dynamic> oo = [].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    ListEtuden();
  }

  ListEtuden() async {
    await ServiceStudents.serviceAttendece(FirebaseAuth.instance.currentUser!.uid.toString())
        .then((value) => {
              oo.addAll(value),
            }).onError((error, stackTrace) => {
              print(error),
    });
    isLoading = false.obs;
    update();
  }




  void onQRViewCreated(QRViewController controller) {
    this.controllerQR = controller;
    controller.scannedDataStream.listen((scanData) {
        result = scanData;
        update();
    });
    update();

  }
}
