import 'dart:math';

import 'package:flutter/material.dart';

class MultiCircleChart extends StatelessWidget {
  final List<double> values;
  final double size;
  final double maxStrokeWidth;
  final List<Color>? colors;

  const MultiCircleChart({
    super.key,
    required this.values,
    this.size = 111,
    this.maxStrokeWidth = 20, // max thickness for largest value
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _MultiCircleChartPainter(values, maxStrokeWidth, colors),
      ),
    );
  }
}

class _MultiCircleChartPainter extends CustomPainter {
  final List<double> values;
  final double strokeWidth;
  final List<Color>? colors;

  _MultiCircleChartPainter(this.values, this.strokeWidth, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final total = values.fold(0.0, (a, b) => a + b);
    if (total == 0) return;

    final center = size.center(Offset.zero);
    final radius = size.width / 2 - strokeWidth / 2;
    double startAngle = -pi / 2;

    for (int i = 0; i < values.length; i++) {
      final sweepAngle = (values[i] / total) * 2 * pi;

      final baseColor = colors != null && i < colors!.length
          ? colors![i]
          : _randomColor(i);

      final rect = Rect.fromCircle(center: Offset.zero, radius: radius);

      final gradient = SweepGradient(
        startAngle: 0,
        endAngle: sweepAngle,
        colors: [baseColor, baseColor.withValues(alpha: 0.0)],
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      );

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt
        ..shader = gradient.createShader(rect);

      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(startAngle);
      canvas.drawArc(
        Rect.fromCircle(center: Offset.zero, radius: radius),
        0,
        sweepAngle,
        false,
        paint,
      );
      canvas.restore();

      startAngle += sweepAngle;
    }
  }

  Color _randomColor(int index) {
    final random = Random(index);
    return Color.fromARGB(
      255,
      random.nextInt(200),
      random.nextInt(200),
      random.nextInt(200),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
