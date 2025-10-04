import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/routes/app_routes.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;

  const AppAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onBackPressed,
    this.showBackButton = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
  });

  void _showMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 60.h,
              right: 16.w,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A2332),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMenuItem(
                        context,
                        icon: Icons.home,
                        label: 'Home',
                        iconColor: AppColors.accent,
                        route: Routes.home,
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.edit,
                        label: "New Match",
                        iconColor: AppColors.error,
                        route: Routes.newMatch,
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.history,
                        label: "Match History",
                        iconColor: AppColors.warning,
                        isSelected: true,
                        route: Routes.matchHistory,
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.group,
                        label: "Teams",
                        iconColor: Colors.orange,
                        route: Routes.teamManagement,
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.bar_chart,
                        label: "Player Stats",
                        iconColor: AppColors.primary,
                        route: Routes.playerStats,
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.assignment,
                        label: "Match Summary",
                        iconColor: AppColors.warning,
                        route: Routes.matchSummary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color iconColor,
    String? route,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (route != null && !isSelected) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 3.w,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24.w),
            SizedBox(width: 12.w),
            Text(
              label,
              style: AppFonts.bodyText1.copyWith(
                color: isSelected ? AppColors.textLight : AppColors.textWhite,
                fontWeight: isSelected ? AppFonts.semiBold : AppFonts.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppFonts.headline6.copyWith(
          color: AppColors.textWhite,
          fontWeight: AppFonts.semiBold,
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: foregroundColor ?? AppColors.textWhite,
                size: 24.w,
              ),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null,
      actions: [
        IconButton(
          icon: Icon(Icons.menu, size: 28.w),
          onPressed: () => _showMenu(context),
        ),
      ],
      backgroundColor: backgroundColor ?? AppColors.textPrimary,
      foregroundColor: foregroundColor ?? AppColors.textWhite,
      elevation: elevation ?? 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
