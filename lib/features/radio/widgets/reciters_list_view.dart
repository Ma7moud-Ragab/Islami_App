import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/features/radio/widgets/radio_card.dart';
import 'package:islami/features/radio/widgets/radio_model.dart';
import 'package:provider/provider.dart';
import '../../../providers/reciter_provider.dart';
import '../../../services/audio_manager.dart';

class RecitersListView extends StatefulWidget {
  const RecitersListView({super.key});

  @override
  State<RecitersListView> createState() => _RecitersListViewState();
}

class _RecitersListViewState extends State<RecitersListView> {
  late StreamSubscription _playerSubscription;

  @override
  void initState() {
    super.initState();
    // Fetch reciters if not already fetched
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ReciterProvider>();
      if (provider.reciters == null) {
        provider.fetchReciters();
      }
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
        await AudioManager().playReciter(url);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذّر تشغيل الصوت، تحقق من الإنترنت')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReciterProvider>(
      builder: (context, provider, child) {
        final recitersModel = provider.reciters;
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

        if (recitersModel == null || recitersModel.reciters.isEmpty) {
          return const Center(
            child: Text(
              'No reciters available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: recitersModel.reciters.length,
          itemBuilder: (context, index) {
            final reciter = recitersModel.reciters[index];
            // Use first moshaf for sample, surah 1
            final sampleUrl = reciter.moshaf.isNotEmpty
                ? reciter.moshaf[0].getAudioUrl(1)
                : '';
            final radioModel = RadioModel(name: reciter.name, url: sampleUrl);

            return RadioCard(
              radio: radioModel,
              onPlayTap: () => _onPlayPressed(sampleUrl),
              onMuteTap: () {},
              isReciter: true,
            );
          },
        );
      },
    );
  }
}
