// To parse this JSON data, do
//
//     final secret = secretFromJson(jsonString);

import 'dart:convert';

Secret secretFromJson(String str) => Secret.fromJson(json.decode(str));

String secretToJson(Secret data) => json.encode(data.toJson());

class Secret {
  Secret({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  bool status;
  String message;
  Data data;
  List<dynamic> meta;
  List<dynamic> pagination;

  factory Secret.fromJson(Map<String, dynamic> json) => Secret(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        pagination: List<dynamic>.from(json["pagination"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "pagination": List<dynamic>.from(pagination.map((x) => x)),
      };
}

class Data {
  Data({
    required this.secret,
  });

  String secret;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        secret: json["secret"],
      );

  Map<String, dynamic> toJson() => {
        "secret": secret,
      };
}
