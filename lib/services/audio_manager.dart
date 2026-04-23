import 'package:just_audio/just_audio.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  final AudioPlayer player = AudioPlayer();
  String? currentSource; // 'radio' or 'reciter'
  String? currentlyPlayingUrl;

  Future<void> playRadio(String url) async {
    try {
      currentSource = 'radio';
      currentlyPlayingUrl = url;
      await player.stop();
      await player.setUrl(url);
      await player.play();
    } catch (e) {
      if (e is PlayerInterruptedException) {
        await Future.delayed(const Duration(seconds: 1));
        await playRadio(url); // Retry once
      } else {
        rethrow;
      }
    }
  }

  Future<void> playReciter(String url) async {
    try {
      currentSource = 'reciter';
      currentlyPlayingUrl = url;
      await player.stop();
      await player.setUrl(url);
      await player.play();
    } catch (e) {
      if (e is PlayerInterruptedException) {
        await Future.delayed(const Duration(seconds: 1));
        await playReciter(url); // Retry once
      } else {
        rethrow;
      }
    }
  }

  Future<void> stop() async {
    currentSource = null;
    currentlyPlayingUrl = null;
    await player.stop();
  }

  Future<void> pause() async {
    await player.pause();
  }

  Future<void> resume() async {
    await player.play();
  }

  void setVolume(double volume) {
    player.setVolume(volume);
  }
}
