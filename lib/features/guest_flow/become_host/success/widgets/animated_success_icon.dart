import 'package:flutter/material.dart';

class AnimatedSuccessIcon extends StatefulWidget {
  final double size;
  final Color color;

  const AnimatedSuccessIcon({
    super.key,
    this.size = 200,
    this.color = const Color(0xFF4CAF50),
  });

  @override
  State<AnimatedSuccessIcon> createState() => _AnimatedSuccessIconState();
}

class _AnimatedSuccessIconState extends State<AnimatedSuccessIcon>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _checkController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _checkController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _checkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _checkController, curve: Curves.easeInOut),
    );

    // Start animations
    _scaleController.forward().then((_) {
      _checkController.forward();
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _checkAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [widget.color, widget.color.withValues(alpha: .8)],
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: .3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: CustomPaint(painter: CheckPainter(_checkAnimation.value)),
          ),
        );
      },
    );
  }
}

class CheckPainter extends CustomPainter {
  final double progress;

  CheckPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final checkSize = size.width * 0.3;

    // Define check mark path
    final path = Path();
    path.moveTo(center.dx - checkSize * 0.5, center.dy);
    path.lineTo(center.dx - checkSize * 0.1, center.dy + checkSize * 0.3);
    path.lineTo(center.dx + checkSize * 0.5, center.dy - checkSize * 0.3);

    // Draw animated check mark
    final pathMetric = path.computeMetrics().first;
    final extractedPath = pathMetric.extractPath(
      0,
      pathMetric.length * progress,
    );

    canvas.drawPath(extractedPath, paint);
  }

  @override
  bool shouldRepaint(CheckPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
