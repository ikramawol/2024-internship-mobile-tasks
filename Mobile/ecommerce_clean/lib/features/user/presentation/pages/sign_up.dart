// import 'package:ecommerce_clean/features/User/presentation/bloc/user_state.dart';
import 'package:ecommerce_clean/features/user/domain/entities/user.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_bloc.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_event.dart';
// import 'package:ecommerce_clean/features/user/presentation/bloc/user_state.dart';
// import 'package:ecommerce_clean/features/user/presentation/bloc/user_bloc.dart';
// import 'package:ecommerce_clean/features/user/presentation/bloc/user_event.dart';
import 'package:ecommerce_clean/features/user/presentation/pages/sign_in.dart';
import 'package:ecommerce_clean/features/user/presentation/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/user_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;

  const SignUp({
    super.key,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name ?? '';
    _emailController.text = widget.email ?? '';
    _passwordController.text = widget.password ?? '';
    _confirmPasswordController.text = widget.confirmPassword ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 33, 79, 243),
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  border: Border.all(
                      color: const Color(0xFF3F51F3), width: 1.0), // Border
                  // borderRadius: BorderRadius.circular(31.0),
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF3F51F3).withOpacity(0.3),
                      // spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  // Rounded corners
                  ),
              padding: const EdgeInsets.all(2.00),
              child: Image.asset('images/Ecom.png', width: 50, height: 28),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(GetIt.instance<UserRepository>()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 20),
                  LabelAndTextField(
                    label: 'Name',
                    controller: _nameController,
                    maxLines: 1,
                    hintText: 'ex: jon smith',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  LabelAndTextField(
                    label: 'Confirm Password',
                    controller: _confirmPasswordController,
                    maxLines: 1,
                    hintText: '*******',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        'I understood the ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Text(
                        'terms & policy.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Color(0xFF3E50F3),
                        ),
                      ),
                    ],
                  ),
                  BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is SignedUpState) {
                        ;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Signed up successfully'),
                          ),
                          
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                      } else if (state is authErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: _isChecked
                            ? () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  final user = UserEntity(
                                    id: '',
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );

                                  context.read<UserBloc>().add(
                                        SignUpEvent(newUser: user),
                                      );
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(340, 48),
                          backgroundColor: const Color(0xFF3E50F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'SIGN UP',
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
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: Color(0xFF888888), // Black with 50% opacity
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignIn(),
                              ),
                            );
                          },
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Color(0xFF3E50F3),
                            ),
                          ),
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
