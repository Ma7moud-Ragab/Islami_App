import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'most_recent_item.dart';

class MostRecentListView extends StatelessWidget {
  const MostRecentListView({super.key});

  final List<Map<String, dynamic>> _surahs = const [
    {'englishName': 'Al-Fatiha', 'arabicName': 'الفاتحة', 'versesCount': 7},
    {'englishName': 'Al-Baqarah', 'arabicName': 'البقرة', 'versesCount': 286},
    {'englishName': 'Al-Kahf', 'arabicName': 'الكهف', 'versesCount': 110},
    {'englishName': 'Yaseen', 'arabicName': 'يس', 'versesCount': 83},
    {'englishName': 'Al-Mulk', 'arabicName': 'الملك', 'versesCount': 30},
    {'englishName': 'Al-Anbiya', 'arabicName': 'الأنبياء', 'versesCount': 112},
    {'englishName': 'Al-Rahman', 'arabicName': 'الرحمن', 'versesCount': 78},
    {'englishName': 'Al-Waqiah', 'arabicName': 'الواقعة', 'versesCount': 96},
    {'englishName': 'Al-Muzzammil', 'arabicName': 'المزمل', 'versesCount': 20},
    {'englishName': 'Al-Ikhlas', 'arabicName': 'الإخلاص', 'versesCount': 4},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _surahs.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: MostRecentItem(
            englishName: _surahs[index]['englishName'],
            arabicName: _surahs[index]['arabicName'],
            versesCount: _surahs[index]['versesCount'],
          ),
        );
      },
    );
  }
}
