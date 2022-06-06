part of '../r_nav_n_sheet.dart';

/// Top glowing border painter for  [RNavNSheet] when sheet is disabled
class _BottomPainterPlain extends CustomPainter {
  final List<Color> colors;

  _BottomPainterPlain(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 35);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 35);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..shader = LinearGradient(
        colors: colors,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..blendMode = BlendMode.srcIn
      ..color = Colors.white;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BottomPainterPlain oldDelegate) {
    return oldDelegate.colors != colors;
  }
}

/// Top glowing border painter for  [RNavNSheet] when sheet is enabled
class _BottomPainter extends CustomPainter {
  final List<Color> colors;
  final double value;

  _BottomPainter(this.colors, {this.value = 10});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, (value * 3) + 5);
    path.quadraticBezierTo(
      (size.width / 3) - 36,
      value * 3,
      (size.width / 2) - 36,
      30,
    );
    path.quadraticBezierTo(size.width / 2, 0, size.width / 2 + 36, 30);
    path.quadraticBezierTo((size.width / 1.5) + 36, value * 3, size.width, (value * 3) + 5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..shader = LinearGradient(
        colors: colors,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..blendMode = BlendMode.srcIn
      ..color = Colors.white;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BottomPainter oldDelegate) {
    return oldDelegate.colors != colors || oldDelegate.value != value;
  }
}
