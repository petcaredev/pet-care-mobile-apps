import 'dart:convert';

UpdateUser updateUserFromJson(String str) =>
    UpdateUser.fromJson(json.decode(str));

String updateUserToJson(UpdateUser data) => json.encode(data.toJson());

class UpdateUser {
  UpdateUser({
    required this.error,
    required this.message,
  });

  bool error;
  String message;

  factory UpdateUser.fromJson(Map<String, dynamic> json) => UpdateUser(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
