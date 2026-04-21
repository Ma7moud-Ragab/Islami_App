import 'azkar_model.dart';
import 'azkar_category_type.dart';

class AzkarData {
  static final Map<AzkarCategoryType, List<AzkarModel>> _azkarDatabase = {
    AzkarCategoryType.morningAzkar: _getMorningAzkar(),
    AzkarCategoryType.eveningAzkar: _getEveningAzkar(),
    AzkarCategoryType.sleepAzkar: _getSleepAzkar(),
    AzkarCategoryType.afterPrayerAzkar: _getAfterPrayerAzkar(),
    AzkarCategoryType.generalDhikr: _getGeneralDhikr(),
  };

  static List<AzkarModel> getByCategory(AzkarCategoryType category) {
    return _azkarDatabase[category] ?? [];
  }

  static List<AzkarCategoryType> getAllCategories() {
    return AzkarCategoryType.values;
  }

  // ============= MORNING AZKAR (Azkar Al-Sabah) =============
  // Said after Fajr prayer until sunrise
  static List<AzkarModel> _getMorningAzkar() => [
    AzkarModel(
      arabicText:
          'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ رَبِّ الْعَالَمِينَ',
      repetitionCount: 1,
      transliteration:
          'We have reached the morning, and with it Allah has reached the morning - the Master of all realms',
    ),
    AzkarModel(
      arabicText:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ هَذَا الْيَوْمِ: فَتْحَهُ وَنَصْرَهُ وَنُورَهُ وَبَرَكَتَهُ وَهُدَاهُ',
      repetitionCount: 1,
      transliteration:
          'O Allah, I ask You for the good of this day: its opening, its victory, its light, its blessing, and its guidance',
    ),
    AzkarModel(
      arabicText:
          'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ',
      repetitionCount: 1,
      transliteration:
          'O Allah, by You we have entered the morning and by You we enter the evening, by You we live and by You we die, and to You is the resurrection',
    ),
    AzkarModel(
      arabicText: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
      repetitionCount: 100,
      transliteration: 'Glory be to Allah and praise be to Him',
    ),
    AzkarModel(
      arabicText:
          'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ',
      repetitionCount: 10,
      transliteration:
          'There is no deity except Allah alone, with no partner. To Him belongs dominion and praise',
    ),
    AzkarModel(
      arabicText: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      repetitionCount: 10,
      transliteration: 'There is no might nor power except with Allah',
    ),
    AzkarModel(
      arabicText: 'سُبْحَانَ اللَّهِ',
      repetitionCount: 33,
      transliteration: 'Glory be to Allah',
    ),
    AzkarModel(
      arabicText: 'الْحَمْدُ لِلَّهِ',
      repetitionCount: 33,
      transliteration: 'All praise is due to Allah',
    ),
    AzkarModel(
      arabicText: 'اللَّهُ أَكْبَرُ',
      repetitionCount: 33,
      transliteration: 'Allah is the Greatest',
    ),
  ];

  // ============= EVENING AZKAR (Azkar Al-Masaa) =============
  // Said after Asr or Maghrib until sunset
  static List<AzkarModel> _getEveningAzkar() => [
    AzkarModel(
      arabicText: 'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ رَبِّ الْعَالَمِينَ',
      repetitionCount: 1,
      transliteration:
          'We have reached the evening, and with it Allah has reached the evening - the Master of all realms',
    ),
    AzkarModel(
      arabicText:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ هَذِهِ اللَّيْلَةِ: فَتْحَهَا وَنَصْرَهَا وَنُورَهَا وَبَرَكَتَهَا',
      repetitionCount: 1,
      transliteration:
          'O Allah, I ask You for the good of this night: its opening, its victory, its light, and its blessing',
    ),
    AzkarModel(
      arabicText:
          'اللَّهُمَّ إِنَّا نَسْأَلُكَ السَّلَامَةَ فِي الدُّنْيَا وَالْآخِرَةِ',
      repetitionCount: 1,
      transliteration:
          'O Allah, we ask You for safety in this world and the Hereafter',
    ),
    AzkarModel(
      arabicText: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
      repetitionCount: 100,
      transliteration: 'Glory be to Allah and praise be to Him',
    ),
    AzkarModel(
      arabicText: 'لَا إِلَٰهَ إِلَّا اللَّهُ الْعَظِيمُ الْحَلِيمُ',
      repetitionCount: 10,
      transliteration:
          'There is no deity except Allah, the Mighty, the Forbearing',
    ),
    AzkarModel(
      arabicText: 'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ',
      repetitionCount: 10,
      transliteration: 'There is no deity except Allah alone, with no partner',
    ),
    AzkarModel(
      arabicText: 'سُبْحَانَ اللَّهِ',
      repetitionCount: 33,
      transliteration: 'Glory be to Allah',
    ),
    AzkarModel(
      arabicText: 'الْحَمْدُ لِلَّهِ',
      repetitionCount: 33,
      transliteration: 'All praise is due to Allah',
    ),
    AzkarModel(
      arabicText: 'اللَّهُ أَكْبَرُ',
      repetitionCount: 34,
      transliteration: 'Allah is the Greatest',
    ),
  ];

