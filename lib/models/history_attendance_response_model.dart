import 'dart:convert';

class HistoryAttendanceResponseModel {
  bool? success;
  List<AttendanceMonth>? data;
  String? message;

  HistoryAttendanceResponseModel({
    this.success,
    this.data,
    this.message,
  });

  factory HistoryAttendanceResponseModel.fromRawJson(String str) =>
      HistoryAttendanceResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryAttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      HistoryAttendanceResponseModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<AttendanceMonth>.from(
                json["data"]!.map((x) => AttendanceMonth.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class AttendanceMonth {
  DateTime? date;
  String? checkInTime;
  String? checkOutTime;
  String? status;

  AttendanceMonth({
    this.date,
    this.checkInTime,
    this.checkOutTime,
    this.status,
  });

  factory AttendanceMonth.fromRawJson(String str) =>
      AttendanceMonth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttendanceMonth.fromJson(Map<String, dynamic> json) =>
      AttendanceMonth(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "status": status,
      };
}
