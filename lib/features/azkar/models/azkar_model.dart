class AzkarModel {
  final String arabicText;
  final int repetitionCount;
  final String? transliteration;

  AzkarModel({
    required this.arabicText,
    required this.repetitionCount,
    this.transliteration,
  });
}
