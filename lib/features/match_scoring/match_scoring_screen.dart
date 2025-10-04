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

class MatchScoringScreen extends StatefulWidget {
  final String? matchId;

  const MatchScoringScreen({super.key, this.matchId});

  @override
  State<MatchScoringScreen> createState() => _MatchScoringScreenState();
}

class _MatchScoringScreenState extends State<MatchScoringScreen> {
  int _selectedRuns = 0;
  bool _isWide = false;
  bool _isNoBall = false;
  bool _isWicket = false;
  bool _isByes = false;
  bool _isLegByes = false;
  String? _selectedBatsmanId;
  String? _selectedBowlerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppAppBar(
        title: 'Live Scoring',
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              context.read<AppCubit>().undoLastBallEvent();
            },
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              _completeMatch(context);
            },
          ),
        ],
      ),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: AppColors.error,
              ),
            );
            context.read<AppCubit>().clearError();
          }
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage!),
                backgroundColor: AppColors.success,
              ),
            );
            context.read<AppCubit>().clearSuccess();
          }
        },
        builder: (context, state) {
          final match = state.currentMatch;
          if (match == null) {
            return _buildNoMatchState();
          }

          return Container(
            decoration: const BoxDecoration(gradient: AppColors.fieldGradient),
            child: SafeArea(
              child: Padding(
                padding: AppConstants.defaultPadding,
                child: Column(
                  children: [
                    _buildMatchInfo(match, context),
                    SizedBox(height: AppConstants.largeSpacing),
                    _buildScoreDisplay(match),
                    SizedBox(height: AppConstants.largeSpacing),
                    Expanded(child: _buildScoringControls(match, context)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoMatchState() {
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
                    color: AppColors.darkShadow,
                    blurRadius: 10.r,
                    offset: Offset(0, 5.h),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.sports_cricket,
                    size: 64.w,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(height: AppConstants.largeSpacing),
                  Text(
                    'No active match',
                    style: AppFonts.headline6.copyWith(
                      color: AppColors.darkTextPrimary,
                    ),
                  ),
                  SizedBox(height: AppConstants.mediumSpacing),
                  Text(
                    'Start a new match to begin scoring.',
                    style: AppFonts.bodyText2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppConstants.largeSpacing),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/new-match'),
                    child: Text('Start New Match'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchInfo(Match match, BuildContext context) {
    final appCubit = context.read<AppCubit>();
    final battingTeamName = appCubit.getTeamName(match.battingTeamId);
    final bowlingTeamName = appCubit.getTeamName(match.bowlingTeamId);

    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '$battingTeamName vs $bowlingTeamName',
            style: AppFonts.headline6.copyWith(
              color: AppColors.darkTextPrimary,
              fontWeight: AppFonts.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppConstants.smallSpacing),
          Text(
            '${match.totalOvers} overs match',
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.smallSpacing,
              vertical: 4.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.2),
              borderRadius: AppConstants.smallBorderRadius,
            ),
            child: Text(
              'In Progress',
              style: AppFonts.caption.copyWith(
                color: AppColors.warning,
                fontWeight: AppFonts.semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreDisplay(Match match) {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Current Score',
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.darkTextPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '${match.battingTeamScore.runs}',
                    style: AppFonts.headline3.copyWith(
                      color: AppColors.primary,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                  Text(
                    'Runs',
                    style: AppFonts.bodyText2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '${match.battingTeamScore.wickets}',
                    style: AppFonts.headline3.copyWith(
                      color: AppColors.secondary,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                  Text(
                    'Wickets',
                    style: AppFonts.bodyText2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '${match.battingTeamScore.overs}',
                    style: AppFonts.headline3.copyWith(
                      color: AppColors.accent,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                  Text(
                    'Overs',
                    style: AppFonts.bodyText2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            'Run Rate: ${match.battingTeamScore.runRate.toStringAsFixed(2)}',
            style: AppFonts.bodyText1.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildScoringControls(Match match, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Score Runs',
              style: AppFonts.subtitle1.copyWith(
                color: AppColors.textPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.mediumSpacing),
            _buildRunsGrid(),
            SizedBox(height: AppConstants.largeSpacing),
            Text(
              'Special Events',
              style: AppFonts.subtitle1.copyWith(
                color: AppColors.darkTextPrimary,

                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.mediumSpacing),
            _buildSpecialEventsGrid(),
            SizedBox(height: AppConstants.largeSpacing),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _addBallEvent(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: AppConstants.mediumSpacing,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppConstants.smallBorderRadius,
                  ),
                ),
                child: Text(
                  'Add Ball',
                  style: AppFonts.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: AppFonts.semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRunsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: AppConstants.smallSpacing,
      crossAxisSpacing: AppConstants.smallSpacing,
      childAspectRatio: 1.5,
      children: List.generate(7, (index) {
        final runs = index;
        final isSelected = _selectedRuns == runs;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedRuns = runs;
              _isWide = false;
              _isNoBall = false;
              _isWicket = false;
              _isByes = false;
              _isLegByes = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : (AppColors.darkBackground),
              borderRadius: AppConstants.smallBorderRadius,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                runs == 0 ? 'Dot' : '$runs',
                style: AppFonts.bodyText1.copyWith(
                  color: isSelected ? Colors.white : (AppColors.textPrimary),
                  fontWeight: AppFonts.semiBold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSpecialEventsGrid() {
    final events = [
      {'label': 'Wide', 'value': _isWide, 'color': AppColors.warning},
      {'label': 'No Ball', 'value': _isNoBall, 'color': AppColors.error},
      {'label': 'Wicket', 'value': _isWicket, 'color': AppColors.secondary},
      {'label': 'Byes', 'value': _isByes, 'color': AppColors.accent},
      {'label': 'Leg Byes', 'value': _isLegByes, 'color': AppColors.primary},
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: AppConstants.smallSpacing,
      crossAxisSpacing: AppConstants.smallSpacing,
      childAspectRatio: 3,
      children: events.map((event) {
        final isSelected = event['value'] as bool;
        final color = event['color'] as Color;
        return GestureDetector(
          onTap: () {
            setState(() {
              if (event['label'] == 'Wide') {
                _isWide = !_isWide;
                if (_isWide) {
                  _selectedRuns = 0;
                  _isNoBall = false;
                  _isWicket = false;
                  _isByes = false;
                  _isLegByes = false;
                }
              } else if (event['label'] == 'No Ball') {
                _isNoBall = !_isNoBall;
                if (_isNoBall) {
                  _selectedRuns = 0;
                  _isWide = false;
                  _isWicket = false;
                  _isByes = false;
                  _isLegByes = false;
                }
              } else if (event['label'] == 'Wicket') {
                _isWicket = !_isWicket;
                if (_isWicket) {
                  _selectedRuns = 0;
                  _isWide = false;
                  _isNoBall = false;
                  _isByes = false;
                  _isLegByes = false;
                }
              } else if (event['label'] == 'Byes') {
                _isByes = !_isByes;
                if (_isByes) {
                  _isWide = false;
                  _isNoBall = false;
                  _isWicket = false;
                  _isLegByes = false;
                }
              } else if (event['label'] == 'Leg Byes') {
                _isLegByes = !_isLegByes;
                if (_isLegByes) {
                  _isWide = false;
                  _isNoBall = false;
                  _isWicket = false;
                  _isByes = false;
                }
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? color : (AppColors.darkBackground),
              borderRadius: AppConstants.smallBorderRadius,
              border: Border.all(
                color: isSelected ? color : AppColors.border,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                event['label'] as String,
                style: AppFonts.bodyText2.copyWith(
                  color: isSelected
                      ? Colors.white
                      : (AppColors.darkTextPrimary),
                  fontWeight: AppFonts.semiBold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _addBallEvent(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    final match = appCubit.state.currentMatch;
    if (match == null) return;

    String ballType = 'normal';
    if (_isWide) ballType = 'wide';
    if (_isNoBall) ballType = 'no_ball';
    if (_isByes) ballType = 'byes';
    if (_isLegByes) ballType = 'leg_byes';

    final ballEvent = BallEvent.create(
      ballNumber: match.ballEvents.length + 1,
      runs: _selectedRuns,
      ballType: ballType,
      batsmanId: _selectedBatsmanId,
      bowlerId: _selectedBowlerId,
      isWicket: _isWicket,
      wicketType: _isWicket ? 'bowled' : null,
    );

    appCubit.addBallEvent(ballEvent);

    // Reset selections
    setState(() {
      _selectedRuns = 0;
      _isWide = false;
      _isNoBall = false;
      _isWicket = false;
      _isByes = false;
      _isLegByes = false;
    });
  }

  void _completeMatch(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Complete Match'),
        content: Text('Are you sure you want to complete this match?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // For now, just complete with batting team as winner
              final appCubit = context.read<AppCubit>();
              final match = appCubit.state.currentMatch;
              if (match != null) {
                appCubit.completeMatch(match.battingTeamId, 'Batting team won');
                Navigator.pop(context);
              }
            },
            child: Text('Complete'),
          ),
        ],
      ),
    );
  }
}
