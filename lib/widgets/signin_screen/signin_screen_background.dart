import 'package:flutter/material.dart';

import 'package:signup/configs/app_colors.dart';

class SigninScreenBackground extends StatelessWidget {
  final Widget child;

  const SigninScreenBackground({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: _ShapePainter(),
        child: child,
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _bottom(canvas, size);
    _top(canvas, size);
  }

  void _top(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColors.purple;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(0, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.45, size.width * 0.5, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.20, size.width, size.height * 0.15);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  void _bottom(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColors.yellow;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(size.width * 0.45, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.5, size.width, size.height * 0.5);

    path.lineTo(size.width, size.height * 0.15);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
