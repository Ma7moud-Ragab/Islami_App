📐 SYSTEM ARCHITECTURE OVERVIEW
================================

FILE STRUCTURE
==============

lib/features/azkar/
│
├── 📄 azkar.dart                          (Export barrel)
│   └─ Exports all public APIs
│
├── 📁 models/
│   ├── azkar_model.dart                   (Data class - Unchanged)
│   │   └─ class AzkarModel
│   │      ├─ arabicText: String
│   │      ├─ repetitionCount: int
│   │      └─ transliteration: String?
│   │
│   ├── azkar_category_type.dart          (NEW - Category Enum)
│   │   ├─ enum AzkarCategoryType
│   │   │  ├─ morningAzkar
│   │   │  ├─ eveningAzkar
│   │   │  ├─ sleepAzkar
│   │   │  ├─ afterPrayerAzkar
│   │   │  └─ generalDhikr
│   │   │
│   │   └─ extension AzkarCategoryTypeExtension
│   │      └─ displayName property
│   │
│   ├── azkar_repository.dart             (NEW - Data Repository)
│   │   └─ class AzkarData (static)
│   │      ├─ _azkarDatabase (Map)
│   │      ├─ getByCategory(type)
│   │      ├─ getAllCategories()
│   │      ├─ _getMorningAzkar()
│   │      ├─ _getEveningAzkar()
│   │      ├─ _getSleepAzkar()
│   │      ├─ _getAfterPrayerAzkar()
│   │      └─ _getGeneralDhikr()
│   │
│   └── azkar_category.dart               (Deprecated - Backward compatible)
│       ├─ @Deprecated MorningAzkar
│       └─ @Deprecated EveningAzkar
│
├── 📁 screens/
│   └── azkar_screen.dart                 (UPDATED - Main Screen)
│       ├─ AzkarScreen (StatefulWidget)
│       │  ├─ TabController (dynamic length)
│       │  ├─ TabBar (generated from categories)
│       │  └─ TabBarView (generated views)
│       │
│       └─ _AzkarScreenState
│          ├─ _categories (List<AzkarCategoryType>)
│          ├─ _tabController
│          ├─ initState()
│          ├─ dispose()
│          └─ build()
│
├── 📁 widgets/
│   ├── azkar_item_card.dart              (Generic card - Unchanged)
│   │   ├─ AzkarItemCard (StatefulWidget)
│   │   │  ├─ azkar: AzkarModel
│   │   │  └─ onTap: VoidCallback
│   │   │
│   │   └─ _AzkarItemCardState
│   │      ├─ _tapController (AnimationController)
│   │      ├─ _currentCount (int)
│   │      ├─ _onCardTap()
│   │      └─ build() → ScaleTransition
│   │
│   └── azkar_list_view.dart              (Generic list - Unchanged)
│       ├─ AzkarListView (StatefulWidget)
│       │  └─ azkarList: List<AzkarModel>
│       │
│       └─ _AzkarListViewState
│          ├─ _onAzkarTap()
│          └─ build() → ListView.builder
│
├── 📘 ARCHITECTURE.md                     (Developer guide)
├── 📗 REFACTORING_SUMMARY.md             (Detailed changes)
└── 📕 QUICK_START.md                     (Quick reference)


DATA FLOW
=========

┌─────────────────────────────────────────┐
│         AzkarData Repository            │
│  (Static | Centralized Data Source)     │
├─────────────────────────────────────────┤
│  _azkarDatabase: Map<Type, List<Model>> │
│                                         │
│  Morning:    [AzkarModel, ...]    (9)  │
│  Evening:    [AzkarModel, ...]    (9)  │
│  Sleep:      [AzkarModel, ...]    (8)  │
│  AfterPray:  [AzkarModel, ...]    (6)  │
│  General:    [AzkarModel, ...]    (9)  │
└─────────────────────────────────────────┘
           ▲           ▲
           │           │
    ┌──────┘           └──────┐
    │                         │
    │                         │
