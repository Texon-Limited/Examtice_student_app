// To parse this JSON data, do
//
//     final examStudentsList = examStudentsListFromJson(jsonString);

import 'dart:convert';

import 'package:examtice_teacher/home/models/student_list_response.dart';

StudentsListResponseByExam examStudentsListFromJson(String str) => StudentsListResponseByExam.fromJson(json.decode(str));

String examStudentsListToJson(StudentsListResponseByExam data) => json.encode(data.toJson());

class StudentsListResponseByExam {
  StudentsListResponseByExam({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory StudentsListResponseByExam.fromJson(Map<String, dynamic> json) => StudentsListResponseByExam(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.studentId,
    this.firstName,
    this.lastName,
    this.email,
    this.status,
    this.lmsExamId,
    this.isExam,
    this.createdBy,
  });

  int? studentId;
  String? firstName;
  String? lastName;
  String? email;
  int? status;
  int? lmsExamId;
  int? isExam;
  int? createdBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    studentId: json["studentId"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    status: json["status"],
    lmsExamId: json["lms_exam_id"],
    isExam: json["is_exam"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "studentId": studentId,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "status": status,
    "lms_exam_id": lmsExamId,
    "is_exam": isExam,
    "created_by": createdBy,
  };
}
