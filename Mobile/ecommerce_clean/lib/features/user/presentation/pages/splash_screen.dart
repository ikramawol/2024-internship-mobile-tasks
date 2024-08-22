import 'package:ecommerce_clean/features/user/presentation/bloc/user_bloc.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_event.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_state.dart';
import 'package:ecommerce_clean/features/user/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    context.read<UserBloc>().add(SplashToSignInEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is SplashToSignInState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignIn()),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/splash_screen.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF3F51F3).withOpacity(0.5),
                    const Color(0xFF3F51F3),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // Corrected the usage of BoxDecoration inside a Container
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical:
                            8), // Added padding to make the image look better inside the container
                    child:
                        Image.asset('images/Ecom.png', width: 160, height: 70),
                  ),
                  const SizedBox(height: 15),
                  const Text('ECOMMERCE APP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  // Uncomment the CircularProgressIndicator if needed
                  // const CircularProgressIndicator(
                  //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
