import 'dart:math';
import 'package:flutter/material.dart';

class Star {
  final double x;
  final double y;
  double z;
  double pz;
  Star({
    required this.x,
    required this.y,
    required this.z,
  }) : pz = z;

  double get r => 4;

  Star update(speed, size) {
    pz = z;
    z = (z * 0.9) - speed;
    if (!_createNewStar) return this;

    return make(speed, size, randomZ: false);
  }

  static make(speed, size, {bool randomZ = true}) {
    final _r = Random();
    num next(num a, num b) => _r.nextDouble() * (a - b).abs() + min(a, b);
    return Star(
      z: randomZ ? next(0, size).toDouble() : size,
      x: next(-size, size).toDouble(),
      y: next(-size, size).toDouble(),
    );
  }

  double get sx => x / z;
  double get sy => y / z;
  double get px => x / pz;
  double get py => y / pz;
  bool get _createNewStar => z < 1 || px > 1 || px < -1 || py > 1 || py < -1;
  show({required Canvas canvas, width, height}) {
    // canvas.drawOval(
    //   Rect.fromLTWH(x / z, y / z, width, height),
    //   _paint,
    // );

    // var sx = map(x / z, 0, 1, 0, width);
    // var sy = map(y / z, 0, 1, 0, height);

    // var r = map(z, 0, width, 16, 0);
    // ellipse(sx, sy, r, r);

    // var px = map(x / pz, 0, 1, 0, width);
    // var py = map(y / pz, 0, 1, 0, height);

    // pz = z;

    // stroke(255);
    // line(px, py, sx, sy);
  }
}
