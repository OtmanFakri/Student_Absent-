import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String studentId;
  String name;
  String email;

  Student({required this.studentId, required this.name, required this.email});

  factory Student.fromJson(Map<String, dynamic> json) =>
      Student(
        studentId: json['student_id'],
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() =>
      {
        'student_id': studentId,
        'name': name,
        'email': email,
      };
}

class AttendanceRecord {
  String courseID;
  Map<String, bool> attendance;

  AttendanceRecord({required this.courseID, required this.attendance});

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      AttendanceRecord(
        courseID: json['course_id'],
        attendance: Map<String, bool>.from(json['attendance']),
      );

  Map<String, dynamic> toJson() =>
      {
        'course_id': courseID,
        'attendance': attendance,
      };
}

class Course {
  String courseId;
  String name;
  String description;

  Course(
      {required this.courseId, required this.name, required this.description});

  factory Course.fromJson(Map<String, dynamic> json) =>
      Course(
        courseId: json['course_id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
    'course_id': courseId,
    'name': name,
    'description': description,
  };

}

class CourseSession {
  String sessionId;
  String teacherId;
  Timestamp startTime;
  Timestamp endTime;

  CourseSession({required this.sessionId,
    required this.teacherId,
    required this.startTime,
    required this.endTime});

  factory CourseSession.fromJson(Map<String, dynamic> json) =>
      CourseSession(
          sessionId: json['session_id'],
          teacherId: json['teacher_id'],
          startTime: json['start_time'],
          endTime: json['end_time']);


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['teacher_id'] = this.teacherId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class StudentSessionAttendance {
  String studentId;
  bool attendance;

  StudentSessionAttendance({required this.studentId, required this.attendance});

  factory StudentSessionAttendance.fromJson(Map<String, dynamic> json) =>
      StudentSessionAttendance(
          studentId: json['student_id'],
          attendance: json['attendance']);

  Map<String, dynamic> toJson() =>
      {
        'student_id': studentId,
        'attendance': attendance,
      };
}
