import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
  SignIn({
    required this.error,
    required this.message,
    required this.data,
  });

  bool error;
  String message;
  Data data;

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
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
    required this.email,
    required this.phone,
    required this.address,
    required this.roles,
    required this.accessToken,
  });

  int id;
  String email;
  String phone;
  String address;
  List<String> roles;
  String accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "address": address,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "accessToken": accessToken,
      };
}
