import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/radio/widgets/radio_model.dart';
import '../../../services/audio_manager.dart';

class RadioCard extends StatefulWidget {
  final RadioModel radio;
  final VoidCallback onPlayTap;
  final VoidCallback onMuteTap;
  final bool isReciter;

  const RadioCard({
    super.key,
    required this.radio,
    required this.onPlayTap,
    required this.onMuteTap,
    this.isReciter = false,
  });

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    final cardColor = AppColors.primary;

    final textColor = Colors.black;
    final iconColor = Colors.black;

    final isPlaying = AudioManager().currentlyPlayingUrl == widget.radio.url;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // Background image - behind all content
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                isPlaying
                    ? AppAssets.radioOn
                    : AppAssets.radioOff,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          Column(
            children: [
              Text(
                widget.radio.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 32,
                    onPressed: widget.onPlayTap,
                    icon: Icon(
                      color: iconColor,
                      isPlaying ? Icons.pause_circle : Icons.play_circle,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    iconSize: 28,
                    onPressed: () {
                      setState(() {
                        isMuted = !isMuted;
                      });
                      AudioManager().setVolume(isMuted ? 0 : 1);
                    },
                    icon: Icon(
                      color: iconColor,
                      isMuted ? Icons.volume_off : Icons.volume_up,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
