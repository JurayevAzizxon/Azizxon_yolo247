import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';
import '../../core/constants/app_constants.dart';

class PlayerStatsScreen extends StatefulWidget {
  const PlayerStatsScreen({super.key});

  @override
  State<PlayerStatsScreen> createState() => _PlayerStatsScreenState();
}

class _PlayerStatsScreenState extends State<PlayerStatsScreen> {
  final List<Map<String, dynamic>> players = [
    {
      "name": "Rohit Sharma",
      "matches": 12,
      "runs": 340,
      "avg": 28.3,
      "wickets": 2,
      "best": "85",
      "fours": 42,
      "sixes": 12,
      "strikeRate": 134.5,
    },
    {
      "name": "Virat Kohli",
      "matches": 14,
      "runs": 620,
      "avg": 44.2,
      "wickets": 0,
      "best": "110*",
      "fours": 58,
      "sixes": 19,
      "strikeRate": 141.3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080209),
      appBar: AppAppBar(title: "Player Stats"),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.darkGradient),
        child: SafeArea(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return GestureDetector(
                  onTap: () => _showPlayerDetails(context, player),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 14.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      color: AppColors.darkSurface.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white24,
                          child:
                              Icon(Icons.person, color: Colors.white, size: 28),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                player["name"],
                                style: AppFonts.bodyText1.copyWith(
                                  color: AppColors.textWhite,
                                  fontWeight: AppFonts.bold,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Matches: ${player["matches"]}",
                                    style: AppFonts.bodyText2.copyWith(
                                      color:Color(0xff92A1FF)
                                    ),
                                  ),
                                  Text(
                                    "Runs: ${player["runs"]}",
                                    style: AppFonts.bodyText2.copyWith(
                                      color: Color(0xff92A1FF),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showPlayerDetails(BuildContext context, Map<String, dynamic> player) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: AppColors.darkSurface.withOpacity(0.95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                player["name"],
                style: AppFonts.headline6.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: AppFonts.bold,
                ),
              ),
              SizedBox(height: 14.h),
              _statRow("Matches", player["matches"].toString()),
              _statRow("Total Runs", player["runs"].toString()),
              _statRow("Avg. Runs", player["avg"].toString()),
              _statRow("Wickets", player["wickets"].toString()),
              _statRow("Best", player["best"].toString()),
              _statRow("4s", player["fours"].toString()),
              _statRow("6s", player["sixes"].toString()),
              _statRow("Strike Rate", "${player["strikeRate"]}%"),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Close",
                    style: AppFonts.bodyText2.copyWith(
                      color: Colors.redAccent,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppFonts.bodyText2.copyWith(color: AppColors.textWhite),
          ),
          Text(
            value,
            style: AppFonts.bodyText2.copyWith(
              color: AppColors.primary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}