import 'dart:math';
import 'package:flutter/material.dart';

class ZodiacWheel extends StatelessWidget {
  final List<String> zodiacSigns = [
    '♈︎',
    '♉︎',
    '♊︎',
    '♋︎',
    '♌︎',
    '♍︎',
    '♎︎',
    '♏︎',
    '♐︎',
    '♑︎',
    '♒︎',
    '♓︎',
  ];

  final List<String> zodiacNames = [
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagittarius',
    'Capricorn',
    'Aquarius',
    'Pisces',
  ];

  // final int selectedIndex;

  final DateTime date;

  ZodiacWheel({super.key, required this.date}); // Virgo selected

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = getZodiacSignIndex(date);

    double size = 300;
    double radius = size / 2;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Draw circles and divisions
          CustomPaint(
            size: Size(size, size),
            painter: ZodiacPainter(selectedIndex),
          ),

          // Place zodiac symbols as plain text
          for (int i = 0; i < zodiacSigns.length; i++) _buildZodiacSign(i, zodiacSigns.length, radius, zodiacSigns[i]),

          // Center circle with selected sign name
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer glow circle
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [
                        Color(0xFFF6F1EC), // soft light beige
                        Color(0xFFD8C2B0), // slightly darker towards edge
                      ],
                      center: Alignment.center,
                      radius: 0.8,
                    ),
                    border: Border.all(
                      color: const Color(0xff717784),
                      width: 1,
                    ),
                  ),
                ),

                // Main brown circle
                Container(
                  width: 84,
                  height: 84,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFB48A65),
                        Color(0xFF8B5E3C),
                      ],
                    ),
                  ),
                ),

                // Text with shadow
                Text(
                  zodiacNames.elementAt(selectedIndex),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildZodiacSign(int index, int total, double radius, String sign) {
    final double sectorAngle = 2 * pi / total;
    final double angle = sectorAngle * (index + 0.5) - pi / 2;

    // Now manually pull inward with padding
    const double padding = 30; // 👈 padding you want from border

    final double paddedX = radius + (radius - padding) * cos(angle);
    final double paddedY = radius + (radius - padding) * sin(angle);

    return Positioned(
      left: paddedX - 10, // 10 = half of text size
      top: paddedY - 10,
      child: Text(
        sign,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Roboto', // or another text font
        ),
      ),
    );
  }
}

class ZodiacPainter extends CustomPainter {
  final int selectedIndex;
  final int totalDivisions = 12;

  ZodiacPainter(this.selectedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paintCircle = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = const Color(0xff717784);

    final paintTicks = Paint()
      ..color = const Color(0xff717784)
      ..strokeWidth = .8;

    final paintHighlight = Paint()
      ..color = Colors.brown.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    // Outer circle
    canvas.drawCircle(center, radius, paintCircle);

    // Highlight selected slice
    final double startAngle = (2 * pi / totalDivisions) * selectedIndex - pi / 2;
    final double sweepAngle = 2 * pi / totalDivisions;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      true,
      paintHighlight,
    );

    // Division lines
    for (int i = 0; i < totalDivisions; i++) {
      final double angle = (2 * pi / totalDivisions) * i - pi / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), paintCircle);
    }

    // Inner separator circle
    canvas.drawCircle(center, radius * 0.6, paintCircle);

    // Outer tick marks
    for (int i = 0; i < 360; i += 6) {
      final double tickAngle = (i * pi / 180) - pi / 2;
      final outerX = center.dx + radius * cos(tickAngle);
      final outerY = center.dy + radius * sin(tickAngle);
      final innerX = center.dx + (radius - 8) * cos(tickAngle);
      final innerY = center.dy + (radius - 8) * sin(tickAngle);
      canvas.drawLine(Offset(innerX, innerY), Offset(outerX, outerY), paintTicks);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

int getZodiacSignIndex(DateTime date) {
  final int month = date.month;
  final int day = date.day;

  if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 0; // Aries
  if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 1; // Taurus
  if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 2; // Gemini
  if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 3; // Cancer
  if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 4; // Leo
  if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 5; // Virgo
  if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 6; // Libra
  if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) return 7; // Scorpio
  if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) return 8; // Sagittarius
  if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) return 9; // Capricorn
  if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) return 10; // Aquarius
  if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) return 11; // Pisces

  return 0; // Default fallback (Aries)
}
