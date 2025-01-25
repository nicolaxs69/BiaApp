import 'package:bia_app/assets/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CancelButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'ppneuemontreal',
          fontWeight: FontWeight.w600,
          color: AppColors.grey,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 16 * 0.03,
        ),
      ),
    );
  }
}
