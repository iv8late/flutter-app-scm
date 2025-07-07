import 'package:flutter/material.dart';
import 'package:project_base_app/modules/layout/glass_background_layout.dart';
import 'package:project_base_app/shared/widgets/custom_buttons.dart';
import 'package:project_base_app/shared/widgets/custom_text_styles.dart';
import 'package:project_base_app/shared/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  void _register() {
    setState(() {
      _isLoading = true;
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 60),
                      Text('', style: AppTextStyles.pinkTitleBold),
                      SizedBox(height: 40),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'email',
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: _userController,
                        hintText: 'user',
                        icon: Icons.person_outline_rounded,
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        isPassword: true,
                        hintText: 'password',
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: _repeatPasswordController,
                        isPassword: true,
                        icon: Icons.lock,
                        hintText: 'repeat password',
                      ),
                      SizedBox(height: 30),
                      PrimaryNeonButton(
                        onPressed: _register,
                        content: '           REGISTER            ',
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already an user? ',
                            style: AppTextStyles.italicPinkBody,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              'Log In',
                              style: AppTextStyles.pinkBodyBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
