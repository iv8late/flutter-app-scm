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
  required Color color,
  double? width,
  IconData icon = Icons.home,
}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipPath(
      clipper: DiamondClipper(),
      child: Container(
        width: width ?? 80,
        height: width ?? 80,
        color: color,
        child: Center(child: Icon(icon, color: Colors.white)),
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

Widget triangleButton({
  required VoidCallback onTap,
  required Color color,
  double? width,
  IconData icon = Icons.home,
}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        width: width ?? 80,
        height: width ?? 80,
        color: color,
        child: Center(child: Icon(icon, color: Colors.white)),
      ),
    ),
  );
}

enum TriangleDirection { left, right }

class RightAngleTriangleClipper extends CustomClipper<Path> {
  final TriangleDirection direction;

  RightAngleTriangleClipper(this.direction);

  @override
  Path getClip(Size size) {
    final path = Path();

    if (direction == TriangleDirection.left) {
      // Triángulo rectángulo con ángulo en bottom-left
      path.moveTo(0, size.height); // bottom-left (ángulo recto)
      path.lineTo(size.width, size.height); // bottom-right
      path.lineTo(0, 0); // top-left
    } else {
      // Triángulo rectángulo con ángulo en bottom-right
      path.moveTo(size.width, size.height); // bottom-right (ángulo recto)
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
