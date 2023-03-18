import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Models/Models_Conf.dart';
import 'package:student/Screen/Abcens.dart';

import '../Controller/ControllerStudent.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScanQr extends GetView<StudentController> {
  const ScanQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:QrScan(context),),
          (controller.result != null)
              ? quirty()
          /*Text('Barcode Type: ${describeEnum(controller.result!.format)}   Data: ${controller.result!.code}') */
              : Text('Scan a code'),
          Text(controller.result.toString()),
        ],
      ));
  }
  quirty() async{

    AttendanceRecord attendanceRecord =
    AttendanceRecord(courseID: "789", attendance: {
      '2023-03-01': true,
    });
    await FirebaseFirestore.instance
        .collection('students')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('student_courses')
        .doc(attendanceRecord.courseID)
        .set(attendanceRecord.toJson()).then((value) => {
          Get.to(()=>AbcensScreen()),
          Get.showSnackbar(
            GetSnackBar(
              title: "Sucess",
              message: 'Has ben iscren.',
              backgroundColor: Colors.cyan.shade300,
              icon: const Icon(Icons.error_outline),
              duration: const Duration(seconds: 3),
            )
          ),
    });
  }
  QrScan(BuildContext context){
    if (Platform.isAndroid) {
      controller.controllerQR?.pauseCamera();
      (context as Element).markNeedsBuild();
    } else if (Platform.isIOS) {
      controller.controllerQR?.resumeCamera();
      (context as Element).markNeedsBuild();
    }
    return QRView(
      key: controller.qrKey,
      onQRViewCreated: controller.onQRViewCreated,
      overlay: QrScannerOverlayShape(),
    );
  }
}

