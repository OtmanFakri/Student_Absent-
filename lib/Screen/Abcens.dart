import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:student/Models/Models_Conf.dart';
import 'package:student/Screen/ScanQr.dart';
import 'package:student/Servers/ServiceStudent.dart';
import '../Models/test.dart';
import '../Controller/ControllerStudent.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class AbcensScreen extends StatefulWidget {
  @override
  State<AbcensScreen> createState() => _AbcensScreenState();
  var user = FirebaseAuth.instance;
}

class _AbcensScreenState extends State<AbcensScreen> {
  var db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance;
  final controller = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
             Get.to(()=>ScanQr()),
          child: Icon(Icons.document_scanner),
        ),
        body: GetBuilder<StudentController>(
          init: StudentController(),
          builder: (controller) {
            return ListAttendeces(controller);
          },
        ));
  }

  ListAttendeces(items) {
    if (items.isLoading.value) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(items.oo[index].courseID),
          children: [
            Text(items.oo[index].attendance.toString())
          ],
        );
      }, itemCount: items.oo.length,);
    }
  }

  _fakedata() async {

    /*
    Student student = Student(
        name: user.currentUser!.displayName.toString(),
        email: user.currentUser!.email.toString(),
        studentId: user.currentUser!.uid.toString());

    await FirebaseFirestore.instance
        .collection('students')
        .doc(student.studentId)
        .set(student.toJson())
        .then((value) => Get.showSnackbar(
              GetSnackBar(
                title: "suc",
                message: "sucusuus",
                backgroundColor: Colors.red.shade300,
                icon: const Icon(Icons.error_outline),
                duration: const Duration(seconds: 3),
              ),
            ))
        .onError((error, stackTrace) => Get.showSnackbar(
              GetSnackBar(
                title: "Error",
                message: error.toString(),
                backgroundColor: Colors.red.shade300,
                icon: const Icon(Icons.error_outline),
                duration: const Duration(seconds: 3),
              ),
            ));

    AttendanceRecord attendanceRecord =
        AttendanceRecord(courseID: "123", attendance: {
      '2023-03-01': true,
      '2023-03-02': false,
      '2023-03-03': true,
    });
    await FirebaseFirestore.instance
        .collection('students')
        .doc(student.studentId)
        .collection('student_courses')
        .doc(attendanceRecord.courseID)
        .set(attendanceRecord.toJson());
    */


    /*
    final courseDocRef = FirebaseFirestore.instance.collection('courses').doc();
    AttendanceRecord attendanceRecord =
    AttendanceRecord(courseID: "123", attendance: {
      '2023-03-01': true,
      '2023-03-02': false,
      '2023-03-03': true,
    });
// Define the course data.
    final courseData = {
      'name': 'Introduction to Dart',
      'description': 'Learn the Dart programming language from scratch.',
    };


    //await courseDocRef.set(courseData);

// Create a new course object.
    Course course = Course(
      courseId: "Dart",
      name: courseData['name'].toString(),
      description: courseData['description'].toString(),
    );
    await FirebaseFirestore.instance
        .collection('courses')
        .doc("ESDdOzLsfTJHszTvXAMl")
        .set(course.toJson());

    CourseSession courseSession = CourseSession(
      sessionId: "S1",
      teacherId: "teacherId",
      startTime: Timestamp(10, 00),
      endTime: Timestamp(12, 00),);

    await FirebaseFirestore.instance
        .collection('courses')
        .doc("ESDdOzLsfTJHszTvXAMl")
        .collection("courseSession")
        .doc("123").set(courseSession.toJson());

     */
    AttendanceRecord attendanceRecord =
    AttendanceRecord(courseID: "123", attendance: {
      '2023-03-09': true,
    });
    await FirebaseFirestore.instance
        .collection('students')
        .doc(user.currentUser!.uid)
        .collection('student_courses')
        .doc(attendanceRecord.courseID)
        .set(attendanceRecord.toJson());

  }


}
