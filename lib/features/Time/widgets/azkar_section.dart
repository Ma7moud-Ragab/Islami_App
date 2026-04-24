import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/azkar/screens/azkar_screen.dart';

class AzkarSection extends StatelessWidget {
  const AzkarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section label
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Azkar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Two cards side by side
        Row(
          children: [
            // Evening Azkar Card
            Expanded(
              child: _AzkarCard(
                title: 'Evening Azkar',
                image: AppAssets.eveningAzkar,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AzkarScreen()),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            // Morning Azkar Card
            Expanded(
              child: _AzkarCard(
                title: 'Morning Azkar',
                image: AppAssets.morningAzkar,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AzkarScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AzkarCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const _AzkarCard({
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E), // Dark background
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary, // Golden border
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 3D-style image - fills most of the card height
            Expanded(child: Image.asset(image, fit: BoxFit.contain)),
            const SizedBox(height: 4),
            // Title at bottom
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
