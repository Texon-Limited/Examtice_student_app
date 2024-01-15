// To parse this JSON data, do
//
//     final examListResponse = examListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:examtice_teacher/home/models/student_list_response.dart';

AllStudentsListResponse examListResponseFromJson(String str) =>
    AllStudentsListResponse.fromJson(json.decode(str));

String examListResponseToJson(AllStudentsListResponse data) =>
    json.encode(data.toJson());

class AllStudentsListResponse {
  AllStudentsListResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory AllStudentsListResponse.fromJson(Map<String, dynamic> json) =>
      AllStudentsListResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.accepted,
    this.pendingConfirm,
    this.pendingRequest,
  });

  List<Student>? accepted;
  List<Student>? pendingConfirm;
  List<Student>? pendingRequest;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accepted: json["accepted"] == null
            ? []
            : List<Student>.from(
                json["accepted"]!.map((x) => Student.fromJson(x))),
        pendingConfirm: json["pending_confirm"] == null
            ? []
            : List<Student>.from(
                json["pending_confirm"]!.map((x) => Student.fromJson(x))),
        pendingRequest: json["pending_request"] == null
            ? []
            : List<Student>.from(
                json["pending_request"]!.map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accepted": accepted == null
            ? []
            : List<dynamic>.from(accepted!.map((x) => x.toJson())),
        "pending_confirm": pendingConfirm == null
            ? []
            : List<dynamic>.from(accepted!.map((x) => x.toJson())),
        "pending_request": pendingRequest == null
            ? []
            : List<dynamic>.from(accepted!.map((x) => x.toJson())),
      };
}