┌──────────────────┐  ┌──────────────────┐
│  AzkarScreen     │  │  (Future Uses)   │
│  Gets All        │  │  - Dashboard     │
│  Categories      │  │  - Widgets       │
│  Builds Tabs     │  │  - Reminders     │
└──────────────────┘  └──────────────────┘
        │
        │ For Each Category
        │
        ▼
┌──────────────────────────────────────────┐
│         AzkarListView                    │
│  (Generic List Container)                │
├──────────────────────────────────────────┤
│  ListView.builder(                       │
│    itemCount: azkarList.length,         │
│    itemBuilder: (context, index) =>     │
│      AzkarItemCard(...)                 │
│  )                                       │
└──────────────────────────────────────────┘
        │
        │ For Each Item
        │
        ▼
┌──────────────────────────────────────────┐
│         AzkarItemCard                    │
│  (Generic Card Widget)                   │
├──────────────────────────────────────────┤
│  - Arabic Text (RTL)                    │
│  - Counter Display                      │
│  - Transliteration                      │
│  - Scale Animation on Tap               │
│  - Decrement Count on Tap               │
└──────────────────────────────────────────┘


CATEGORY IMPLEMENTATION PATTERN
================================

Example: Morning Azkar Implementation

┌─────────────────────────────────────────┐
│  AzkarCategoryType Enum                 │
├─────────────────────────────────────────┤
│  morningAzkar,                          │
│  ...                                    │
└─────────────────────────────────────────┘
           │
           ▼ displayName
┌─────────────────────────────────────────┐
│  Extension (String)                     │
├─────────────────────────────────────────┤
│  'Morning Azkar'                        │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│  AzkarData._getMorningAzkar()           │
├─────────────────────────────────────────┤
│  Returns List<AzkarModel>               │
│  [                                      │
│    AzkarModel(                          │
│      arabicText: '...',                 │
│      repetitionCount: 1,                │
│      transliteration: '...'             │
│    ),                                   │
│    ...                                  │
│  ]                                      │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│  _azkarDatabase Map Entry               │
├─────────────────────────────────────────┤
│  AzkarCategoryType.morningAzkar:        │
│    _getMorningAzkar()                   │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│  Access Pattern                         │
├─────────────────────────────────────────┤
│  AzkarData.getByCategory(               │
│    AzkarCategoryType.morningAzkar       │
│  )                                      │
│  ↓                                      │
│  Returns: List<AzkarModel>              │
└─────────────────────────────────────────┘


UI GENERATION FLOW
==================

1. User Opens AzkarScreen
   ↓
2. _AzkarScreenState.initState()
   ├─ _categories = AzkarData.getAllCategories()
   │  Returns: [morning, evening, sleep, after-prayer, general]
   │
   └─ _tabController = TabController(length: 5)
   ↓
3. build() Generates UI
   ├─ AppBar with TabBar
   │  ├─ Tab 1: Morning Azkar     (from .displayName)
   │  ├─ Tab 2: Evening Azkar     (from .displayName)
   │  ├─ Tab 3: Sleep Azkar       (from .displayName)
   │  ├─ Tab 4: After Prayer      (from .displayName)
   │  └─ Tab 5: General Dhikr     (from .displayName)
   │
   └─ TabBarView
      ├─ Tab 1 → AzkarListView(morningAzkar)
      ├─ Tab 2 → AzkarListView(eveningAzkar)
      ├─ Tab 3 → AzkarListView(sleepAzkar)
      ├─ Tab 4 → AzkarListView(afterPrayerAzkar)
      └─ Tab 5 → AzkarListView(generalDhikr)
   ↓
4. Each AzkarListView Renders Items
   └─ ListView with AzkarItemCard for each item
   ↓
5. User Interacts
   └─ Tap Card → Counter Decrements


DEPENDENCY GRAPH
================

External Dependencies:
  ├─ flutter/material.dart
  ├─ flutter_screenutil
  └─ app/constants/colors.dart

