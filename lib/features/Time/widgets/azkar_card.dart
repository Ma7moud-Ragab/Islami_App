import 'package:flutter/material.dart';
import 'package:islami/core/constants/colors.dart';

class AzkarCard extends StatelessWidget {
  final String title;
  final String image;

  const AzkarCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        children: [
          Image.asset(image, height: 150),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
