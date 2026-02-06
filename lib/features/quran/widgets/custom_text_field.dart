import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/assets.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;

  const CustomTextField({
    super.key,
    this.onChanged,
    this.hintText = 'Sura name',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primary,
      style: const TextStyle(color: AppColors.primary),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        prefixIcon: Image.asset(AppAssets.icBook, color: AppColors.primary),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
