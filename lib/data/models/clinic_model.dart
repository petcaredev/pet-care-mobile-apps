import 'dart:convert';

ClinicModel clinicModelFromJson(String str) =>
    ClinicModel.fromJson(json.decode(str));

String clinicModelToJson(ClinicModel data) => json.encode(data.toJson());

class ClinicModel {
  ClinicModel({
    required this.error,
    required this.message,
    required this.count,
    required this.data,
  });

  bool error;
  String message;
  int count;
  List<Data> data;

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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