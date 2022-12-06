import 'dart:convert';

ClinicDetailModel clinicDetailModelFromJson(String str) =>
    ClinicDetailModel.fromJson(json.decode(str));

String clinicDetailModelToJson(ClinicDetailModel data) =>
    json.encode(data.toJson());

class ClinicDetailModel {
  ClinicDetailModel({
    required this.error,
    required this.message,
    required this.data,
  });

  bool error;
  String message;
  Data data;

  factory ClinicDetailModel.fromJson(Map<String, dynamic> json) =>
      ClinicDetailModel(
        error: json["error"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": data.toJson(),
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
    required this.services,
  });

  int id;
  String name;
  String address;
  String posterPath;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  List<Service> services;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        posterPath: json["posterPath"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "posterPath": posterPath,
        "phone": phone,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class Service {
  Service({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  int id;
  String name;
  String price;
  String description;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
      };
}
