// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  LoginData? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class LoginData {
  LoginData({
    this.token,
    this.user,
  });

  Token? token;
  User? user;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    token: json["token"] == null ? null : Token.fromJson(json["token"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token?.toJson(),
    "user": user?.toJson(),
  };
}

class Token {
  Token({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
