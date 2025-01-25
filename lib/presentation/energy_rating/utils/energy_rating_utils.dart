class EnergyRatingUtils {
  static const double minValue = 1.0;
  static const double maxValue = 7.0;
  static const double fillOffset = 0.09;
  static const int totalLevels = 7;

  // Calculate the fill percentage of the lightning bolt based on the slider value
  static double sliderValueToFillPercentage(double sliderValue) {
    return (sliderValue - minValue) / (maxValue - minValue) + fillOffset;
  }
}
