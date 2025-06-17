import 'dart:convert';

class SetupAttendanceResponseModel {
  bool? success;
  Setup? data;
  String? message;

  SetupAttendanceResponseModel({
    this.success,
    this.data,
    this.message,
  });

  factory SetupAttendanceResponseModel.fromRawJson(String str) =>
      SetupAttendanceResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SetupAttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      SetupAttendanceResponseModel(
        success: json["success"],
        data: json["data"] == null ? null : Setup.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Setup {
  double? latitude;
  double? longitude;
  int? radius;
  String? faceEmbedding;
  bool? isBanned;
  bool? leaveApproved;

  Setup({
    this.latitude,
    this.longitude,
    this.radius,
    this.faceEmbedding,
    this.isBanned,
    this.leaveApproved,
  });

  factory Setup.fromRawJson(String str) => Setup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Setup.fromJson(Map<String, dynamic> json) => Setup(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        radius: json["radius"],
        faceEmbedding: json["face_embedding"],
        isBanned: json["is_banned"],
        leaveApproved: json["leave_approved"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "radius": radius,
        "face_embedding": faceEmbedding,
        "is_banned": isBanned,
        "leave_approved": leaveApproved,
      };
}
