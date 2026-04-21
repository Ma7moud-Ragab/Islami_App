import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/features/Time/widgets/azkar_card.dart';
import 'package:islami/features/azkar/screens/azkar_screen.dart';

class AzkarSection extends StatelessWidget {
  const AzkarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AzkarCard(
      title: 'AZKARI',
      image: AppAssets.morningAzkar, // ممكن تغيّريه لصورة عامة للأذكار
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AzkarScreen(),
          ),
        );
      },
    );
  }
}