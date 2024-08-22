import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/user/domain/entities/user.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';

class SignUp{
  final UserRepository userRepository;
  SignUp(this.userRepository);

  Future<Either<Failure, UserEntity>> excecute(UserEntity user){
    return userRepository.signUp(user);
  }
}