Internal Dependencies:
  ├─ AzkarScreen depends on:
  │  ├─ AzkarCategoryType
  │  ├─ AzkarData
  │  └─ AzkarListView
  │
  ├─ AzkarListView depends on:
  │  ├─ AzkarModel
  │  └─ AzkarItemCard
  │
  ├─ AzkarItemCard depends on:
  │  └─ AzkarModel
  │
  ├─ AzkarData depends on:
  │  ├─ AzkarModel
  │  └─ AzkarCategoryType
  │
  └─ AzkarCategoryType is standalone


EXTENSIBILITY POINTS
====================

1. Adding New Azkar Categories
   - Modify: AzkarCategoryType enum
   - Modify: AzkarCategoryTypeExtension
   - Modify: AzkarData class (add static method + map entry)
   - Result: UI auto-updates with new tab

2. Modifying Azkar Content
   - Modify: _getXxxAzkar() methods in AzkarData
   - No UI changes needed
   - Changes apply immediately

3. Adding Azkar Properties
   - Modify: AzkarModel class (add fields)
   - Modify: _getXxxAzkar() methods
   - Modify: AzkarItemCard.build() to display new fields

4. Changing Category Display Names
   - Modify: AzkarCategoryTypeExtension.displayName
   - Changes apply immediately to all tabs

5. Future Features
   - Audio: Add audioUrl to AzkarModel
   - Source: Add source reference to AzkarModel
   - Favorites: Add favorite flag to AzkarModel
   - Progress: Create separate tracking structure


BACKWARD COMPATIBILITY LAYER
=============================

Old Code:
  MorningAzkar.getAzkar()
  EveningAzkar.getAzkar()

Implementation (In azkar_category.dart):
  @Deprecated('Use AzkarRepository instead')
  class MorningAzkar {
    static List<dynamic> getAzkar() {
      return AzkarData.getByCategory(
        AzkarCategoryType.morningAzkar
      );
    }
  }

Result:
  ✓ Old code still works
  ✓ IDE shows deprecation warning
  ✓ No breaking changes
  ✓ Encourages migration to new system


PERFORMANCE CHARACTERISTICS
===========================

Memory:
  - Static data: Loaded once at app start
  - No dynamic allocations in UI
  - Minimal footprint

Speed:
  - Map lookup: O(1) average
  - Tab switching: Instant
  - No async operations

UI Rendering:
  - ListView with itemBuilder: Efficient
  - Only visible items rendered
  - Smooth animations maintained

Scaling:
  - Adding categories: Linear time
  - Adding Azkar items: Linear space
  - UI update: Automatic


TESTING COVERAGE
================

Unit Tests (Recommended):
  ✓ AzkarData.getByCategory() returns correct items
  ✓ AzkarData.getAllCategories() returns all types
  ✓ Each category has unique items (no duplicates)
  ✓ Repetition counts are valid (> 0)
  ✓ Arabic text is not empty
  ✓ displayName exists for all categories

Widget Tests (Recommended):
  ✓ AzkarScreen renders correct number of tabs
  ✓ Tab switching works smoothly
  ✓ AzkarItemCard displays correctly
  ✓ Counter decrements on tap
  ✓ RTL text displays correctly

Integration Tests (Recommended):
  ✓ Full screen interaction flow
  ✓ Tab switching performance
  ✓ Counter interactions
  ✓ Content visibility
  ✓ Animations smoothness


FUTURE ROADMAP
==============

Phase 1 (Current): ✅ Completed
  ✓ Proper categorization
  ✓ Scalable structure
  ✓ Dynamic UI

Phase 2 (Planned):
  - Audio pronunciation feature
  - Islamic source references
  - Multiple language support

Phase 3 (Planned):
  - Favorites/bookmarks
  - Daily reminders
  - Progress tracking

Phase 4 (Planned):
  - Widget for home screen
  - Search functionality
  - Statistics dashboard
