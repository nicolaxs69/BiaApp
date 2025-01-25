import 'package:bia_app/assets/configs/assets/app_vectors.dart';
import 'package:bia_app/assets/configs/theme/app_colors.dart';
import 'package:bia_app/common/cancel_button.dart';
import 'package:bia_app/common/continue_button.dart';
import 'package:bia_app/presentation/energy_rating/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EnergyRatingScreen extends StatefulWidget {
  const EnergyRatingScreen({super.key});

  @override
  State<EnergyRatingScreen> createState() => _EnergyRatingScreenState();
}

class _EnergyRatingScreenState extends State<EnergyRatingScreen> {
  double _sliderValue = 4.0; // Initialize with middle value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.layoutBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _mainContent(),
          ),
          buttonsContent()
        ],
      ),
    );
  }

  Widget buttonsContent() {
    return Container(
      color: AppColors.layoutBackground,
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CancelButton(title: 'Cancel', onPressed: () {}),
          ContinueButton(title: 'Continue', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _mainContent() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brown.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
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
                _energyStatusDescriptionTect(),
                const SizedBox(height: 24),
                _energyRatingSlider(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _energyStatusDescriptionTect() {
    return const Center(
      child: Text(
        "I'm feeling great!",
        style: TextStyle(
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
        'How would you rate your energy this morning?',
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
      child: SvgPicture.asset(
        AppVectors.energyIcon,
        width: 188,
        height: 224,
      ),
    );
  }

  Widget _energyRatingSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomSlider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Worst',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'ppneuemontreal',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Best',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'ppneuemontreal',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
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
