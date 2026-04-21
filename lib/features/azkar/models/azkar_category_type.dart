enum AzkarCategoryType {
  morningAzkar,
  eveningAzkar,
  sleepAzkar,
  afterPrayerAzkar,
  generalDhikr,
}

extension AzkarCategoryTypeExtension on AzkarCategoryType {
  String get displayName {
    switch (this) {
      case AzkarCategoryType.morningAzkar:
        return 'Morning Azkar';
      case AzkarCategoryType.eveningAzkar:
        return 'Evening Azkar';
      case AzkarCategoryType.sleepAzkar:
        return 'Sleep Azkar';
      case AzkarCategoryType.afterPrayerAzkar:
        return 'After Prayer';
      case AzkarCategoryType.generalDhikr:
        return 'General Dhikr';
    }
  }
}
