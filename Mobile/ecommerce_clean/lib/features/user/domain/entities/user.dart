import 'package:ecommerce_clean/features/user/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{

  const UserEntity({
    this.id,
    this.name,
    required this.email,
    required this.password,
  });

  final String? id;
  final String? name;
  final String email;
  final String password;

  UserModel toModel(){
    return UserModel(
      id: id ?? '',
      name: name ?? '',
      email: email,
      password: password,
    );
  }
  @override
  List<Object?> get props => [
    id, 
    name,
    email,
    password,
  ];

  // static Future<UserEntity?> fromJson(String user) {}
}