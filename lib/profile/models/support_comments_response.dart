// To parse this JSON data, do
//
//     final supportCommentsResponse = supportCommentsResponseFromJson(jsonString);

import 'dart:convert';

SupportCommentsResponse supportCommentsResponseFromJson(String str) => SupportCommentsResponse.fromJson(json.decode(str));

String supportCommentsResponseToJson(SupportCommentsResponse data) => json.encode(data.toJson());

class SupportCommentsResponse {
  SupportCommentsResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<CommentDatum>? data;

  factory SupportCommentsResponse.fromJson(Map<String, dynamic> json) => SupportCommentsResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<CommentDatum>.from(json["data"]!.map((x) => CommentDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CommentDatum {
  CommentDatum({
    this.id,
    this.authorName,
    this.authorEmail,
    this.commentText,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.ticketId,
    this.userId,
  });

  int? id;
  String? authorName;
  String? authorEmail;
  String? commentText;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? ticketId;
  int? userId;

  factory CommentDatum.fromJson(Map<String, dynamic> json) => CommentDatum(
    id: json["id"],
    authorName: json["author_name"],
    authorEmail: json["author_email"],
    commentText: json["comment_text"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    ticketId: json["ticket_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author_name": authorName,
    "author_email": authorEmail,
    "comment_text": commentText,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "ticket_id": ticketId,
    "user_id": userId,
  };
}
