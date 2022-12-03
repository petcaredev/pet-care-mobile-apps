import 'dart:convert';

ClinicList clinicListFromJson(String str) =>
    ClinicList.fromJson(json.decode(str));

String clinicListToJson(ClinicList data) => json.encode(data.toJson());

class ClinicList {
  ClinicList({
    required this.error,
    required this.message,
    required this.data,
  });

  bool error;
  String message;
  List<Datum> data;

  factory ClinicList.fromJson(Map<String, dynamic> json) => ClinicList(
        error: json["error"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.address,
    required this.posterPath,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String address;
  String posterPath;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        posterPath: json["posterPath"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "posterPath": posterPath,
        "phone": phone,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
