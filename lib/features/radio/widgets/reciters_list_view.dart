import 'package:flutter/material.dart';
import 'package:islami/features/radio/widgets/radio_card.dart';
import 'package:islami/features/radio/widgets/radio_model.dart';
import 'package:just_audio/just_audio.dart';

class RecitersListView extends StatefulWidget {
  const RecitersListView({super.key});

  @override
  State<RecitersListView> createState() => _RecitersListViewState();
}

class _RecitersListViewState extends State<RecitersListView> {
  final reciters = [
    RadioModel(
      name: 'Abdul Basit Abdul Samad',
      url:
          'https://server16.mp3quran.net/nufais/Rewayat-Hafs-A-n-Assem/056.mp3',
    ),
    RadioModel(
      name: 'Mahmoud Khalil Al-Husary',
      url:
          'https://server16.mp3quran.net/nufais/Rewayat-Hafs-A-n-Assem/054.mp3',
    ),
    RadioModel(
      name: 'Mishary Rashid Alafasy',
      url: 'https://example.com/alafasy.mp3',
    ),
    RadioModel(name: 'Saad Al-Ghamdi', url: 'https://example.com/ghamdi.mp3'),
  ];

  Future<void> _onPlayPressed(int index) async {
    setState(() {
      for (int i = 0; i < reciters.length; i++) {
        reciters[i].isPlaying = i == index;
      }
    });

    await _player.stop();
    await _player.setUrl(reciters[index].url);
    await _player.play();
  }

  void _onMutePressed(int index) {
    setState(() {
      reciters[index].isMuted = !reciters[index].isMuted;
    });

    _player.setVolume(reciters[index].isMuted ? 0 : 1);
  }

  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: reciters.length,
      itemBuilder: (context, index) {
        final reciter = reciters[index];

        return RadioCard(
          radio: reciter,
          onPlayTap: () => _onPlayPressed(index),
          onMuteTap: () => _onMutePressed(index),
        );
      },
    );
  }
}
