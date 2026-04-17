import 'package:flutter/material.dart';

class LensRoundedClipper extends CustomClipper<Path> {
  final double centerHeight;
  final double cornerHeight;
  final double radius;

  const LensRoundedClipper({
    this.centerHeight = 54,
    this.cornerHeight = 50,
    this.radius = 12,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    final double w = size.width;
    final double h = size.height; // = centerHeight (54)
    final double diff = (centerHeight - cornerHeight) / 2; // = 2px bow

    // ─── Top-left corner (rounded) ───
    path.moveTo(radius, diff);
    path.arcToPoint(
      Offset(0, diff + radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // ─── Left vertical edge ───
    path.lineTo(0, h - diff - radius);

    // ─── Bottom-left corner (rounded) ───
    path.arcToPoint(
      Offset(radius, h - diff),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // ─── Bottom edge bows DOWN at center ───
    path.quadraticBezierTo(w / 2, h, w - radius, h - diff);

    // ─── Bottom-right corner (rounded) ───
    path.arcToPoint(
      Offset(w, h - diff - radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // ─── Right vertical edge ───
    path.lineTo(w, diff + radius);

    // ─── Top-right corner (rounded) ───
    path.arcToPoint(
      Offset(w - radius, diff),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // ─── Top edge bows UP at center ───
    path.quadraticBezierTo(w / 2, 0, radius, diff);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
