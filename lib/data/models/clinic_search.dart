import 'dart:convert';

ClinicSearch clinicSearchFromJson(String str) =>
    ClinicSearch.fromJson(json.decode(str));

String clinicSearchToJson(ClinicSearch data) => json.encode(data.toJson());

class ClinicSearch {
  ClinicSearch({
    required this.error,
    required this.message,
    required this.count,
    required this.data,
  });

  bool error;
  String message;
  int count;
  List<Datum> data;

  factory ClinicSearch.fromJson(Map<String, dynamic> json) => ClinicSearch(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
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
    required this.distance,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String address;
  String posterPath;
  String phone;
  String distance;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        posterPath: json["posterPath"],
        phone: json["phone"],
        distance: json["distance"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "posterPath": posterPath,
        "phone": phone,
        "distance": distance,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
