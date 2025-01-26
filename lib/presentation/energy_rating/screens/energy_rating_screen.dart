import 'package:bia_app/assets/configs/theme/app_colors.dart';
import 'package:bia_app/common/cancel_button.dart';
import 'package:bia_app/common/continue_button.dart';
import 'package:bia_app/presentation/energy_rating/widgets/custom_slider.dart';
import 'package:bia_app/presentation/energy_rating/widgets/ligthning_bolt_widget/ligthning_widget.dart';
import 'package:flutter/material.dart';
import 'package:bia_app/assets/configs/constants/app_strings.dart';
import 'package:bia_app/presentation/energy_rating/utils/energy_rating_utils.dart';

class EnergyRatingScreen extends StatefulWidget {
  const EnergyRatingScreen({super.key});

  @override
  State<EnergyRatingScreen> createState() => _EnergyRatingScreenState();
}

class _EnergyRatingScreenState extends State<EnergyRatingScreen> {

  static const double _initialSliderValue = EnergyRatingUtils.minValue;
  static const double _contentPadding = 24.0;
  static const double _sliderHorizontalPadding = 30.0;
  static const double _borderRadius = 30.0;

  double _sliderValue = _initialSliderValue;

  String _getEnergyLevelText(double value) {
    switch (value.toInt()) {
      case 1:
        return AppStrings.energyStatusExhausted;
      case 2:
        return AppStrings.energyStatusTired;
      case 3:
        return AppStrings.energyStatusSlightlyTired;
      case 4:
        return AppStrings.energyStatusNeutral;
      case 5:
        return AppStrings.energyStatusSlightlyEnergized;
      case 6:
        return AppStrings.energyStatusEnergized;
      case 7:
        return AppStrings.energyStatusVeryEnergized;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.layoutBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          onPressed: () => {},
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _mainContent()),
          _buttonsContent(),
        ],
      ),
    );
  }

  Widget _buttonsContent() {
    return Container(
      color: AppColors.layoutBackground,
      padding: const EdgeInsets.fromLTRB(
        _contentPadding,
        _contentPadding / 2,
        _contentPadding,
        _contentPadding + 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CancelButton(
            title: AppStrings.buttonCancel,
            onPressed: (){},
          ),
          ContinueButton(
            title: AppStrings.buttonContinue,
            onPressed: (){},
          ),
        ],
      ),
    );
  }

  Widget _mainContent() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brown.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _backgroundGradient(),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 48),
                _energyQuestionText(),
                const SizedBox(height: 76),
                _energyLevelIcon(),
                const SizedBox(height: 84),
                _energyStatusDescriptionText(),
                const SizedBox(height: 24),
                _energyRatingSlider(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _energyStatusDescriptionText() {
    return Center(
      child: Text(
        _getEnergyLevelText(_sliderValue),
        style: const TextStyle(
          fontFamily: 'ppneuemontreal',
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 24,
          height: 32 / 24,
          letterSpacing: 24 * 0.02,
        ),
      ),
    );
  }

  Widget _energyQuestionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Text(
        AppStrings.energyRatingQuestion,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'ppneuemontreal',
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(0.8),
          fontSize: 24,
          height: 32 / 24,
          letterSpacing: 24 * 0.03,
        ),
      ),
    );
  }

  Widget _energyLevelIcon() {
    return Center(
      child: LightningBoltWidget(
        fillValue: EnergyRatingUtils.sliderValueToFillPercentage(_sliderValue),
      ),
    );
  }

  Widget _energyRatingSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _sliderHorizontalPadding),
      child: Column(
        children: [
          CustomSlider(
            min: EnergyRatingUtils.minValue,
            max: EnergyRatingUtils.maxValue,
            divisions: EnergyRatingUtils.totalLevels - 1,
            value: _sliderValue,
            onChanged: (value) => setState(() => _sliderValue = value),
          ),
          _buildSliderLabels(),
        ],
      ),
    );
  }

  Widget _buildSliderLabels() {
    final labelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontSize: 12,
      fontFamily: 'ppneuemontreal',
      fontWeight: FontWeight.w500,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.energyLevelWorst, style: labelStyle),
        Text(AppStrings.energyLevelBest, style: labelStyle),
      ],
    );
  }

  Widget _backgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.95,
          colors: [
            AppColors.primary.withOpacity(0.3),
            AppColors.primary.withOpacity(0.2),
            AppColors.primary.withOpacity(0.1),
            Colors.transparent,
          ],
          stops: const [0.0, 0.40, 0.60, 1],
        ),
      ),
    );
  }
}
