import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';

class SignOut{
  final UserRepository userRepository;
  SignOut(this.userRepository);

  Future<Either<Failure, void>> excecute(){
    return userRepository.logOut();
  }
}