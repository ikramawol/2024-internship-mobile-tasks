import 'package:ecommerce_clean/features/user/domain/entities/user.dart';

class UserModel extends UserEntity{
  const UserModel({
    String? id,
    String? name,
    required String email,
    required String password,
  }): super(
    id: id,
    name: name,
    email: email,
    password: password,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    email: json['email'] ?? '',
    password: json['password'] ?? '',
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
  };

  UserEntity toEntity() => UserEntity(
    id: id,
    name: name,
    email: email,
    password: password,
  );

  static List<UserEntity> toEntityList(List<UserModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}