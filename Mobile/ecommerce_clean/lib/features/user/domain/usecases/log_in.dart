import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
// import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/user/domain/entities/user.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';

class SignIn{
  final UserRepository userRepository;
  SignIn(this.userRepository);

  Future<Either<Failure, String>> excecute({required String email, required String password}){
    // final user = UserEntity(email: email, password: password);
    return userRepository.logIn(email, password);
  }
}