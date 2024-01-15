// To parse this JSON data, do
//
//     final subjectListResponse = subjectListResponseFromJson(jsonString);

import 'dart:convert';

SubjectListResponse subjectListResponseFromJson(String str) => SubjectListResponse.fromJson(json.decode(str));

String subjectListResponseToJson(SubjectListResponse data) => json.encode(data.toJson());

class SubjectListResponse {
  SubjectListResponse({
    this.status,
    this.message,
    this.data,
    this.mcq,
    this.theory,
    this.practical,
    this.usersubscription,
  });

  String? status;
  String? message;
  List<SubjectDatum>? data;
  int? mcq;
  dynamic theory;
  dynamic practical;
  int? usersubscription;

  factory SubjectListResponse.fromJson(Map<String, dynamic> json) => SubjectListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SubjectDatum>.from(json["data"]!.map((x) => SubjectDatum.fromJson(x))),
    mcq: json["mcq"],
    theory: json["theory"],
    practical: json["practical"],
    usersubscription: json["usersubscription"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "mcq": mcq,
    "theory": theory,
    "practical": practical,
    "usersubscription": usersubscription,
  };
}

class SubjectDatum {
  SubjectDatum({
    this.id,
    this.name,
    this.numberOfQuestion,
  });

  int? id;
  String? name;
  int? numberOfQuestion;

  factory SubjectDatum.fromJson(Map<String, dynamic> json) => SubjectDatum(
    id: json["id"],
    name: json["name"],
    numberOfQuestion: json["number_of_question"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number_of_question": numberOfQuestion,
  };
}


class UserSelectedYearListModel {
  String? status;
  String? message;
  List<UserSelectedYearData>? data;
  int? usersubscription;

  UserSelectedYearListModel(
      {this.status, this.message, this.data, this.usersubscription});

  UserSelectedYearListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserSelectedYearData>[];
      json['data'].forEach((v) {
        data!.add(UserSelectedYearData.fromJson(v));
      });
    }
    usersubscription = json['usersubscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['usersubscription'] = usersubscription;
    return data;
  }
}

class UserSelectedYearData {
  String? value;
  String? label;

  UserSelectedYearData({this.value, this.label});

  UserSelectedYearData.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}
