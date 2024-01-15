// To parse this JSON data, do
//
//     final courseListResponse = courseListResponseFromJson(jsonString);

import 'dart:convert';

CourseListResponse courseListResponseFromJson(String str) => CourseListResponse.fromJson(json.decode(str));

String courseListResponseToJson(CourseListResponse data) => json.encode(data.toJson());

class CourseListResponse {
  CourseListResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<CourseDatum>? data;

  factory CourseListResponse.fromJson(Map<String, dynamic> json) => CourseListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<CourseDatum>.from(json["data"]!.map((x) => CourseDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CourseDatum {
  CourseDatum({
    this.id,
    this.name,
    this.image,
    this.description,
    this.priceNgn,
    this.priceUsd,
    this.priceEur,
    this.mcq,
    this.theory,
    this.practical,
  });

  int? id;
  String? name;
  String? image;
  String? description;
  String? priceNgn;
  String? priceUsd;
  String? priceEur;
  int? mcq;
  int? theory;
  int? practical;

  factory CourseDatum.fromJson(Map<String, dynamic> json) => CourseDatum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    priceNgn: json["price_ngn"],
    priceUsd: json["price_usd"],
    priceEur: json["price_eur"],
    mcq: json["mcq"],
    theory: json["theory"],
    practical: json["practical"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
    "price_ngn": priceNgn,
    "price_usd": priceUsd,
    "price_eur": priceEur,
    "mcq": mcq,
    "theory": theory,
    "practical": practical,
  };
}
