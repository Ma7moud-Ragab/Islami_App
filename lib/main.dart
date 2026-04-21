import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/home/screens/home_screen.dart';

import 'core/constants/colors.dart';
import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/quran/models/sura_model.dart';
import 'features/quran/screens/quran_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Islami',
          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.secondary,
          ),

          home: const OnboardingScreen(),

          routes: {HomeScreen.routeName: (context) => const HomeScreen()},

          onGenerateRoute: (settings) {
            if (settings.name == QuranDetailsScreen.routeName) {
              final model = settings.arguments as SuraDetailsModel;
              return MaterialPageRoute(
                builder: (_) => QuranDetailsScreen(model: model),
              );
            }
            return null;
          },
        );
      },
    );
  }
}
