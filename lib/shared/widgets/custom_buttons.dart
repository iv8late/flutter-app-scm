import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';

class PrimaryNeonButton extends StatefulWidget {
  final String content;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fontSize;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsets? padding;

  const PrimaryNeonButton({
    super.key,
    required this.content,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fontSize,
    this.borderRadius,
    this.borderColor,
    this.padding,
  });

  @override
  State<PrimaryNeonButton> createState() => _PrimaryNeonButtonState();
}

class _PrimaryNeonButtonState extends State<PrimaryNeonButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ?? 4.0;
    final borderColor =
        _isHovered
            ? Colors.white
            : (widget.borderColor ?? AppTheme.lightestPink);

    final baseStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: widget.foregroundColor ?? AppTheme.lightestPink,
      padding:
          widget.padding ??
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: TextStyle(
        fontSize: widget.fontSize ?? 24,
        fontWeight: FontWeight.w300,
        shadows: const [
          Shadow(
            blurRadius: 3.0,
            color: AppTheme.darkPink,
            offset: Offset(0, 0),
          ),
          Shadow(
            blurRadius: 3.0,
            color: AppTheme.darkPink,
            offset: Offset(0, 0),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor, width: 2),
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color:
                  _isHovered
                      ? Colors.white.withAlpha(204) // Hover: blanco brillante
                      : AppTheme.darkPink,
              blurRadius: _isHovered ? 30 : 40,
              spreadRadius: _isHovered ? 0.5 : 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: TextButton(
          style: baseStyle,
          onPressed: widget.onPressed,
          child: Text(widget.content),
        ),
      ),
    );
  }
}
