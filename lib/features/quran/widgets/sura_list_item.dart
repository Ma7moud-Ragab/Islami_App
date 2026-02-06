import 'package:flutter/material.dart';

import '../../../core/constants/assets.dart';

class SuraListItem extends StatelessWidget {
  final int index;

  const SuraListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.suraNumberFrame)),
      ),
      child: Center(
        child: Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
