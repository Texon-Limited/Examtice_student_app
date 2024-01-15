// To parse this JSON data, do
//
//     final examListResponse = examListResponseFromJson(jsonString);

import 'dart:convert';

ExamListResponse examListResponseFromJson(String str) => ExamListResponse.fromJson(json.decode(str));

String examListResponseToJson(ExamListResponse data) => json.encode(data.toJson());

class ExamListResponse {
  ExamListResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<ExamDatum>? data;

  factory ExamListResponse.fromJson(Map<String, dynamic> json) => ExamListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ExamDatum>.from(json["data"]!.map((x) => ExamDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ExamDatum {

  ExamDatum({
    this.id,this.email,
    this.examName,
    this.examId,
    this.userId,
    this.courseId,
    this.subjectId,
    this.topicsId,
    this.type,
    this.totalQuestions,
    this.questionsId,
    this.examTime,
    this.year,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.coursesName,
    this.subjectsName,
    this.firstName,this.lastName
  });

  int? id;
  String? examName, email;
  String? firstName;
  String? lastName;
  String? examId;
  int? userId;
  int? courseId;
  int? subjectId;
  String? topicsId;
  int? type;
  int? totalQuestions;
  String? questionsId;
  dynamic examTime;
  String? year;
  int? status;
  DateTime? createdAt;
  dynamic updatedAt;
  String? coursesName;
  String? subjectsName;

  factory ExamDatum.fromJson(Map<String, dynamic> json) => ExamDatum(
    id: json["id"],
    email : json["email"],
    examName: json["exam_name"],
    firstName: json["first_name"],
    lastName: json["last_name"] ?? null,
    examId: json["exam_id"],
    userId: json["user_id"],
    courseId: json["course_id"],
    subjectId: json["subject_id"],
    topicsId: json["topics_id"],
    type: json["type"],
    totalQuestions: json["total_questions"],
    questionsId: json["questions_id"],
    examTime: json["exam_time"],
    year: json["year"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    coursesName: json["courseName"],
    subjectsName: json["subjectName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email":email,
    "exam_name": examName,
    "first_name": firstName,
    "last_name": lastName,
    "exam_id": examId,
    "user_id": userId,
    "course_id": courseId,
    "subject_id": subjectId,
    "topics_id": topicsId,
    "type": type,
    "total_questions": totalQuestions,
    "questions_id": questionsId,
    "exam_time": examTime,
    "year": year,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt,
    "courseName": coursesName,
    "subjectName": subjectsName,
  };
}
