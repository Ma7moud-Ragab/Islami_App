// DEPRECATED: Use AzkarRepository instead
// This file is kept for backward compatibility only
// All Azkar data and categorization has been moved to azkar_repository.dart

import 'azkar_category_type.dart';
import 'azkar_repository.dart';

@Deprecated('Use AzkarRepository instead')
class MorningAzkar {
  static List<dynamic> getAzkar() {
    return AzkarData.getByCategory(AzkarCategoryType.morningAzkar);
  }
}

@Deprecated('Use AzkarRepository instead')
class EveningAzkar {
  static List<dynamic> getAzkar() {
    return AzkarData.getByCategory(AzkarCategoryType.eveningAzkar);
  }
}
