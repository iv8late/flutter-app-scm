import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_base_app/modules/layout/glass_background_layout.dart';
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
              : GlassBackgroundLayout(
                child: Stack(
                  children: [
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
