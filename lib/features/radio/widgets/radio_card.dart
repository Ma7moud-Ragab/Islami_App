import 'package:flutter/material.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/radio/widgets/radio_model.dart';

class RadioCard extends StatelessWidget {
  final RadioModel radio;
  final VoidCallback onPlayTap;
  final VoidCallback onMuteTap;

  const RadioCard({
    super.key,
    required this.radio,
    required this.onPlayTap,
    required this.onMuteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            radio.name,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 32,
                onPressed: onPlayTap,
                icon: Icon(
                  color: Colors.black,
                  radio.isPlaying ? Icons.pause_circle : Icons.play_circle,
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                iconSize: 28,
                onPressed: onMuteTap,
                icon: Icon( color: Colors.black,radio.isMuted ? Icons.volume_off : Icons.volume_up),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
