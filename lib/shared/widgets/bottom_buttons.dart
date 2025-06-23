import 'package:flutter/material.dart';

class DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget diamondButton({
  required VoidCallback onTap,
  Color color = Colors.transparent,
  Color bgcolor = Colors.transparent,
  double? width,
  IconData icon = Icons.home,
  Color borderColor = Colors.white,
  double? borderWidth,
  double elevation = 6.0,
}) {
  double size = width ?? 80;
  double dynamicBorderWidth = borderWidth ?? (size * 0.06); // ~6% of size
  double iconSize = size * 0.35;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: elevation,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipPath(
        clipper: DiamondClipper(),
        child: Container(
          color: borderColor,
          child: Padding(
            padding: EdgeInsets.all(dynamicBorderWidth),
            child: ClipPath(
              clipper: DiamondClipper(),
              child: Container(
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ClipPath(
                    clipper: DiamondClipper(),
                    child: Container(
                      color: bgcolor,
                      child: Center(
                        child: Icon(
                          icon,
                          size: iconSize.clamp(12, 30),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class UpwardTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0); // Punta arriba
    path.lineTo(0, size.height); // Esquina inferior izquierda
    path.lineTo(size.width, size.height); // Esquina inferior derecha
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget triangleButton({
  required VoidCallback onTap,
  Color borderColor = Colors.white,
  Color color = Colors.transparent,
  double width = 80,
  double? height,
  double borderWidth = 3,
  IconData icon = Icons.home,
  double elevation = 6.0,
  Color iconColor = Colors.white,
}) {
  double h = height ?? (width * 0.5);
  double iconSize = (width * 0.35).clamp(12, 26); // Responsivo

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: elevation,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(width, h),
            painter: TrianglePainter(
              borderColor: borderColor,
              fillColor: color,
              borderWidth: borderWidth,
            ),
          ),
          Icon(icon, color: iconColor, size: iconSize),
        ],
      ),
    ),
  );
}

class TrianglePainter extends CustomPainter {
  final Color borderColor;
  final Color fillColor;
  final double borderWidth;

  TrianglePainter({
    required this.borderColor,
    required this.fillColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path outer =
        Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height)
          ..close();

    final Paint borderPaint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.fill;
    canvas.drawPath(outer, borderPaint);

    final double bw = borderWidth;
    final Path inner =
        Path()
          ..moveTo(size.width / 2, bw)
          ..lineTo(bw, size.height - bw)
          ..lineTo(size.width - bw, size.height - bw)
          ..close();

    final Paint fillPaint =
        Paint()
          ..color = fillColor
          ..style = PaintingStyle.fill;
    canvas.drawPath(inner, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

enum TriangleDirection { left, right }

class RightAngleTriangleClipper extends CustomClipper<Path> {
  final TriangleDirection direction;

  RightAngleTriangleClipper(this.direction);

  @override
  Path getClip(Size size) {
    final path = Path();

    if (direction == TriangleDirection.left) {
      path.moveTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(0, 0); // top-left
    } else {
      //right
      path.moveTo(size.width, size.height); // bottom-right
      path.lineTo(0, size.height); // bottom-left
      path.lineTo(size.width, 0); // top-right
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

Widget rectangleTriangleButton({
  required VoidCallback onTap,
  required Color color,
  double? width,
  IconData icon = Icons.home,
  TriangleDirection direction = TriangleDirection.left,
}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipPath(
      clipper: RightAngleTriangleClipper(direction),
      child: Container(
        width: width ?? 80,
        height: width ?? 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.5, 0.5],
            begin:
                direction == TriangleDirection.left
                    ? Alignment.bottomLeft
                    : Alignment.bottomRight,
            end:
                direction == TriangleDirection.left
                    ? Alignment.topRight
                    : Alignment.topLeft,
            colors: [color, Colors.transparent],
          ),
        ),
        child: Align(
          alignment:
              direction == TriangleDirection.left
                  ? Alignment.bottomLeft
                  : Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    ),
  );
}

class BottomRightTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height); // bottom left
    path.lineTo(size.width, size.height); // bottom right (punta)
    path.lineTo(0, 0); // top left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
