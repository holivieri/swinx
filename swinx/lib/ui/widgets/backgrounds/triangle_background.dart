import 'package:flutter/cupertino.dart';
import 'package:swinx/utils/color.dart';

class TriangleBackground extends StatelessWidget {
  final Color color;

  const TriangleBackground({
    Key? key,
    this.color = const Color(0xff615AAB),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(color: color),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  final Color color;

  _HeaderPicoPainter({this.color = const Color(0xff615AAB)});

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    lapiz.color = color;
/*     lapiz.shader = RadialGradient(
      colors: [
        gradientColor1,
        gradientColor2,
      ],
    ).createShader(Rect.fromCircle(
      center: Offset(25, 30),
      radius: 10,
    )); */
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = new Path();
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
