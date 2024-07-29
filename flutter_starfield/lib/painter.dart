import 'package:flutter/material.dart';

import 'star.dart';

class MyPainter extends CustomPainter {
  final List<Star> stars;

  const MyPainter({super.repaint, required this.stars});

  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width / 2;
    double h = size.height / 2;
    final _paint = Paint()
          ..color = Colors.white
          ..strokeWidth = 3
        // Use [PaintingStyle.fill] if you want the circle to be filled.
        // ..style = PaintingStyle.fill;
        ;

    final rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    // canvas.clipRect(rect);

    canvas.drawRect(rect, Paint()..color = Colors.black);

    for (var star in stars) {
      final offset = Offset(star.sx * w, star.sy * h).translate(w, h);
      print(offset);
      canvas.drawCircle(offset, star.r, _paint);
      final pOffset = Offset(star.px * w, star.py * h).translate(w, h);

      canvas.drawLine(pOffset, offset, _paint);
    }
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}
