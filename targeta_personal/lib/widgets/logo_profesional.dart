import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Logo personal y profesional del desarrollador.
///
/// Dibuja un hexágono con degradado que contiene las iniciales del
/// desarrollador y un pequeño acento "</>" que simboliza el desarrollo
/// de software. Se construye con [CustomPainter], por lo que es un
/// logo vectorial propio y no depende de ninguna imagen externa.
class LogoProfesional extends StatelessWidget {
  final double size;
  final String iniciales;

  const LogoProfesional({
    super.key,
    this.size = 72,
    this.iniciales = 'MR',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _LogoPainter(iniciales: iniciales),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  final String iniciales;
  _LogoPainter({required this.iniciales});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // --- Hexágono de fondo con degradado ---
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (60 * i - 30) * math.pi / 180;
      final point = Offset(
        center.dx + radius * 0.98 * math.cos(angle),
        center.dy + radius * 0.98 * math.sin(angle),
      );
      i == 0 ? path.moveTo(point.dx, point.dy) : path.lineTo(point.dx, point.dy);
    }
    path.close();

    final paintFondo = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.indigo.shade400, Colors.indigo.shade900],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawPath(path, paintFondo);

    // Borde sutil
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white.withOpacity(0.6)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // --- Iniciales al centro ---
    final textoIniciales = TextPainter(
      text: TextSpan(
        text: iniciales,
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width * 0.32,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textoIniciales.paint(
      canvas,
      Offset(
        center.dx - textoIniciales.width / 2,
        center.dy - textoIniciales.height / 2 - size.height * 0.06,
      ),
    );

    // --- Acento "</>" como sello de desarrollo de software ---
    final textoAcento = TextPainter(
      text: TextSpan(
        text: '</>',
        style: TextStyle(
          color: Colors.amberAccent.shade100,
          fontSize: size.width * 0.14,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textoAcento.paint(
      canvas,
      Offset(
        center.dx - textoAcento.width / 2,
        center.dy + size.height * 0.16,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _LogoPainter oldDelegate) => false;
}
