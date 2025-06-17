import 'dart:convert';

class AttendanceTodayResponseModel {
  bool? success;
  AttendanceToday? data;
  String? message;

  AttendanceTodayResponseModel({
    this.success,
    this.data,
    this.message,
  });

  factory AttendanceTodayResponseModel.fromRawJson(String str) =>
      AttendanceTodayResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttendanceTodayResponseModel.fromJson(Map<String, dynamic> json) =>
      AttendanceTodayResponseModel(
        success: json["success"],
        data: json["data"] == null
            ? null
            : AttendanceToday.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class AttendanceToday {
  String? checkInTime;
  String? checkOutTime;
  String? status;
  bool? isBanned;
  bool? permissionCheckIn;
  bool? permissionCheckOut;

  AttendanceToday({
    this.checkInTime,
    this.checkOutTime,
    this.status,
    this.isBanned,
    this.permissionCheckIn,
    this.permissionCheckOut,
  });

  factory AttendanceToday.fromRawJson(String str) =>
      AttendanceToday.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttendanceToday.fromJson(Map<String, dynamic> json) =>
      AttendanceToday(
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        status: json["status"],
        isBanned: json["is_banned"],
        permissionCheckIn: json["permission_check_in"],
        permissionCheckOut: json["permission_check_out"],
      );

  Map<String, dynamic> toJson() => {
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "status": status,
        "is_banned": isBanned,
        "permission_check_in": permissionCheckIn,
        "permission_check_out": permissionCheckOut,
      };
}
