import 'package:bia_app/assets/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ContinueButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(120, 48),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'ppneuemontreal',
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 16 * 0.03,
        ),
      ),
    );
  }
}
