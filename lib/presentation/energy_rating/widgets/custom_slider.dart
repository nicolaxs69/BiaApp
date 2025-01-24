import 'package:bia_app/assets/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: SliderTheme(
          data: SliderThemeData(
            trackHeight: 22,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 32),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
            tickMarkShape: const CustomTickMarkShape(
              tickRadius: 2.0,
              horizontalPadding: 0,
              endPadding: 0,
            ),
            activeTickMarkColor: Colors.white.withOpacity(0.5),
            inactiveTickMarkColor: Colors.white.withOpacity(1),
            activeTrackColor: Colors.grey.withOpacity(1.0),
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
            thumbColor: AppColors.sliderThumb,
            overlayColor: Colors.white.withOpacity(0.2),
          ),
          child: Slider(
            max: 7.0,
            value: value,
            divisions: 6,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

class CustomTickMarkShape extends RoundSliderTickMarkShape {
  final double tickRadius;
  final double horizontalPadding;
  final double endPadding;

  const CustomTickMarkShape({
    this.tickRadius = 3.0,
    this.horizontalPadding = 0.0,
    this.endPadding = 0.0,
  });

  @override
  Size getPreferredSize({
    required bool isEnabled,
    required SliderThemeData sliderTheme,
  }) {
    return Size.fromRadius(tickRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final Paint paint = Paint()
      ..color = (isEnabled
              ? sliderTheme.activeTickMarkColor
              : sliderTheme.inactiveTickMarkColor) ??
          Colors.transparent;

    final double leftLimit = endPadding;
    final double rightLimit = parentBox.size.width - endPadding;
    final double clampedX = center.dx.clamp(leftLimit, rightLimit);
    final Offset shiftedCenter = Offset(clampedX, center.dy);
    context.canvas.drawCircle(shiftedCenter, tickRadius, paint);
  }
}
