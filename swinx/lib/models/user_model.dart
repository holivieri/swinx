import 'dart:convert';

UserModel loginResponseModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String loginResponseModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.roles,
    required this.userName,
    required this.token,
    required this.expiration,
    required this.photoUrl,
  });

  final String userId;
  final List<String> roles;
  final String userName;
  final String token;
  final DateTime expiration;
  final dynamic photoUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json['userId'] == null ? null : json['userId'],
        roles: List<String>.from(json['roles'].map((x) => x)),
        userName: json['userName'] == null ? null : json['userName'],
        token: json['token'] == null ? null : json['token'],
        expiration: DateTime.parse(json['expiration']),
        photoUrl: json['photoUrl'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'roles': List<dynamic>.from(roles.map((x) => x)),
        'userName': userName,
        'token': token,
        'expiration': expiration.toIso8601String(),
        'photoUrl': photoUrl,
      };
}
