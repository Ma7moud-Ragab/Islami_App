import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/assets.dart';

class MostRecentItem extends StatelessWidget {
  final String englishName;
  final String arabicName;
  final int versesCount;

  const MostRecentItem({
    super.key,
    required this.englishName,
    required this.arabicName,
    required this.versesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  englishName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  arabicName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '$versesCount Verses',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.asset(AppAssets.mostRecentBg, width: 153, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
