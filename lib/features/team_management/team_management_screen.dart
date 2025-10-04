import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/bloc/app_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/cubit/app_cubit.dart';
import '../../core/models/team.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class TeamManagementScreen extends StatelessWidget {
  const TeamManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppAppBar(title: "Team Management"),
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
          return SafeArea(
            child: Padding(
              padding: AppConstants.defaultPadding,
              child: Column(
                children: [
                  _buildHeader(),
                  SizedBox(height: AppConstants.largeSpacing),
                  Expanded(child: _buildTeamList(state.teams, context)),
                  SizedBox(height: AppConstants.largeSpacing),
                  _buildAddTeamButton(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
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
          Icon(Icons.groups, size: 48.w, color: AppColors.primary),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            "Team Management",
            style: AppFonts.headline5.copyWith(
              color: AppColors.darkTextPrimary,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          Text(
            'Manage your cricket teams',
            style: AppFonts.bodyText2.copyWith(
              color: AppColors.darkTextSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamList(List<Team> teams, BuildContext context) {
    if (teams.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];
        return _buildTeamCard(team, context);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.groups, size: 64.w, color: AppColors.darkTextSecondary),
          SizedBox(height: AppConstants.largeSpacing),
          Text(
            'No teams yet',
            style: AppFonts.headline6.copyWith(
              color: AppColors.darkTextSecondary,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            'Create your first team to get started!',
            style: AppFonts.bodyText2.copyWith(
              color: AppColors.darkTextSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCard(Team team, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.mediumSpacing),
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
      child: Row(
        children: [
          Icon(Icons.sports_cricket, size: 32.w, color: AppColors.primary),
          SizedBox(width: AppConstants.mediumSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  team.name,
                  style: AppFonts.subtitle1.copyWith(
                    color: AppColors.darkTextPrimary,
                    fontWeight: AppFonts.semiBold,
                  ),
                ),
                Text(
                  '${team.playerCount} players',
                  style: AppFonts.bodyText2.copyWith(
                    color: AppColors.darkTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/create-edit-team',
                arguments: {'teamId': team.id},
              );
            },
            icon: Icon(Icons.edit, color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildAddTeamButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, '/create-edit-team'),
        icon: const Icon(Icons.add),
        label: Text("Add Team"),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textWhite,
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.largeBorderRadius,
          ),
        ),
      ),
    );
  }
}
