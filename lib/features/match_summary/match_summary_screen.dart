import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class MatchSummaryScreen extends StatelessWidget {
  final String? matchId;

  const MatchSummaryScreen({super.key, this.matchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: const AppAppBar(title: 'Match Summary'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMatchHeader(),
                SizedBox(height: 20.h),
                _buildResultSection(),
                SizedBox(height: 40.h),
                _buildScoresSection(),
                SizedBox(height: 50.h),
                _buildBestPlayersSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🏟 HEADER WITH BACKGROUND IMAGE AND FLAGS
  Widget _buildMatchHeader() {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/match_background.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTeamFlag("assets/images/india_flag3.jpg", "INDIA"),
          Text(
            "VS",
            style: AppFonts.subtitle1.copyWith(
              color: Colors.white,
              fontWeight: AppFonts.bold,
            ),
          ),
          _buildTeamFlag("assets/images/team_2.png", "AUSTRALIA"),
        ],
      ),
    );
  }

  Widget _buildTeamFlag(String image, String name) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(1.r),
          child: Image.asset(image, width: 70.w, height: 40.h, fit: BoxFit.cover),
        ),
        SizedBox(height: 8.h),
        Text(
          name,
          style: AppFonts.subtitle2.copyWith(
            color: Colors.white,
            fontWeight: AppFonts.semiBold,
          ),
        ),
      ],
    );
  }

  // 🟢 RESULT SECTION
  Widget _buildResultSection() {
    return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Result:",
          style: AppFonts.bodyText2.copyWith(color: AppColors.fieldGreen),
        ),
        SizedBox(height: 5.h),
        Text(
          "India won by 25 runs",
          style: AppFonts.subtitle1.copyWith(
            color: Colors.white,
            fontWeight: AppFonts.bold,
          ),
        ),
      ],
    );
  }

  // 🏏 SCORES SECTION
  Widget _buildScoresSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildScoreCard(
          team: "India",
          score: "175/3",
          overs: "20.0",
          extras: "12",
          runRate: "8.75",
        ),
        _buildScoreCard(
          team: "Australia",
          score: "150/8",
          overs: "20.0",
          extras: "8",
          runRate: "7.50",
        ),
      ],
    );
  }

  Widget _buildScoreCard({
    required String team,
    required String score,
    required String overs,
    required String extras,
    required String runRate,
  }) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow,
            blurRadius: 6,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            team,
            style: AppFonts.subtitle2.copyWith(
              color: Colors.white,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            score,
            style: AppFonts.headline6.copyWith(
              color: Color(0xffFECF84),
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text("Overs: $overs",
              style: AppFonts.bodyText2.copyWith(color: Colors.white)),
          Text("Extras: $extras",
              style: AppFonts.bodyText2.copyWith(color: Colors.white)),
          Text("Run Rate: $runRate",
              style: AppFonts.bodyText2.copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  // 🌟 BEST PLAYERS SECTION
  Widget _buildBestPlayersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPlayerCard(
          title: "Best Batsman",
          playerName: "Virat Kohli",
          statLine: "78 Runs | 55 Balls | SR: 141.82%",
        ),
        SizedBox(height: 15.h),
        _buildPlayerCard(
          title: "Best Bowler",
          playerName: "Jasprit Bumrah",
          statLine: "4 Wickets | 23 Runs | ER: 3.20",
        ),
      ],
    );
  }

  Widget _buildPlayerCard({
    required String title,
    required String playerName,
    required String statLine,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow,
            blurRadius: 8,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber, size: 20),
              SizedBox(width: 8.w),
              Text(
                title,
                style: AppFonts.subtitle2.copyWith(
                  color: Color(0xffFECF84),
                  fontWeight: AppFonts.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            playerName,
            style: AppFonts.subtitle2.copyWith(
              color: Colors.white,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            statLine,
            style: AppFonts.bodyText2.copyWith(color: Colors.white,fontWeight:AppFonts.bold),
          ),
        ],
      ),
    );
  }
}