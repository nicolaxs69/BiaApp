import 'package:bia_app/assets/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 22,
        trackShape: CustomTrackShape(),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 20),
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
    );
  }
}

// Custom tick to modify the tick mark size and color
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

// Custom track shape to extend the track to the edge of the screen
class CustomTrackShape extends RoundedRectSliderTrackShape {
  final double trackExtension;

  CustomTrackShape({this.trackExtension = 0.0});

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 0.0;
    final double trackLeft = offset.dx - trackExtension;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width + (trackExtension * 2);
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double? additionalActiveTrackHeight,
  }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final double trackLeft = trackRect.left + trackExtension;
    final double trackRight = trackRect.right - trackExtension;
    final double trackWidth = trackRight - trackLeft;

    final double trackValue = (thumbCenter.dx - trackLeft) / trackWidth;
    final double adjustedThumbCenter = trackLeft + trackWidth * trackValue;

    super.paint(
      context,
      offset,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      enableAnimation: enableAnimation,
      textDirection: textDirection,
      thumbCenter: Offset(adjustedThumbCenter, thumbCenter.dy),
      isDiscrete: isDiscrete,
      isEnabled: isEnabled,
    );
  }
}
