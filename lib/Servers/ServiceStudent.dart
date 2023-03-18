import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student/Models/Models_Conf.dart';

class ServiceStudent {
  Future<List<AttendanceRecord>> serviceAttendece(String id) async {
    List<AttendanceRecord> attendanceRecords = [];

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('students')
        .doc(id)
        .collection('student_courses')
        .get()
        .catchError((error, stackTrace) {
          print("++++++++++++++++++++++");
          print(error);
          print("++++++++++++++++++++++");
    });

    attendanceRecords = snapshot.docs
        .map(
          (doc) => AttendanceRecord.fromJson(doc.data()),
        )
        .toList();

    return attendanceRecords;
  }
}
