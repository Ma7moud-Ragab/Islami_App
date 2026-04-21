import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/azkar_model.dart';
import 'azkar_item_card.dart';

class AzkarListView extends StatefulWidget {
  final List<AzkarModel> azkarList;

  const AzkarListView({super.key, required this.azkarList});

  @override
  State<AzkarListView> createState() => _AzkarListViewState();
}

class _AzkarListViewState extends State<AzkarListView> {
  void _onAzkarTap() {
    // Haptic feedback or sound can be added here if needed
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: widget.azkarList.length,
      itemBuilder: (context, index) {
        return AzkarItemCard(
          azkar: widget.azkarList[index],
          onTap: _onAzkarTap,
        );
      },
    );
  }
}
