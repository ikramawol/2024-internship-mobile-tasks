import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_state.dart';
import 'package:ecommerce_clean/features/user/data/repository/user_repository_impl.dart';
import 'package:ecommerce_clean/features/user/domain/entities/user.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_bloc.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_event.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_state.dart';
import 'package:ecommerce_clean/features/user/presentation/pages/home.dart';
import 'package:ecommerce_clean/features/user/presentation/pages/sign_up.dart';
// import 'package:ecommerce_clean/features/user/presentation/bloc/user_bloc.dart';
// import 'package:ecommerce_clean/features/user/presentation/bloc/user_event.dart';
// import 'package:ecommerce_clean/features/user/presentation/pages/sign_in.dart';
import 'package:ecommerce_clean/features/user/presentation/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  final String? email;
  final String? password;

  const SignIn({
    super.key,
    this.email,
    this.password,
  });

  @override
  State<SignIn> createState() => _SignUpState();
}

class _SignUpState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email ?? '';
    _passwordController.text = widget.password ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(GetIt.instance<UserRepository>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        border: Border.all(
                            color: const Color(0xFF3F51F3),
                            width: 2.0), // Border
                        // borderRadius: BorderRadius.circular(31.0),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF3F51F3).withOpacity(0.3),
                            // spreadRadius: 3,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                        // Rounded corners
                        ),
                    padding: const EdgeInsets.all(
                        5.0), // Added padding to make the image look better inside the container
                    child:
                        Image.asset('images/Ecom.png', width: 90, height: 40),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Sign into your account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 30),
                        LabelAndTextField(
                          label: 'Email',
                          controller: _emailController,
                          maxLines: 1,
                          hintText: 'ex: jon.smith@email.com',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        LabelAndTextField(
                          label: 'Password',
                          controller: _passwordController,
                          maxLines: 1,
                          hintText: '*******',
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        BlocConsumer<UserBloc, UserState>(
                          listener: (context, state) {
                            if (state is SignInState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sign in successful'),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePage(),
                                ),
                              );
                            } else if (state is authErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is SignUpState) {
                              return const CircularProgressIndicator();
                            }
                            return ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<UserBloc>().add(
                                        SignInEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                } Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePage(),
                                ),
                              );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(340, 48),
                                backgroundColor: const Color(0xFF3E50F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t have an account?',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color:
                                    Color(0xFF888888), // Black with 50% opacity
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  ),
                                );
                              },
                              child: const Text(
                                ' SIGN UP',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF3E50F3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
