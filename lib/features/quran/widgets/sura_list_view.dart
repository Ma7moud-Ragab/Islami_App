import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/sura_model.dart';
import '../screens/quran_details_screen.dart';
import 'sura_list_item.dart';

class SuraListView extends StatelessWidget {
  final String searchQuery;

  const SuraListView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final filteredIndexes =
        List.generate(
          SuraDetailsModel.arabicAuranSuras.length,
          (i) => i,
        ).where((i) {
          final arabic = SuraDetailsModel.arabicAuranSuras[i].toLowerCase();
          final english = SuraDetailsModel.englishQuranSurahs[i].toLowerCase();
          final query = searchQuery.toLowerCase();
          return arabic.contains(query) || english.contains(query);
        }).toList();

    return ListView.separated(
      padding: EdgeInsets.only(top: 10.h),
      itemCount: filteredIndexes.length,
      separatorBuilder: (_, __) =>
          Divider(indent: 64.w, endIndent: 64.w, thickness: 1),
      itemBuilder: (context, index) {
        final i = filteredIndexes[index];

        return InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            QuranDetailsScreen.routeName,
            arguments: SuraDetailsModel(
              arabicName: SuraDetailsModel.arabicAuranSuras[i],
              englishName: SuraDetailsModel.englishQuranSurahs[i],
              verses: int.parse(SuraDetailsModel.AyaNumber[i]),
            ),
          ),
          child: Row(
            children: [
              SuraListItem(index: i),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SuraDetailsModel.englishQuranSurahs[i],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${SuraDetailsModel.AyaNumber[i]} verses',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                SuraDetailsModel.arabicAuranSuras[i],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
