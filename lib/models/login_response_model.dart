import 'dart:convert';

class LoginResponseModel {
  bool? success;
  Data? data;
  String? message;

  LoginResponseModel({
    this.success,
    this.data,
    this.message,
  });

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
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
  String? imageUrl;
  dynamic faceEmbedding;
  String? token;
  String? fcmToken;

  Data({
    this.id,
    this.nama,
    this.email,
    this.noTelp,
    this.imageUrl,
    this.faceEmbedding,
    this.token,
    this.fcmToken,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        noTelp: json["no. telp"],
        imageUrl: json["image_url"],
        faceEmbedding: json["face_embedding"],
        token: json["token"],
        fcmToken: json["fcm_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "no. telp": noTelp,
        "image_url": imageUrl,
        "face_embedding": faceEmbedding,
        "token": token,
        "fcm_token": fcmToken,
      };
}
