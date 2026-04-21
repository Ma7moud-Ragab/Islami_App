import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';

class RotateOnTap extends StatefulWidget {
  static int count = 0;
  static String text = 'سبحان الله';
  final VoidCallback? onUpdate;
  const RotateOnTap({super.key, required this.onUpdate});
  @override
  // ignore: library_private_types_in_public_api
  _RotateOnTapState createState() => _RotateOnTapState();
}

class _RotateOnTapState extends State<RotateOnTap> {
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          angle += pi / 15;
          RotateOnTap.count++;
          switch (RotateOnTap.count) {
            case 33:
              RotateOnTap.text = 'الحمد لله';
              break;
            case 66:
              RotateOnTap.text = 'الله أكبر';
              break;
            case 99:
              RotateOnTap.count = 0;
              RotateOnTap.text = 'سبحان الله';
              break;
          }
        });
        widget.onUpdate!();
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: angle),
        duration: Duration(milliseconds: 200),
        builder: (context, value, child) {
          return Transform.rotate(angle: value, child: child);
        },
        child: Image.asset(AppAssets.sebhaBody, fit: BoxFit.fill),
      ),
    );
  }
}
