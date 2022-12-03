import 'dart:convert';

FormErrorResponse formErrorResponseFromJson(String str) =>
    FormErrorResponse.fromJson(json.decode(str));

String formErrorResponseToJson(FormErrorResponse data) =>
    json.encode(data.toJson());

class FormErrorResponse {
  FormErrorResponse({
    required this.error,
    required this.errors,
  });

  bool error;
  List<Error> errors;

  factory FormErrorResponse.fromJson(Map<String, dynamic> json) =>
      FormErrorResponse(
        error: json["error"],
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Error {
  Error({
    required this.value,
    required this.msg,
    required this.param,
    required this.location,
  });

  String value;
  String msg;
  String param;
  String location;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        value: json["value"],
        msg: json["msg"],
        param: json["param"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "msg": msg,
        "param": param,
        "location": location,
      };
}
