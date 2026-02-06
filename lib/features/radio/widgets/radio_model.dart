class RadioModel {
  final String name;
  final String url;
  bool isPlaying;
  bool isMuted;

  RadioModel({
    required this.name,
    required this.url,
    this.isPlaying = false,
    this.isMuted = false,
  });
}
