import 'dart:ui';
import 'package:flutter/material.dart';

class GlassBackgroundLayout extends StatelessWidget {
  final Widget child;

  const GlassBackgroundLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // Imagen de fondo
          SizedBox.expand(
            child: Image.asset(
              'assets/bg/lo-fi_pixel_art_wallpapers.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          // Filtro de desenfoque
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(180),
                  border: Border.all(
                    color: Colors.black.withAlpha(180),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),

          // Centrar el contenido
          Positioned.fill(child: Center(child: child)),
        ],
      ),
    );
  }
}
