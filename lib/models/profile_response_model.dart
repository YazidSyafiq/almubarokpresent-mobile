import 'dart:convert';

class ProfileResponseModel {
  bool? success;
  Data? data;
  String? message;

  ProfileResponseModel({
    this.success,
    this.data,
    this.message,
  });

  factory ProfileResponseModel.fromRawJson(String str) =>
      ProfileResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  int? id;
  String? nama;
  String? email;
  String? noTelp;
  String? kelas;
  String? lkm;
  String? imageUrl;
  String? fcmToken;

  Data({
    this.id,
    this.nama,
    this.email,
    this.noTelp,
    this.kelas,
    this.lkm,
    this.imageUrl,
    this.fcmToken,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        noTelp: json["no. telp"],
        kelas: json["kelas"],
        lkm: json["lkm"],
        imageUrl: json["image_url"],
        fcmToken: json["fcm_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "no. telp": noTelp,
        "kelas": kelas,
        "lkm": lkm,
        "image_url": imageUrl,
        "fcm_token": fcmToken,
      };
}
