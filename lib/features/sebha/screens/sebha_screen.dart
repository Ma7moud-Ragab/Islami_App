import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/features/sebha/widgets/rotate_on_tap.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAssets.sebhaBg, fit: BoxFit.fill),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image(image: AssetImage(AppAssets.header))),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'سُبِّحِ اسْمَ رَبِّكَ الأَعْلَى',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Center(child: Image.asset(AppAssets.sebhaHeader)),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: RotateOnTap(
                            onUpdate: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          RotateOnTap.text,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${RotateOnTap.count}',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
