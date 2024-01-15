// To parse this JSON data, do
//
//     final notificationListResponse = notificationListResponseFromJson(jsonString);

import 'dart:convert';

NotificationListResponse notificationListResponseFromJson(String str) => NotificationListResponse.fromJson(json.decode(str));

String notificationListResponseToJson(NotificationListResponse data) => json.encode(data.toJson());

class NotificationListResponse {
  NotificationListResponse({
    this.status,
    this.message,
    this.data,
    this.notSeeTotal,
  });

  int? status;
  String? message;
  Data? data;
  int? notSeeTotal;

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) => NotificationListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    notSeeTotal: json["not_see_total"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
    "not_see_total": notSeeTotal,
  };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<NotificationDatum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<NotificationDatum>.from(json["data"]!.map((x) => NotificationDatum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class NotificationDatum {
  NotificationDatum({
    this.id,
    this.userId,
    this.noticeType,
    this.noticeText,
    this.noticeUrl,
    this.fromUserId,
    this.createdAt,
    this.updatedAt,
    this.isView,
    this.slug,
  });

  int? id;
  int? userId;
  String? noticeType;
  String? noticeText;
  dynamic noticeUrl;
  int? fromUserId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isView;
  String? slug;

  factory NotificationDatum.fromJson(Map<String, dynamic> json) => NotificationDatum(
    id: json["id"],
    userId: json["user_id"],
    noticeType: json["notice_type"],
    noticeText: json["notice_text"],
    noticeUrl: json["notice_url"],
    fromUserId: json["from_user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isView: json["is_view"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "notice_type": noticeType,
    "notice_text": noticeText,
    "notice_url": noticeUrl,
    "from_user_id": fromUserId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_view": isView,
    "slug": slug,
  };
}
