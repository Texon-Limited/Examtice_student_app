// To parse this JSON data, do
//
//     final teacherListResponse = teacherListResponseFromJson(jsonString);

import 'dart:convert';

TeacherListResponse teacherListResponseFromJson(String str) => TeacherListResponse.fromJson(json.decode(str));

String teacherListResponseToJson(TeacherListResponse data) => json.encode(data.toJson());

class TeacherListResponse {
  String? status;
  String? message;
  Data? data;

  TeacherListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory TeacherListResponse.fromJson(Map<String, dynamic> json) => TeacherListResponse(
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
  List<TeacherDatum>? accepted;
  List<TeacherDatum>? pendingConfirm;
  List<TeacherDatum>? pendingRequest;

  Data({
    this.accepted,
    this.pendingConfirm,
    this.pendingRequest,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accepted: json["accepted"] == null ? [] : List<TeacherDatum>.from(json["accepted"]!.map((x) => TeacherDatum.fromJson(x))),
    pendingConfirm: json["pending_confirm"] == null ? [] : List<TeacherDatum>.from(json["pending_confirm"]!.map((x) => x)),
    pendingRequest: json["pending_request"] == null ? [] : List<TeacherDatum>.from(json["pending_request"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "accepted": accepted == null ? [] : List<dynamic>.from(accepted!.map((x) => x.toJson())),
    "pending_confirm": pendingConfirm == null ? [] : List<dynamic>.from(pendingConfirm!.map((x) => x)),
    "pending_request": pendingRequest == null ? [] : List<dynamic>.from(pendingRequest!.map((x) => x)),
  };
}

class TeacherDatum {
  int? id;
  int? teacherId;
  int? studentId;
  int? requestFrom;
  int? isAccepted;
  dynamic confirmedAt;
  dynamic ignoredAt;
  String? firstName;
  String? lastName;
  String? email;
  dynamic image;
  dynamic emailVerifiedAt;
  dynamic googleId;
  dynamic facebookId;
  String? password;
  String? phoneno;
  dynamic rememberToken;
  String? verifyToken;
  int? affiliateRole;
  dynamic affiliatedBy;
  String? referId;
  String? amount;
  int? status;
  dynamic addedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic sessionToken;
  dynamic name;
  dynamic deletedAt;
  int? createFrom;

  TeacherDatum({
    this.id,
    this.teacherId,
    this.studentId,
    this.requestFrom,
    this.isAccepted,
    this.confirmedAt,
    this.ignoredAt,
    this.firstName,
    this.lastName,
    this.email,
    this.image,
    this.emailVerifiedAt,
    this.googleId,
    this.facebookId,
    this.password,
    this.phoneno,
    this.rememberToken,
    this.verifyToken,
    this.affiliateRole,
    this.affiliatedBy,
    this.referId,
    this.amount,
    this.status,
    this.addedBy,
    this.createdAt,
    this.updatedAt,
    this.sessionToken,
    this.name,
    this.deletedAt,
    this.createFrom,
  });

  factory TeacherDatum.fromJson(Map<String, dynamic> json) => TeacherDatum(
    id: json["id"],
    teacherId: json["teacher_id"],
    studentId: json["student_id"],
    requestFrom: json["request_from"],
    isAccepted: json["is_accepted"],
    confirmedAt: json["confirmed_at"],
    ignoredAt: json["ignored_at"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    googleId: json["google_id"],
    facebookId: json["facebook_id"],
    password: json["password"],
    phoneno: json["phoneno"],
    rememberToken: json["remember_token"],
    verifyToken: json["verify_token"],
    affiliateRole: json["affiliate_role"],
    affiliatedBy: json["affiliated_by"],
    referId: json["refer_id"],
    amount: json["amount"],
    status: json["status"],
    addedBy: json["added_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    sessionToken: json["session_token"],
    name: json["name"],
    deletedAt: json["deleted_at"],
    createFrom: json["create_from"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "teacher_id": teacherId,
    "student_id": studentId,
    "request_from": requestFrom,
    "is_accepted": isAccepted,
    "confirmed_at": confirmedAt,
    "ignored_at": ignoredAt,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "google_id": googleId,
    "facebook_id": facebookId,
    "password": password,
    "phoneno": phoneno,
    "remember_token": rememberToken,
    "verify_token": verifyToken,
    "affiliate_role": affiliateRole,
    "affiliated_by": affiliatedBy,
    "refer_id": referId,
    "amount": amount,
    "status": status,
    "added_by": addedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "session_token": sessionToken,
    "name": name,
    "deleted_at": deletedAt,
    "create_from": createFrom,
  };
}
