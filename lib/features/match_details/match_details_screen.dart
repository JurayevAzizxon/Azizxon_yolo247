import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/bloc/app_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/cubit/app_cubit.dart';
import '../../core/models/match.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class MatchDetailsScreen extends StatelessWidget {
  final String? matchId;

  const MatchDetailsScreen({super.key, this.matchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppAppBar(title: 'Match Details'),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final match = matchId != null
              ? context.read<AppCubit>().getMatchById(matchId!)
              : null;

          if (match == null) {
            return _buildErrorState(context);
          }

          return Container(
            decoration: BoxDecoration(gradient: AppColors.darkGradient),
            child: SafeArea(
              child: Padding(
                padding: AppConstants.defaultPadding,
                child: Column(
                  children: [
                    _buildMatchSummary(match, context),
                    SizedBox(height: AppConstants.largeSpacing),
                    Expanded(child: _buildMatchStats(match, context)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.fieldGradient),
      child: SafeArea(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: Center(
            child: Container(
              padding: AppConstants.defaultPadding,
              decoration: BoxDecoration(
                color: AppColors.darkSurface,
                borderRadius: AppConstants.largeBorderRadius,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowDark,
                    blurRadius: 10.r,
                    offset: Offset(0, 5.h),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 64.w, color: AppColors.error),
                  SizedBox(height: AppConstants.largeSpacing),
                  Text(
                    'Match not found',
                    style: AppFonts.headline6.copyWith(
                      color: AppColors.darkTextPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchSummary(Match match, BuildContext context) {
    final appCubit = context.read<AppCubit>();
    final battingTeamName = appCubit.getTeamName(match.battingTeamId);
    final bowlingTeamName = appCubit.getTeamName(match.bowlingTeamId);
    final matchResult = appCubit.getMatchResult(match);
    final scoreDisplay = appCubit.getMatchScoreDisplay(match);

    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '$battingTeamName vs $bowlingTeamName',
            style: AppFonts.headline5.copyWith(
              color: AppColors.darkTextPrimary,
              fontWeight: AppFonts.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            matchResult,
            style: AppFonts.bodyText1.copyWith(
              color: AppColors.darkTextPrimary,
              fontWeight: AppFonts.semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            scoreDisplay,
            style: AppFonts.headline6.copyWith(
              color: AppColors.primary,
              fontWeight: AppFonts.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchStats(Match match, BuildContext context) {
    final appCubit = context.read<AppCubit>();
    final battingTeamName = appCubit.getTeamName(match.battingTeamId);
    final bowlingTeamName = appCubit.getTeamName(match.bowlingTeamId);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: AppConstants.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match Statistics',
              style: AppFonts.subtitle1.copyWith(
                color: AppColors.darkTextPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.largeSpacing),

            // Match Info
            _buildStatRow(
              'Match Date',
              '${match.startTime.day}/${match.startTime.month}/${match.startTime.year}',
            ),
            _buildStatRow(
              'Start Time',
              '${match.startTime.hour}:${match.startTime.minute.toString().padLeft(2, '0')}',
            ),
            if (match.endTime != null)
              _buildStatRow(
                'End Time',
                '${match.endTime!.hour}:${match.endTime!.minute.toString().padLeft(2, '0')}',
              ),
            _buildStatRow('Total Overs', '${match.totalOvers}'),

            SizedBox(height: AppConstants.largeSpacing),

            // Batting Team Stats
            Text(
              'Batting Team: $battingTeamName',
              style: AppFonts.subtitle2.copyWith(
                color: AppColors.darkTextPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.mediumSpacing),
            _buildStatRow('Runs', '${match.battingTeamScore.runs}'),
            _buildStatRow('Wickets', '${match.battingTeamScore.wickets}'),
            _buildStatRow('Overs', '${match.battingTeamScore.overs}'),
            _buildStatRow('Extras', '${match.battingTeamScore.extras}'),
            _buildStatRow(
              'Run Rate',
              match.battingTeamScore.runRate.toStringAsFixed(2),
            ),

            SizedBox(height: AppConstants.largeSpacing),

            // Bowling Team Stats
            Text(
              'Bowling Team: $bowlingTeamName',
              style: AppFonts.subtitle2.copyWith(
                color: AppColors.darkTextPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.mediumSpacing),
            _buildStatRow('Runs Conceded', '${match.bowlingTeamScore.runs}'),
            _buildStatRow('Wickets Taken', '${match.bowlingTeamScore.wickets}'),
            _buildStatRow('Overs Bowled', '${match.bowlingTeamScore.overs}'),
            _buildStatRow('Extras Given', '${match.bowlingTeamScore.extras}'),
            _buildStatRow(
              'Economy Rate',
              match.bowlingTeamScore.runRate.toStringAsFixed(2),
            ),

            SizedBox(height: AppConstants.largeSpacing),

            // Ball Events
            Text(
              'Ball Events',
              style: AppFonts.subtitle2.copyWith(
                color: AppColors.darkTextPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.mediumSpacing),
            Text(
              '${match.ballEvents.length} balls bowled',
              style: AppFonts.bodyText2.copyWith(
                color: AppColors.darkTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.smallSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
          ),
          Text(
            value,
            style: AppFonts.bodyText2.copyWith(
              color: AppColors.darkTextPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
