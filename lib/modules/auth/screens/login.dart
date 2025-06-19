import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_base_app/shared/widgets/custom_buttons.dart';
import 'package:project_base_app/shared/widgets/custom_textStyles.dart';
import 'package:project_base_app/shared/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    setState(() {
      _isLoading = true;
      Navigator.of(context).pop();
      Navigator.pushNamed(context, '/home');
      _isLoading = false;
    });
    // lógica de login...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: Image.asset(
                        'assets/bg/lo-fi_pixel_art_wallpapers.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Capa de glassmorphism
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(180),
                            border: Border.all(
                              color: Colors.black.withAlpha(280),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 60),
                          Text('', style: AppTextStyles.pinkTitleBold),
                          SizedBox(height: 40),
                          CustomTextField(
                            controller: _userController,
                            icon: Icons.person_outline_rounded,
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            controller: _passwordController,
                            isPassword: true,
                          ),
                          SizedBox(height: 20),
                          PrimaryNeonButton(
                            onPressed: _login,
                            content: '           LOGIN            ',
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'First time here? ',
                                style: AppTextStyles.italicPinkBody,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  ' Sign up ',
                                  style: AppTextStyles.pinkBodyBold,
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
    );
  }
}
