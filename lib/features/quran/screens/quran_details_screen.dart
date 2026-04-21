import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/assets.dart';
import '../models/sura_model.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = '/quran-details';
  final SuraDetailsModel model;

  const QuranDetailsScreen({super.key, required this.model});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> sura = [];

  @override
  void initState() {
    super.initState();
    final suraIndex = SuraDetailsModel.arabicAuranSuras.indexOf(
      widget.model.arabicName,
    );

    _loadSura('assets/files/quran/${suraIndex + 1}.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        iconTheme: const IconThemeData(color: AppColors.primary),
        centerTitle: true,
        title: Text(
          widget.model.englishName,
          style: const TextStyle(color: AppColors.primary),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppAssets.quranDetailsBg),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(
              widget.model.arabicName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sura.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '[${index + 1}] ${sura[index]}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadSura(String path) async {
    final content = await rootBundle.loadString(path);
    sura = content.split('\n');
    setState(() {});
  }
}
