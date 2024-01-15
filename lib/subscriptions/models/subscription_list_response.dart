// To parse this JSON data, do
//
//     final subscriptionListResponse = subscriptionListResponseFromJson(jsonString);

import 'dart:convert';

SubscriptionListResponse subscriptionListResponseFromJson(String str) => SubscriptionListResponse.fromJson(json.decode(str));

String subscriptionListResponseToJson(SubscriptionListResponse data) => json.encode(data.toJson());

class SubscriptionListResponse {
  int? status;
  String? message;
  List<SubscriptionDatum>? data;

  SubscriptionListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SubscriptionListResponse.fromJson(Map<String, dynamic> json) => SubscriptionListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SubscriptionDatum>.from(json["data"]!.map((x) => SubscriptionDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SubscriptionDatum {
  String? planName;
  String? planAmount;
  int? planInterval;
  String? customerId;
  DateTime? createdAt;
  DateTime? nextSubscriptionDate;
  int? id;
  int? isActive;

  SubscriptionDatum({
    this.planName,
    this.planAmount,
    this.planInterval,
    this.customerId,
    this.createdAt,
    this.nextSubscriptionDate,
    this.id,
    this.isActive,
  });

  factory SubscriptionDatum.fromJson(Map<String, dynamic> json) => SubscriptionDatum(
    planName: json["plan_name"],
    planAmount: json["plan_amount"],
    planInterval: json["plan_interval"],
    customerId: json["customer_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    nextSubscriptionDate: json["next_subscription_date"] == null ? null : DateTime.parse(json["next_subscription_date"]),
    id: json["id"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "plan_name": planName,
    "plan_amount": planAmount,
    "plan_interval": planInterval,
    "customer_id": customerId,
    "created_at": createdAt?.toIso8601String(),
    "next_subscription_date": nextSubscriptionDate?.toIso8601String(),
    "id": id,
    "is_active": isActive,
  };
}
