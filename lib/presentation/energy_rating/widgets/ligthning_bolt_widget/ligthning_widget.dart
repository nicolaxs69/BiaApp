import 'package:bia_app/presentation/energy_rating/widgets/ligthning_bolt_widget/ligthning_custom_painter.dart';
import 'package:flutter/material.dart';

class LightningBoltWidget extends StatefulWidget {
  final double fillValue;

  const LightningBoltWidget({super.key, required this.fillValue});

  @override
  State<LightningBoltWidget> createState() => _LightningBoltWidgetState();
}

class _LightningBoltWidgetState extends State<LightningBoltWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          child: CustomPaint(
            size: Size(
              180,
              (150 * 1.1914893617021276).toDouble(),
            ),
            painter: LigthningCustomPainter(
              animationValue: _animationController.value,
              fillValue: widget.fillValue,
            ),
          ),
        );
      },
    );
  }
}
