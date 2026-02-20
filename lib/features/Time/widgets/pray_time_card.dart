import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/Time/widgets/date_chip.dart';
import 'package:islami/features/Time/widgets/pray_time_item.dart';

class PrayerTimeCard extends StatefulWidget {
  const PrayerTimeCard({super.key});

  @override
  State<PrayerTimeCard> createState() => _PrayerTimeCardState();
}

class _PrayerTimeCardState extends State<PrayerTimeCard> {
  final PageController _controller = PageController(viewportFraction: 0.32);

  final List<Map<String, dynamic>> prayers = const [
    {"title": "Fajr", "time": "05:12", "period": "AM"},
    {"title": "Dhuhr", "time": "01:01", "period": "PM"},
    {"title": "ASR", "time": "04:38", "period": "PM"},
    {"title": "Maghrib", "time": "07:57", "period": "PM"},
    {"title": "Isha", "time": "09:10", "period": "PM"},
  ];

  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dateChip("16 Jul,\n2024"),
              Column(
                children: const [
                  Text(
                    "Pray Time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  Text("Tuesday", style: TextStyle(color: AppColors.secondary)),
                ],
              ),
              dateChip("09 Muh,\n1446"),
            ],
          ),

          const SizedBox(height: 18),

          SizedBox(
            height: 100,
            child: PageView.builder(
              controller: _controller,
              padEnds: false,
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                final diff = (_currentPage - index).abs();
                final scale = (1 - diff * 0.2).clamp(0.8, 1.0);

                final p = prayers[index];

                return Transform.scale(
                  scale: scale,
                  child: PrayerItem(
                    title: p["title"],
                    time: p["time"],
                    period: p["period"],
                    active: diff < 0.4,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          //NEXT PRAY
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Next Pray - 02:32",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.volume_up, size: 30, color: AppColors.secondary),
            ],
          ),
        ],
      ),
    );
  }
}
