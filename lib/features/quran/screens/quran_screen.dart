import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/most_recent_list_view.dart';
import '../widgets/sura_list_view.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Image.asset(AppAssets.quranBg, fit: BoxFit.fill)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Center(child: Image.asset(AppAssets.header)),
              SizedBox(height: 21.h),
              CustomTextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              Text(
                'Most Recently',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: SizedBox(
                  height: 150.h,
                  child: const MostRecentListView(),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Sura List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(child: SuraListView(searchQuery: searchQuery)),
            ],
          ),
        ),
      ],
    );
  }
}
