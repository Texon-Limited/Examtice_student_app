// To parse this JSON data, do
//
//     final studentListResponse = studentListResponseFromJson(jsonString);

import 'dart:convert';

StudentListResponse studentListResponseFromJson(String str) => StudentListResponse.fromJson(json.decode(str));

String studentListResponseToJson(StudentListResponse data) => json.encode(data.toJson());

class StudentListResponse {
  StudentListResponse({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  List<Student>? data;

  factory StudentListResponse.fromJson(Map<String, dynamic> json) => StudentListResponse(
    message: json["message"],
    status: json["status"],
    data: json["data"] == null ? [] : List<Student>.from(json["data"]!.map((x) => Student.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Student {
  Student({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.image,
    this.emailVerifiedAt,
    this.googleId,
    this.facebookId,
    this.phoneno,
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

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  dynamic emailVerifiedAt;
  String? googleId;
  dynamic facebookId;
  String? phoneno;
  String? verifyToken;
  dynamic affiliateRole;
  dynamic affiliatedBy;
  String? referId;
  String? amount;
  int? status;
  dynamic addedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic sessionToken;
  String? name;
  dynamic deletedAt;
  int? createFrom;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    googleId: json["google_id"],
    facebookId: json["facebook_id"],
    phoneno: json["phoneno"],
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
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "google_id": googleId,
    "facebook_id": facebookId,
    "phoneno": phoneno,
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
