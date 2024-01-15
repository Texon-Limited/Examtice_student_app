// To parse this JSON data, do
//
//     final subscriptionDetailsResponse = subscriptionDetailsResponseFromJson(jsonString);

import 'dart:convert';

SubscriptionDetailsResponse subscriptionDetailsResponseFromJson(String str) => SubscriptionDetailsResponse.fromJson(json.decode(str));

String subscriptionDetailsResponseToJson(SubscriptionDetailsResponse data) => json.encode(data.toJson());

class SubscriptionDetailsResponse {
  int? status;
  String? message;
  SubscriptionDetailsData? data;

  SubscriptionDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SubscriptionDetailsResponse.fromJson(Map<String, dynamic> json) => SubscriptionDetailsResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : SubscriptionDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class SubscriptionDetailsData {
  String? planName;
  String? planAmount;
  int? courseId;
  int? planInterval;
  String? subscriptionCode;
  DateTime? createdAt;
  int? id;
  DateTime? subscribedOn;
  DateTime? nextSubscriptionDate;
  String? emailToken;
  int? isActive;
  Course? course;
  List<Subject>? subjects;

  SubscriptionDetailsData({
    this.planName,
    this.planAmount,
    this.courseId,
    this.planInterval,
    this.subscriptionCode,
    this.createdAt,
    this.id,
    this.subscribedOn,
    this.nextSubscriptionDate,
    this.emailToken,
    this.isActive,
    this.course,
    this.subjects,
  });

  factory SubscriptionDetailsData.fromJson(Map<String, dynamic> json) => SubscriptionDetailsData(
    planName: json["plan_name"],
    planAmount: json["plan_amount"],
    courseId: json["course_id"],
    planInterval: json["plan_interval"],
    subscriptionCode: json["subscription_code"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    subscribedOn: json["subscribed_on"] == null ? null : DateTime.parse(json["subscribed_on"]),
    nextSubscriptionDate: json["next_subscription_date"] == null ? null : DateTime.parse(json["next_subscription_date"]),
    emailToken: json["email_token"],
    isActive: json["is_active"],
    course: json["course"] == null ? null : Course.fromJson(json["course"]),
    subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plan_name": planName,
    "plan_amount": planAmount,
    "course_id": courseId,
    "plan_interval": planInterval,
    "subscription_code": subscriptionCode,
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "subscribed_on": subscribedOn?.toIso8601String(),
    "next_subscription_date": nextSubscriptionDate?.toIso8601String(),
    "email_token": emailToken,
    "is_active": isActive,
    "course": course?.toJson(),
    "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
  };
}

class Course {
  int? id;
  String? name;
  String? image;
  String? description;
  String? priceNgn;
  String? priceUsd;
  String? priceEur;
  int? mcq;
  dynamic theory;
  dynamic practical;

  Course({
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

  factory Course.fromJson(Map<String, dynamic> json) => Course(
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

class Subject {
  int? id;
  String? name;
  int? numberOfQuestion;
  List<Topic>? topics;

  Subject({
    this.id,
    this.name,
    this.numberOfQuestion,
    this.topics,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    name: json["name"],
    numberOfQuestion: json["number_of_question"],
    topics: json["topics"] == null ? [] : List<Topic>.from(json["topics"]!.map((x) => Topic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number_of_question": numberOfQuestion,
    "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x.toJson())),
  };
}

class Topic {
  int? id;
  String? name;

  Topic({
    this.id,
    this.name,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
