import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';

import 'widgets/pray_time_card.dart';
import 'widgets/azkar_section.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
        Positioned.fill(
          child: Image.asset(AppAssets.timeBg, fit: BoxFit.cover),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(child: Image.asset(AppAssets.header)),
              const SizedBox(height: 20),

              const SizedBox(height: 24),

              // Pray Time Card
              const PrayerTimeCard(),

              const SizedBox(height: 24),

              //Azkar
              const AzkarSection(),
            ],
          ),
        ),
      ],
    );
  }
}
