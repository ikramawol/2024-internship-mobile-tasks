import 'package:ecommerce_clean/features/user/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class InitialState extends UserState {}

class SplashToSignInState extends UserState {}
class LoadingState extends UserState {}
class LoadedState extends UserState {
  final UserEntity user;

  const LoadedState({required this.user});

  @override
  List<Object> get props => [user];
}
class SignUpState extends UserState {}
class SignInState extends UserState {}
class SignOutState extends UserState {}

class SignedInState extends UserState {
  final String email;
  final String password;

  const SignedInState({required this.email, required this.password});  

  @override
  List<Object> get props => [email, password];
}

class SignedUpState extends UserState {
  final UserEntity user;

  const SignedUpState({required this.user});

  @override
  List<Object> get props => [user];  
}

class SignedOutState extends UserState {
  final String message;

  const SignedOutState({required this.message});
}

class UnAuthenticatedState extends UserState {
  final String message;

  const UnAuthenticatedState({required this.message});
}

class SuccessfulState extends UserState {
  final String message;

  const SuccessfulState({required this.message});
}

class authErrorState extends UserState {
  final String message;

  const authErrorState({required this.message});
}