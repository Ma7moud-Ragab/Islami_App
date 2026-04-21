import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'most_recent_item.dart';

class MostRecentListView extends StatelessWidget {
  const MostRecentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: const MostRecentItem(
            englishName: 'Al-Anbiya',
            arabicName: 'الأنبياء',
            versesCount: 112,
          ),
        );
      },
    );
  }
}
