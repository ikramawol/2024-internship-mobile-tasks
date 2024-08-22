// import 'package:ecommerce_clean/features/User/presentation/bloc/user_state.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_event.dart';
// import 'package:ecommerce_clean/features/user/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_state.dart';

class UserBloc extends Bloc<UserEvent,UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(InitialState()) {
    on<SplashToSignInEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 5));
      emit(SplashToSignInState());
    });

    on<SignUpEvent>((event, emit) async {
      emit(SignUpState());
      final user = await userRepository.signUp(event.newUser);
      print(user);
      user.fold(
        (failure) => emit(const authErrorState(message: 'Failed to sign up')),
        (user) =>
            emit(SignedUpState(user: user)),
      );
    });

    on<SignInEvent>((event, emit) async {
      // emit(SignInState());
      final user = await userRepository.logIn(event.email, event.password);
      print(user);
      user.fold(
        (failure) => emit(const authErrorState(message: 'Failed to sign in')),
        (user) => emit(SignedInState(email: event.email, password: event.password)),
      );
    });

    on<SignOutEvent>((event, emit) async {
      emit(SignOutState());
      final message = await userRepository.logOut();
      message.fold(
        (failure) => emit(const authErrorState(message: 'Failed to sign out')),
        (message) => emit(const SignedOutState(message: 'Signed out')),
      );
    });
  }
}
