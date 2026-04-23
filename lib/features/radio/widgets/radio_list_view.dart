import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/features/radio/widgets/radio_card.dart';
import 'package:islami/features/radio/widgets/radio_model.dart';
import 'package:provider/provider.dart';
import '../../../providers/radio_provider.dart';
import '../../../services/audio_manager.dart';

class RadioListView extends StatefulWidget {
  const RadioListView({super.key});

  @override
  State<RadioListView> createState() => _RadioListViewState();
}

class _RadioListViewState extends State<RadioListView> {
  late StreamSubscription _playerSubscription;

  @override
  void initState() {
    super.initState();
    // Fetch radios when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RadioProvider>().fetchRadios();
    });
    // Listen to player state changes
    _playerSubscription = AudioManager().player.playerStateStream.listen((
      state,
    ) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _playerSubscription.cancel();
    super.dispose();
  }

  Future<void> _onPlayPressed(String url) async {
    try {
      if (AudioManager().currentlyPlayingUrl == url) {
        await AudioManager().stop();
      } else {
        await AudioManager().playRadio(url);
      }
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذّر تشغيل الصوت، تحقق من الإنترنت')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioProvider>(
      builder: (context, provider, child) {
        final radiosModel = provider.radios;
        final isLoading = provider.isLoading;
        final error = provider.error;

        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error != null) {
          return Center(
            child: Text(error, style: const TextStyle(color: Colors.red)),
          );
        }

        if (radiosModel == null || radiosModel.radios.isEmpty) {
          return const Center(
            child: Text(
              'No radios available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          itemCount: radiosModel.radios.length,
          itemBuilder: (context, index) {
            final radio = radiosModel.radios[index];
            final radioModel = RadioModel(name: radio.name, url: radio.url);

            return RadioCard(
              radio: radioModel,
              onPlayTap: () => _onPlayPressed(radio.url),
              onMuteTap: () {},
            );
          },
        );
      },
    );
  }
}
