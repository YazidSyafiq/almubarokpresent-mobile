import 'dart:convert';

class LeaveResponseModel {
  bool? success;
  List<Leave>? data;
  String? message;

  LeaveResponseModel({
    this.success,
    this.data,
    this.message,
  });

  factory LeaveResponseModel.fromRawJson(String str) =>
      LeaveResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LeaveResponseModel.fromJson(Map<String, dynamic> json) =>
      LeaveResponseModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Leave>.from(json["data"]!.map((x) => Leave.fromJson(x))),
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

class Leave {
  int? id;
  int? userId;
  DateTime? date;
  String? reason;
  String? status;
  dynamic note;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Leave({
    this.id,
    this.userId,
    this.date,
    this.reason,
    this.status,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Leave.fromRawJson(String str) => Leave.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Leave.fromJson(Map<String, dynamic> json) => Leave(
        id: json["id"],
        userId: json["user_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        reason: json["reason"],
        status: json["status"],
        note: json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "reason": reason,
        "status": status,
        "note": note,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
