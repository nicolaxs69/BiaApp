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
          color: Colors.grey,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 16 * 0.03,
        ),
      ),
    );
  }
}