  // ============= SLEEP AZKAR =============
  // Said before going to sleep
  static List<AzkarModel> _getSleepAzkar() => [
    AzkarModel(
      arabicText: 'اللَّهُمَّ بِاسْمِكَ أَمُوتُ وَأَحْيَا',
      repetitionCount: 1,
      transliteration: 'O Allah, in Your name I die and live',
    ),
    AzkarModel(
      arabicText: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
      repetitionCount: 1,
      transliteration:
          'In the name of Allah, the Most Gracious, the Most Merciful',
    ),
    AzkarModel(
      arabicText:
          'الْحَمْدُ لِلَّهِ الَّذِي خَلَقَ السَّمَوَاتِ وَالْأَرْضَ وَجَعَلَ الظُّلُمَاتِ وَالنُّورَ',
      repetitionCount: 1,
      transliteration:
          'All praise is due to Allah who created the heavens and the earth, and made darkness and light',
    ),
    AzkarModel(
      arabicText:
          'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ، أَشْهَدُ أَن لَّا إِلَٰهَ إِلَّا أَنتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ',
      repetitionCount: 1,
      transliteration:
          'Glory be to You, O Allah, and praise. I testify that there is no deity except You. I seek Your forgiveness and repent to You',
    ),
    AzkarModel(
      arabicText:
          'إِذَا أَوَيْتَ إِلَىٰ فِرَاشِكَ فَقُلْ: سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ',
      repetitionCount: 1,
      transliteration:
          'When you go to bed, say: Glory be to Allah and all praise is due to Allah',
    ),
    AzkarModel(
      arabicText: 'سُبْحَانَ اللَّهِ',
      repetitionCount: 33,
      transliteration: 'Glory be to Allah',
    ),
    AzkarModel(
      arabicText: 'الْحَمْدُ لِلَّهِ',
      repetitionCount: 33,
      transliteration: 'All praise is due to Allah',
    ),
    AzkarModel(
      arabicText: 'اللَّهُ أَكْبَرُ',
      repetitionCount: 34,
      transliteration: 'Allah is the Greatest',
    ),
  ];

  // ============= AFTER PRAYER AZKAR =============
  // Said immediately after completing prayer
  static List<AzkarModel> _getAfterPrayerAzkar() => [
    AzkarModel(
      arabicText: 'أَسْتَغْفِرُ اللَّهَ',
      repetitionCount: 3,
      transliteration: 'I seek forgiveness from Allah',
    ),
    AzkarModel(
      arabicText:
          'اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ، تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ',
      repetitionCount: 1,
      transliteration:
          'O Allah, You are As-Salam and from You comes peace. You are blessed, O Lord of Majesty and Honor',
    ),
    AzkarModel(
      arabicText: 'سُبْحَانَ اللَّهِ',
      repetitionCount: 33,
      transliteration: 'Glory be to Allah',
    ),
    AzkarModel(
      arabicText: 'الْحَمْدُ لِلَّهِ',
      repetitionCount: 33,
      transliteration: 'All praise is due to Allah',
    ),
    AzkarModel(
      arabicText: 'اللَّهُ أَكْبَرُ',
      repetitionCount: 33,
      transliteration: 'Allah is the Greatest',
    ),
    AzkarModel(
      arabicText:
          'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
      repetitionCount: 10,
      transliteration:
          'There is no deity except Allah alone, with no partner. To Him belongs dominion and praise, and He has power over all things',
    ),
  ];

  // ============= GENERAL DHIKR =============
  // General remembrance for anytime
  static List<AzkarModel> _getGeneralDhikr() => [
    AzkarModel(
      arabicText: 'سُبْحَانَ اللَّهِ',
      repetitionCount: 10,
      transliteration: 'Glory be to Allah',
    ),
    AzkarModel(
      arabicText: 'الْحَمْدُ لِلَّهِ',
      repetitionCount: 10,
      transliteration: 'All praise is due to Allah',
    ),
    AzkarModel(
      arabicText: 'اللَّهُ أَكْبَرُ',
      repetitionCount: 10,
      transliteration: 'Allah is the Greatest',
    ),
    AzkarModel(
      arabicText: 'لَا إِلَٰهَ إِلَّا اللَّهُ',
      repetitionCount: 10,
      transliteration: 'There is no deity except Allah',
    ),
    AzkarModel(
      arabicText:
          'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ الْعَلِيِّ الْعَظِيمِ',
      repetitionCount: 10,
      transliteration:
          'There is no might nor power except with Allah, the Most High, the Most Great',
    ),
    AzkarModel(
      arabicText:
          'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ',
      repetitionCount: 1,
      transliteration:
          'Glory and praise be to Allah, and glory be to Allah the Mighty',
    ),
    AzkarModel(
      arabicText:
          'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
      repetitionCount: 1,
      transliteration:
          'Our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire',
    ),
    AzkarModel(
      arabicText:
          'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ شَرِّ مَا عَمِلْتُ وَمِنْ شَرِّ مَا لَمْ أَعْمَلْ',
      repetitionCount: 1,
      transliteration:
          'O Allah, I seek refuge with You from the evil of what I have done and the evil of what I have not done',
    ),
    AzkarModel(
      arabicText:
          'اللَّهُمَّ اغْفِرْ لِي ذَنْبِي كُلَّهُ، دِقَّهُ وَجِلَّهُ، أَوَّلَهُ وَآخِرَهُ',
      repetitionCount: 1,
      transliteration:
          'O Allah, forgive me all my sins, the small and the great, the first and the last',
    ),
  ];
}
