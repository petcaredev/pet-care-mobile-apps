import 'dart:convert';

AddReservationResponse addReservationResponseFromJson(String str) =>
    AddReservationResponse.fromJson(json.decode(str));

String addReservationResponseToJson(AddReservationResponse data) =>
    json.encode(data.toJson());

class AddReservationResponse {
  AddReservationResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  bool error;
  String message;
  Data data;

  factory AddReservationResponse.fromJson(Map<String, dynamic> json) =>
      AddReservationResponse(
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
    required this.date,
    required this.petName,
    required this.petType,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.clinic,
    required this.services,
  });

  int id;
  DateTime date;
  String petName;
  String petType;
  dynamic description;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;
  Clinic user;
  Clinic clinic;
  List<Service> services;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        petName: json["petName"],
        petType: json["petType"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        user: Clinic.fromJson(json["user"]),
        clinic: Clinic.fromJson(json["clinic"]),
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "petName": petName,
        "petType": petType,
        "description": description,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "clinic": clinic.toJson(),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class Clinic {
  Clinic({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
  });

  String name;
  String address;
  String phone;
  String email;

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phone": phone,
        "email": email == null ? null : email,
      };
}

class Service {
  Service({
    required this.id,
    required this.name,
    required this.price,
  });

  int id;
  String name;
  int price;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}
