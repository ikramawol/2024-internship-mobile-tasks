import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/cache_exception.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/user/data/data_source/user_local_data_source.dart';
import 'package:ecommerce_clean/features/user/data/data_source/user_remote_data_source.dart';
// import 'package:ecommerce_clean/features/user/data/models/user_model.dart';
import 'package:ecommerce_clean/features/user/domain/entities/user.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class UserRepositoryImpl extends UserRepository{
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;
  final InternetConnectionChecker internetConnectionChecker;

  UserRepositoryImpl({
    required this.userLocalDataSource,
    required this.userRemoteDataSource,
    required this.internetConnectionChecker
  });

  @override
  Future<Either<Failure, void>> logOut() async {
    try{
      await userLocalDataSource.deleteToken();
      await userRemoteDataSource.logOut();
      return const Right(null);
    } catch(e){
      return Left(Failure('Error during log out: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> logIn(String email, String password) async {
    if (await internetConnectionChecker.hasConnection){
      try{
        final accessToken = await userRemoteDataSource.logIn(email, password);
        await userLocalDataSource.saveToken(accessToken);

        return Right(accessToken);

      } catch(e){
        return Left(Failure('Error during log in: $e'));
      }
    } else {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(UserEntity user) async {
   
    if (await internetConnectionChecker.hasConnection) {
      try {
        final userModel = await userRemoteDataSource.signUp(user.toModel());

        return Right(userModel);
      } catch (e) {
        return const Left(Failure('An unexpected error occurred'));
      }
    } else {
      return const Left(Failure('No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getMe() async {
    try {
      final token = await userLocalDataSource.getToken();
      if (token == null) {
        return const Left(Failure('No token found'));
      }
      final userModel = await userRemoteDataSource.getMe();
      return Right(userModel);
    } on CacheException {
      return const Left(Failure('Error getting token'));
    }
  }
}

