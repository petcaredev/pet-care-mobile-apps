import 'dart:convert';

ClinicDetail clinicDetailFromJson(String str) =>
    ClinicDetail.fromJson(json.decode(str));

String clinicDetailToJson(ClinicDetail data) => json.encode(data.toJson());

class ClinicDetail {
  ClinicDetail({
    required this.error,
    required this.message,
    required this.data,
  });

  bool error;
  String message;
  Data data;

  factory ClinicDetail.fromJson(Map<String, dynamic> json) => ClinicDetail(
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
