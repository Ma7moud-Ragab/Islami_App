import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/radio/widgets/radio_list_view.dart';
import 'package:islami/features/radio/widgets/reciters_list_view.dart';

enum RadioTab { radio, reciters }

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  RadioTab selectedTab = RadioTab.radio;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background
        Positioned.fill(
          child: Image.asset(AppAssets.radioBg, fit: BoxFit.cover),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(child: Image.asset(AppAssets.header)),
              const SizedBox(height: 20),

              /// Tabs
              Row(
                children: [
                  _buildTab(
                    title: 'Radio',
                    isSelected: selectedTab == RadioTab.radio,
                    onTap: () {
                      setState(() {
                        selectedTab = RadioTab.radio;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  _buildTab(
                    title: 'Reciters',
                    isSelected: selectedTab == RadioTab.reciters,
                    onTap: () {
                      setState(() {
                        selectedTab = RadioTab.reciters;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Content
              Expanded(
                child: IndexedStack(
                  index: selectedTab == RadioTab.radio ? 0 : 1,
                  children: const [RadioListView(), RecitersListView()],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
