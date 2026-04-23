import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/Time/widgets/date_chip.dart';
import 'package:islami/features/Time/widgets/pray_time_item.dart';
import 'package:provider/provider.dart';
import '../../../providers/prayer_times_provider.dart';

class PrayerTimeCard extends StatefulWidget {
  const PrayerTimeCard({super.key});

  @override
  State<PrayerTimeCard> createState() => _PrayerTimeCardState();
}

class _PrayerTimeCardState extends State<PrayerTimeCard> {
  final PageController _controller = PageController(viewportFraction: 0.32);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
    // Fetch prayer times when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PrayerTimesProvider>().fetchPrayerTimes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerTimesProvider>(
      builder: (context, provider, child) {
        final prayerTimes = provider.prayerTimes;
        final isLoading = provider.isLoading;
        final error = provider.error;

        // Default prayers if no data
        final List<Map<String, String>> prayers = prayerTimes != null
            ? [
                {
                  "title": "Fajr",
                  "time": prayerTimes.data.timings.fajr,
                  "period": "AM",
                },
                {
                  "title": "Dhuhr",
                  "time": prayerTimes.data.timings.dhuhr,
                  "period": "PM",
                },
                {
                  "title": "Asr",
                  "time": prayerTimes.data.timings.asr,
                  "period": "PM",
                },
                {
                  "title": "Maghrib",
                  "time": prayerTimes.data.timings.maghrib,
                  "period": "PM",
                },
                {
                  "title": "Isha",
                  "time": prayerTimes.data.timings.isha,
                  "period": "PM",
                },
              ]
            : [
                {"title": "Fajr", "time": "05:12", "period": "AM"},
                {"title": "Dhuhr", "time": "01:01", "period": "PM"},
                {"title": "Asr", "time": "04:38", "period": "PM"},
                {"title": "Maghrib", "time": "07:57", "period": "PM"},
                {"title": "Isha", "time": "09:10", "period": "PM"},
              ];

        final gregorianDate = prayerTimes != null
            ? prayerTimes.data.date.readable
            : "16 Jul,\n2024";
        final hijriDate = prayerTimes != null
            ? "${prayerTimes!.data.date.hijri.date.split('-')[0]} ${prayerTimes.data.date.hijri.month.ar},\n${prayerTimes.data.date.hijri.year}"
            : "09 Muh,\n1446";
        final weekday = prayerTimes != null
            ? prayerTimes.data.date.gregorian.weekday.en
            : "Tuesday";

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
              if (isLoading)
                const CircularProgressIndicator()
              else if (error != null)
                Text(error, style: const TextStyle(color: Colors.red))
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dateChip(gregorianDate),
                    Column(
                      children: [
                        const Text(
                          "Pray Time",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          weekday,
                          style: TextStyle(color: AppColors.secondary),
                        ),
                      ],
                    ),
                    dateChip(hijriDate),
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
                        title: p["title"]!,
                        time: p["time"]!,
                        period: p["period"]!,
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
      },
    );
  }
}
