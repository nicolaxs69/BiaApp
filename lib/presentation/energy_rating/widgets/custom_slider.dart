import 'package:bia_app/assets/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

/* Custom slider widget that provides a customized appearance and behavior.
 * 
 * This slider includes custom track, thumb, and tick mark shapes. It's designed
 * with a specific visual style including:
 * - Custom track height and appearance
 * - Custom thumb shape with directional arrows
 * - Custom tick marks for divisions
 * - Customized colors and dimensions
 */
class CustomSlider extends StatelessWidget {
  final double min;
  final double max;
  final int divisions;
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider({
    super.key,
    this.min = 1.0,
    this.max = 7.0,
    this.divisions = 6,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("Slider value: $value"); // More reliable for Flutter debugging
    return SliderTheme(
      data: SliderThemeData(
      trackHeight: 22,
      trackShape: CustomTrackShape(),
      thumbShape: const CustomThumbShape(
        Colors.white,
        thumbRadius: 22,
        active: false,
      ),
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
      overlayColor: Colors.white.withOpacity(0.2),
      ),
      child: Slider(
      min: min,
      max: max,
      divisions: divisions,
      value: value,
      onChanged: onChanged,
      ),
    );
  }
}

/* Custom shape for slider tick marks.
 * 
 * Provides circular tick marks with customizable radius and padding.
 * 
 * Parameters:
 * - [tickRadius]: The radius of each tick mark
 * - [horizontalPadding]: Horizontal padding between tick marks
 * - [endPadding]: Padding at the ends of the slider
 */
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

/* Custom track shape for the slider.
 * 
 * Extends the default rounded rectangle track shape with customizable extensions
 * and improvements to edge-to-edge rendering.
 * 
 * Parameters:
 * - [trackExtension]: Additional extension length for the track at both ends
 */
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

/* Custom thumb shape for the slider with directional arrows.
 * 
 * 
 * Parameters:
 * - [activeColor]: The color of the thumb when active
 * - [thumbRadius]: The radius of the circular thumb
 * - [active]: Whether the thumb is in an active state
 * 
 * The thumb includes:
 * - A circular background with the specified active color
 * - Two directional arrows (< >) drawn in grey
 * - Customizable dimensions for the arrows and spacing
 */
class CustomThumbShape extends SliderComponentShape {
  final Color activeColor;
  final bool active;
  final double thumbRadius;

  const CustomThumbShape(this.activeColor,
      {required this.thumbRadius, required this.active});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    context.canvas.drawCircle(
      center,
      thumbRadius,
      Paint()
        ..color = activeColor
        ..style = PaintingStyle.fill,
    );

    const double size = 4.0;
    const double spacing = 6.0;
    const double angle = 2.5;

    final pathPaint = Paint()
      ..color = AppColors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    // Left arrow
    final leftPath = Path()
      ..moveTo(center.dx - size - spacing / 2, center.dy)
      ..lineTo(center.dx - spacing / 2, center.dy - size / 2 - angle)
      ..moveTo(center.dx - size - spacing / 2, center.dy)
      ..lineTo(center.dx - spacing / 2, center.dy + size / 2 + angle);

    // Right arrow
    final rightPath = Path()
      ..moveTo(center.dx + size + spacing / 2, center.dy)
      ..lineTo(center.dx + spacing / 2, center.dy - size / 2 - angle)
      ..moveTo(center.dx + size + spacing / 2, center.dy)
      ..lineTo(center.dx + spacing / 2, center.dy + size / 2 + angle);

    context.canvas.drawPath(leftPath, pathPaint);
    context.canvas.drawPath(rightPath, pathPaint);
  }
}
