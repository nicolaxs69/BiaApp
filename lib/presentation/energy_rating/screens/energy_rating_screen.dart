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
  double _sliderValue = 4.0;  // Initialize with middle value

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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: AppColors.brown.withOpacity(0.8),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 48),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 36),
                            child: Text(
                              'How would you rate your energy this morning?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'ppneuemontreal',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 24,
                                height: 32 / 24,
                                letterSpacing: 24 * 0.03,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 76),
                        Center(
                          child: SvgPicture.asset(
                            AppVectors.energyIcon,
                            width: 188,
                            height: 224,
                          ),
                        ),
                        const SizedBox(height: 84),
                        const Center(
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
                        ),
                        const SizedBox(height: 24),
                        Padding(
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
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Worst',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'ppneuemontreal',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Best',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'ppneuemontreal',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: AppColors.layoutBackground,
            padding: EdgeInsets.fromLTRB(24, 12, 24, 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CancelButton(title: 'Cancel', onPressed: () {}),
                ContinueButton(title: 'Continue', onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
