// To parse this JSON data, do
//
//     final savedTestListResponse = savedTestListResponseFromJson(jsonString);

import 'dart:convert';

SavedTestListResponse savedTestListResponseFromJson(String str) => SavedTestListResponse.fromJson(json.decode(str));

String savedTestListResponseToJson(SavedTestListResponse data) => json.encode(data.toJson());

class SavedTestListResponse {
  int? status;
  String? message;
  List<SavedTestDatum>? data;

  SavedTestListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SavedTestListResponse.fromJson(Map<String, dynamic> json) => SavedTestListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SavedTestDatum>.from(json["data"]!.map((x) => SavedTestDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SavedTestDatum {
  String? testId;
  String? totalQuestions;
  DateTime? createdAt;
  String? timeSpent;
  String? courseName;
  String? subjectName;

  SavedTestDatum({
    this.testId,
    this.totalQuestions,
    this.createdAt,
    this.timeSpent,
    this.courseName,
    this.subjectName,
  });

  factory SavedTestDatum.fromJson(Map<String, dynamic> json) => SavedTestDatum(
    testId: json["test_id"],
    totalQuestions: json["total_questions"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    timeSpent: json["time_spent"],
    courseName: json["courseName"],
    subjectName: json["subjectName"],
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "total_questions": totalQuestions,
    "created_at": createdAt?.toIso8601String(),
    "time_spent": timeSpent,
    "courseName": courseName,
    "subjectName": subjectName,
  };
}
