import 'package:flutter/rendering.dart';

class MenuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size.width / 2;
    var paint = Paint()
      ..color = Color.fromRGBO(0, 0, 0, 1)
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(center / 2, size.height / 2 + 5),
      Offset(center * 3 / 2, size.height / 2 + 5),
      paint,
    );
    canvas.drawLine(
      Offset(center / 2, size.height / 2 - 5),
      Offset(center * 3 / 2, size.height / 2 - 5),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
