import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/features/Time/widgets/azkar_card.dart';

class AzkarSection extends StatelessWidget {
  const AzkarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: AzkarCard(
            title: 'Evening Azkar',
            image: AppAssets.eveningAzkar,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: AzkarCard(
            title: 'Morning Azkar',
            image: AppAssets.morningAzkar,
          ),
        ),
      ],
    );
  }
}
