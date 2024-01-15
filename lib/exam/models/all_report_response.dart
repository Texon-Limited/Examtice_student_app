// To parse this JSON data, do
//
//     final allReportResponse = allReportResponseFromJson(jsonString);

import 'dart:convert';

AllReportResponse allReportResponseFromJson(String str) => AllReportResponse.fromJson(json.decode(str));

String allReportResponseToJson(AllReportResponse data) => json.encode(data.toJson());

class AllReportResponse {
  int? status;
  String? message;
  ReportData? data;

  AllReportResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AllReportResponse.fromJson(Map<String, dynamic> json) => AllReportResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ReportData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class ReportData {
  List<UserReport>? userReport;
  int? totalQues;
  String? totalTime;

  ReportData({
    this.userReport,
    this.totalQues,
    this.totalTime,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) => ReportData(
    userReport: json["userReport"] == null ? [] : List<UserReport>.from(json["userReport"]!.map((x) => UserReport.fromJson(x))),
    totalQues: json["totalQues"],
    totalTime: json["totalTime"],
  );

  Map<String, dynamic> toJson() => {
    "userReport": userReport == null ? [] : List<dynamic>.from(userReport!.map((x) => x.toJson())),
    "totalQues": totalQues,
    "totalTime": totalTime,
  };
}

class UserReport {
  int? id;
  String? testId;
  String? totalQuestions;
  DateTime? createdAt;
  String? timeSpent;
  int? totaCorrectOption;

  UserReport({
    this.id,
    this.testId,
    this.totalQuestions,
    this.createdAt,
    this.timeSpent,
    this.totaCorrectOption,
  });

  factory UserReport.fromJson(Map<String, dynamic> json) => UserReport(
    id: json["id"],
    testId: json["test_id"],
    totalQuestions: json["total_questions"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    timeSpent: json["time_spent"],
    totaCorrectOption: json["totaCorrectOption"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "test_id": testId,
    "total_questions": totalQuestions,
    "created_at": createdAt?.toIso8601String(),
    "time_spent": timeSpent,
    "totaCorrectOption": totaCorrectOption,
  };
}
