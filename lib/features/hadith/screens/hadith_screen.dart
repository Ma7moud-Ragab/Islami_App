import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/assets.dart';
import '../models/hadith_model.dart';
import '../widgets/hadith_carousel_slider.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadithModel> hadithList = [];

  @override
  void initState() {
    super.initState();
    _loadAllHadith();
  }

  Future<void> _loadAllHadith() async {
    final List<HadithModel> loadedHadith = [];

    for (int i = 1; i <= 50; i++) {
      final data = await rootBundle.loadString('assets/files/hadith/h$i.txt');

      final lines = data.split('\n');
      final title = lines.first;
      final content = lines.sublist(1).join('\n');

      loadedHadith.add(HadithModel(title: title, content: content));
    }

    setState(() {
      hadithList = loadedHadith;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset(AppAssets.header),
          const SizedBox(height: 40),
          Expanded(
            child: hadithList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : HadithCarouselSlider(hadithList: hadithList),
          ),
        ],
      ),
    );
  }
}
