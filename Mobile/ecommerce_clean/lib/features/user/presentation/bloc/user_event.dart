import 'package:ecommerce_clean/features/user/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SplashToSignInEvent extends UserEvent {}

class SignUpEvent extends UserEvent {
  final UserEntity newUser;

  const SignUpEvent({required this.newUser});

  @override
  List<Object> get props => [newUser];
}
class LoadingEvent extends UserEvent {}
class SignInEvent extends UserEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends UserEvent {
  final String message;

  const SignOutEvent({required this.message});
}

// class SuccessfulEvent extends UserEvent {
//   final String message;

//   const SuccessfulEvent({required this.message});
// }

// class ErrorEvent extends UserEvent {
//   final String message;

//   const ErrorEvent({required this.message});
// }
// class SubmitEvent
// class succesfully