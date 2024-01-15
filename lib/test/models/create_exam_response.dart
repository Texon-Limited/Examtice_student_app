// To parse this JSON data, do
//
//     final createExamResponse = createExamResponseFromJson(jsonString);

import 'dart:convert';

CreateExamResponse createExamResponseFromJson(String str) => CreateExamResponse.fromJson(json.decode(str));

String createExamResponseToJson(CreateExamResponse data) => json.encode(data.toJson());

class CreateExamResponse {
  CreateExamResponse({
    this.status,
    this.message,
    this.data,
    this.lmsexamfor,
  });

  int? status;
  String? message;
  LmsExamData? data;
  Lmsexamfor? lmsexamfor;

  factory CreateExamResponse.fromJson(Map<String, dynamic> json) => CreateExamResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : LmsExamData.fromJson(json["data"]),
    lmsexamfor: json["lmsexamfor"] == null ? null : Lmsexamfor.fromJson(json["lmsexamfor"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
    "lmsexamfor": lmsexamfor?.toJson(),
  };
}

class LmsExamData {
  LmsExamData({
    this.examId,
    this.examName,
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
  });

  String? examId;
  String? examName;
  int? userId;
  int? courseId;
  String? subjectId;
  String? topicsId;
  int? type;
  int? totalQuestions;
  String? questionsId;
  dynamic examTime;
  String? year;
  int? status;
  DateTime? createdAt;
  dynamic updatedAt;

  factory LmsExamData.fromJson(Map<String, dynamic> json) => LmsExamData(
    examId: json["exam_id"],
    examName: json["exam_name"],
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
  );

  Map<String, dynamic> toJson() => {
    "exam_id": examId,
    "exam_name": examName,
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
  };
}

class Lmsexamfor {
  Lmsexamfor({
    this.lmsExamId,
    this.createdBy,
    this.createdFor,
    this.isExam,
    this.timeSpent,
    this.examStartedAt,
    this.status,
    this.id,
  });

  int? lmsExamId;
  int? createdBy;
  int? createdFor;
  int? isExam;
  int? timeSpent;
  int? examStartedAt;
  int? status;
  int? id;

  factory Lmsexamfor.fromJson(Map<String, dynamic> json) => Lmsexamfor(
    lmsExamId: json["lms_exam_id"],
    createdBy: json["created_by"],
    createdFor: json["created_for"],
    isExam: json["is_exam"],
    timeSpent: json["time_spent"],
    examStartedAt: json["exam_started_at"],
    status: json["status"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "lms_exam_id": lmsExamId,
    "created_by": createdBy,
    "created_for": createdFor,
    "is_exam": isExam,
    "time_spent": timeSpent,
    "exam_started_at": examStartedAt,
    "status": status,
    "id": id,
  };
}
