// To parse this JSON data, do
//
//     final eshopResponseList = eshopResponseListFromJson(jsonString);

import 'dart:convert';

EshopResponseList eshopResponseListFromJson(String str) => EshopResponseList.fromJson(json.decode(str));

String eshopResponseListToJson(EshopResponseList data) => json.encode(data.toJson());

class EshopResponseList {
  EshopResponseList({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<EshopDatum>? data;

  factory EshopResponseList.fromJson(Map<String, dynamic> json) => EshopResponseList(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<EshopDatum>.from(json["data"]!.map((x) => EshopDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class EshopDatum {
  EshopDatum({
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

  factory EshopDatum.fromJson(Map<String, dynamic> json) => EshopDatum(
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
