// ARCHITECTURE DOCUMENTATION FOR AZKAR FEATURE
// =============================================

/*
SCALABLE AZKAR SYSTEM

This architecture is designed to be easily extensible for future enhancements.

CURRENT STRUCTURE:
==================

1. AzkarModel (models/azkar_model.dart)
   - Represents a single Azkar item
   - Fields: arabicText, repetitionCount, transliteration
   - Can be extended with: source, category, language support, etc.

2. AzkarCategoryType (models/azkar_category_type.dart)
   - Enum for all available Azkar categories
   - Includes displayName extension for UI labels
   - Easy to add new categories

3. AzkarRepository/AzkarData (models/azkar_repository.dart)
   - Central data source for all Azkar content
   - Static methods to retrieve Azkar by category
   - Private factory methods for each category
   - Currently supports 5 categories:
     * Morning Azkar (Azkar Al-Sabah)
     * Evening Azkar (Azkar Al-Masaa)
     * Sleep Azkar
     * After Prayer Azkar
     * General Dhikr

4. AzkarScreen (screens/azkar_screen.dart)
   - Dynamically generates tabs based on available categories
   - Uses TabBar for navigation
   - Fully supports future category additions

5. AzkarListView & AzkarItemCard (widgets/)
   - Generic list view that works with any category
   - No hardcoded references to specific categories

HOW TO ADD A NEW CATEGORY:
==========================

Step 1: Add new enum value in AzkarCategoryType
   enum AzkarCategoryType {
     ...
     newCategoryHere,  // Add here
   }

Step 2: Add displayName case in extension
   case AzkarCategoryType.newCategoryHere:
     return 'Display Name Here';

Step 3: Add data retrieval in AzkarRepository
   static List<AzkarModel> _getNewCategory() => [
     AzkarModel(
       arabicText: 'Arabic text',
       repetitionCount: 1,
       transliteration: 'English translation',
     ),
     // More items...
   ];

Step 4: Add to _azkarDatabase map
   AzkarCategoryType.newCategoryHere: _getNewCategory(),

That's it! The UI will automatically update with the new category.

DATA ACCURACY GUIDELINES:
=========================

✓ Each Azkar is categorized based on authentic Islamic usage
✓ Morning Azkar: Said after Fajr prayer until sunrise
✓ Evening Azkar: Said after Asr or Maghrib until sunset
✓ Sleep Azkar: Said before going to sleep
✓ After Prayer Azkar: Said immediately after prayer
✓ General Dhikr: Can be said anytime
✓ No item duplication between categories
✓ Repetition counts based on Islamic sources

FUTURE ENHANCEMENTS:
====================

1. Add Islamic source references to AzkarModel
2. Support for multiple languages
3. Audio pronunciation feature
4. Favorites/bookmarks system
5. Daily reminder notifications
6. Progress tracking per category
7. Search functionality
8. Widget for home screen shortcut
*/
