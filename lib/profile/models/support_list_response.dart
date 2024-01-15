// To parse this JSON data, do
//
//     final supportListResponse = supportListResponseFromJson(jsonString);

import 'dart:convert';

SupportListResponse supportListResponseFromJson(String str) => SupportListResponse.fromJson(json.decode(str));

String supportListResponseToJson(SupportListResponse data) => json.encode(data.toJson());

class SupportListResponse {
  SupportListResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<SupportDatum>? data;

  factory SupportListResponse.fromJson(Map<String, dynamic> json) => SupportListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SupportDatum>.from(json["data"]!.map((x) => SupportDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SupportDatum {
  SupportDatum({
    this.id,
    this.title,
    this.content,
    this.authorName,
    this.authorEmail,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.statusId,
    this.priorityId,
    this.categoryId,
    this.assignedToUserId,
    this.categoryName,
  });

  int? id;
  String? title;
  String? content;
  String? authorName;
  String? authorEmail;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? statusId;
  int? priorityId;
  int? categoryId;
  int? assignedToUserId;
  String? categoryName;

  factory SupportDatum.fromJson(Map<String, dynamic> json) => SupportDatum(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    authorName: json["author_name"],
    authorEmail: json["author_email"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    statusId: json["status_id"],
    priorityId: json["priority_id"],
    categoryId: json["category_id"],
    assignedToUserId: json["assigned_to_user_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "author_name": authorName,
    "author_email": authorEmail,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "status_id": statusId,
    "priority_id": priorityId,
    "category_id": categoryId,
    "assigned_to_user_id": assignedToUserId,
    "category_name": categoryName,
  };
}
