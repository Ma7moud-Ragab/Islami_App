import 'package:flutter/material.dart';
import 'package:islami/features/radio/widgets/radio_card.dart';
import 'package:islami/features/radio/widgets/radio_model.dart';
import 'package:just_audio/just_audio.dart';

class RadioListView extends StatefulWidget {
  const RadioListView({super.key});

  @override
  State<RadioListView> createState() => _RadioListViewState();
}

class _RadioListViewState extends State<RadioListView> {
  late AudioPlayer _player;
  final radios = [
    RadioModel(
      name: 'Radio Ibrahim Al-Akdar',
      url: 'https://stream.radiojar.com/0tpy1h0kxtzuv',
    ),
    RadioModel(
      name: 'Radio Al-Qaria Yassen',
      url: 'https://stream.radiojar.com/4wqre23fytzuv',
    ),
    RadioModel(
      name: 'Radio Ahmed Al-trabulsi',
      url: 'https://stream.radiojar.com/4wqre23fytzuv',
    ),
  ];


 

Future<void> _onPlayPressed(int index) async {
    setState(() {
      for (int i = 0; i < radios.length; i++) {
        radios[i].isPlaying = i == index;
      }
    });

    await _player.stop();
    await _player.setUrl(radios[index].url);
    await _player.play();
  }


  void _onMutePressed(int index) {
    setState(() {
      radios[index].isMuted = !radios[index].isMuted;
    });

    _player.setVolume(radios[index].isMuted ? 0 : 1);
  }

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
      itemCount: radios.length,
      itemBuilder: (context, index) {
        final radio = radios[index];

        return RadioCard(
          radio: radio,
          onPlayTap: () => _onPlayPressed(index),
          onMuteTap: () => _onMutePressed(index),
        );
      },
    );
  }
}

