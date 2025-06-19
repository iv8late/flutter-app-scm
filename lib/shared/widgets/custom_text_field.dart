import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_base_app/config/theme/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.icon = Icons.text_fields,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.isPassword;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.teal.withAlpha(15),
          border: Border.all(color: AppTheme.teal.withAlpha(30)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppTheme.pink.withAlpha(20),
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          obscureText: isPassword ? _obscure : false,
          controller: widget.controller,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
              color: Colors.white.withAlpha(100),
              fontSize: 16,
            ),
            suffixIcon:
                isPassword
                    ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() => _obscure = !_obscure);
                      },
                    )
                    : Icon(widget.icon, color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
