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
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          SizedBox(
            width: 125,
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    englishName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    arabicName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$versesCount Verses',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 153,
            height: 150,
            child: Image.asset(AppAssets.mostRecentBg, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
