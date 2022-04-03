part of '../r_nav_n_sheet.dart';

class BottomClipperPlain extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 35);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 35);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BottomClipper extends CustomClipper<Path> {
  final double value;

  BottomClipper({this.value = 10});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, (value * 3) + 5);
    path.quadraticBezierTo(
      (size.width / 3) - 36,
      value * 3,
      (size.width / 2) - 36,
      30,
    );
    path.quadraticBezierTo(size.width / 2, 0, size.width / 2 + 36, 30);
    path.quadraticBezierTo(
        (size.width / 1.5) + 36, value * 3, size.width, (value * 3) + 5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
