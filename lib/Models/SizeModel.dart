// To parse this JSON data, do
//
//     final sizeModel = sizeModelFromJson(jsonString);

import 'dart:convert';

class SizeModel {
  SizeModel({
    this.response,
    this.message,
    this.data,
  });

  String response;
  String message;
  List<Datum> data;

  factory SizeModel.fromRawJson(String str) => SizeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
    response: json["response"],
    message: json["message"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.imgSize,
    this.totalcost,
  });

  int id;
  String imgSize;
  String totalcost;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    imgSize: json["ImgSize"],
    totalcost: json["totalcost"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ImgSize": imgSize,
    "totalcost": totalcost,
  };
}