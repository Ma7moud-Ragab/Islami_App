import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets.dart';
import '../models/hadith_model.dart';

class HadithCarouselSlider extends StatelessWidget {
  final List<HadithModel> hadithList;

  const HadithCarouselSlider({super.key, required this.hadithList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: hadithList.length,
      itemBuilder: (context, index, realIndex) {
        final hadith = hadithList[index];

        return Container(
          width: 313,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(AppAssets.hadithCardBg),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Text(
                  hadith.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadith.content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        color: Colors.black87,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 0.65.sh,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
