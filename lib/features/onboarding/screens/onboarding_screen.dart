import 'package:flutter/material.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';
import '../models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<OnboardingModel> onboardingData = const [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: 'Welcome To Islami App',
      subtitle: '',
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: 'Welcome To Islami',
      subtitle: 'We are very excited to have you in our community',
    ),
    OnboardingModel(
      image: AppAssets.onboarding3,
      title: 'Reading the Quran',
      subtitle: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingModel(
      image: AppAssets.onboarding4,
      title: 'Bearish',
      subtitle: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingModel(
      image: AppAssets.onboarding5,
      title: 'Holy Quran Radio',
      subtitle:
          'You can listen to the Holy Quran Radio through the application easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final item = onboardingData[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.onboardingLogo),
                  const SizedBox(height: 16),
                   Image.asset(item.image,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  if (item.subtitle.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),

          /// Dots Indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: currentPage == index ? 20 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primary
                        : AppColors.third,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: TextButton(
              onPressed: () {
                if (currentPage < onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text(
                currentPage == onboardingData.length - 1 ? 'Done' : 'Next',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
