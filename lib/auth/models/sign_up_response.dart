// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    this.status,
    this.message,
    this.data,
    this.error,
    this.errorDescription,
  });

  int? status;
  String? message;
  List<dynamic>? data;
  String? error;
  String? errorDescription;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
    error: json["error"],
    errorDescription: json["error_description"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    "error": error,
    "error_description": errorDescription,
  };
}
