import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../models/azkar_model.dart';

class AzkarItemCard extends StatefulWidget {
  final AzkarModel azkar;
  final VoidCallback onTap;

  const AzkarItemCard({super.key, required this.azkar, required this.onTap});

  @override
  State<AzkarItemCard> createState() => _AzkarItemCardState();
}

class _AzkarItemCardState extends State<AzkarItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _tapController;
  int _currentCount = 0;

  @override
  void initState() {
    super.initState();
    _currentCount = widget.azkar.repetitionCount;
    _tapController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  void _onCardTap() {
    if (_currentCount > 0) {
      _tapController.forward().then((_) {
        _tapController.reverse();
      });

      setState(() {
        _currentCount--;
      });

      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onCardTap,
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 0.95).animate(
          CurvedAnimation(parent: _tapController, curve: Curves.easeInOut),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Repetition Counter
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.4),
                    width: 1,
                  ),
                ),
                child: Text(
                  'x$_currentCount',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              // Arabic Text (RTL)
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  widget.azkar.arabicText,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.6,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // Transliteration
              if (widget.azkar.transliteration != null)
                Text(
                  widget.azkar.transliteration!,
                  style: TextStyle(
                    color: AppColors.third,
                    fontSize: 12.sp,
                    fontStyle: FontStyle.italic,
                    height: 1.4,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
