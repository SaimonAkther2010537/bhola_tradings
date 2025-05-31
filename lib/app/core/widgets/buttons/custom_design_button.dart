

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double width;
  final TextStyle style;
  final IconData icon;
  final VoidCallback onTap;
  final String buttonText;

  const CustomButton({super.key, required this.width, required this.style, required this.icon, required this.onTap, required this.buttonText});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Offset _ripplePosition = Offset.zero; // Track the tap position

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the animation, scaling from 0.0 to 1.0
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Trigger a rebuild when the animation value changes
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation(Offset position) {
    _ripplePosition = position; // Update ripple position to where user clicked
    _controller.forward(from: 0.0); // Restart the animation
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _startAnimation(details.localPosition), // Get the tap position
      child: Stack(
        children: [
          // Custom paint with ripple effect
          CustomPaint(
            size: Size(widget.width, widget.width * 0.7317), // Maintain aspect ratio from SVG (82:60)
            painter: RPSCustomPainter(animationValue: _animation.value, ripplePosition: _ripplePosition),
          ),

          // Icon and text centered over the button
           Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon),
                Text(widget.buttonText, style: widget.style),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final double animationValue;
  final Offset ripplePosition; // Position of the ripple

  RPSCustomPainter({required this.animationValue, required this.ripplePosition});

  @override
  void paint(Canvas canvas, Size size) {
    // Define the main path background
    Path path = Path();
    path.moveTo(size.width, size.height * 0.8954);
    path.cubicTo(
      size.width,
      size.height * 0.9524,
      size.width * 0.9652,
      size.height,
      size.width * 0.9235,
      size.height,
    );
    path.lineTo(size.width * 0.0699, size.height * 0.9428);
    path.cubicTo(
      size.width * 0.0308,
      size.height * 0.9404,
      0,
      size.height * 0.8964,
      0,
      size.height * 0.8429,
    );
    path.lineTo(0, size.height * 0.1428);
    path.cubicTo(
      0,
      size.height * 0.0894,
      size.width * 0.0308,
      size.height * 0.0429,
      size.width * 0.0699,
      size.height * 0.0428,
    );
    path.lineTo(size.width * 0.9235, size.height * 0.0035);
    path.cubicTo(
      size.width * 0.9657,
      size.height * 0.0016,
      size.width,
      size.height * 0.0786,
      size.width,
      size.height * 0.1343,
    );
    path.close();

    // Draw the main path background
    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xff95C93D);
    canvas.drawPath(path, paint);

    // Clip to the path so the ripple effect stays within bounds
    canvas.save();
    canvas.clipPath(path);

    // Add ripple effect at the tap position
    final rippleRadius = animationValue * size.width * 0.5; // Expanding radius
    final rippleOpacity = (1.0 - animationValue).clamp(0.0, 1.0); // Fading effect

    Paint ripplePaint = Paint()..color = Colors.white.withOpacity(rippleOpacity);
    canvas.drawCircle(
      ripplePosition, // Use the stored ripple position
      rippleRadius, // Radius based on animation value
      ripplePaint,
    );

    canvas.restore(); // Remove the clipping once done
  }

  @override
  bool shouldRepaint(covariant RPSCustomPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.ripplePosition != ripplePosition; // Repaint if the position or animation changes
  }
}
