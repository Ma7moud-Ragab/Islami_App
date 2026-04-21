import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../models/azkar_category_type.dart';
import '../models/azkar_repository.dart';
import '../widgets/azkar_list_view.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<AzkarCategoryType> _categories;

  @override
  void initState() {
    super.initState();

    _categories = AzkarData.getAllCategories();

    _tabController = TabController(
      length: _categories.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        elevation: 0,
        title: Text(
          'Azkari',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.third,
          isScrollable: true,
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          tabs: _categories
              .map((category) => Tab(text: category.displayName))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _categories
            .map(
              (category) => AzkarListView(
                azkarList: AzkarData.getByCategory(category),
              ),
            )
            .toList(),
      ),
    );
  }
}