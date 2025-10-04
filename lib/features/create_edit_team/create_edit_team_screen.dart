import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class CreateEditTeamScreen extends StatefulWidget {
  final String? teamId;

  const CreateEditTeamScreen({super.key, this.teamId});

  @override
  State<CreateEditTeamScreen> createState() => _CreateEditTeamScreenState();
}

class _CreateEditTeamScreenState extends State<CreateEditTeamScreen> {
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _playerNameController = TextEditingController();
  final List<String> _players = ['Rohit Sharma', 'Virat Kohli', 'KL Rahul'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF080209),
      appBar: AppAppBar(
        title: widget.teamId == null ? 'Create/Edit Team' : 'Edit Teams',
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.darkGradient),
        child: SafeArea(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTeamNameField(),
                SizedBox(height: 55.h),
                Text(
                  'Players:',
                  style: AppFonts.subtitle1.copyWith(
                    color: AppColors.darkTextPrimary,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(child: _buildPlayersList()),
                SizedBox(height: 16.h),
                _buildAddPlayerField(),
                SizedBox(height: 90.h),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Team Name",
          style: AppFonts.subtitle1.copyWith(
            color: AppColors.darkTextPrimary,
            fontWeight: AppFonts.semiBold,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkSurface.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextField(
            controller: _teamNameController,
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            decoration: InputDecoration(
              hintText: 'Team Name',
              hintStyle: TextStyle(color: AppColors.darkTextSecondary,fontWeight: FontWeight.bold),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlayersList() {
    return ListView.builder(
      itemCount: _players.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: AppColors.darkSurface.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10.r),
            // border: Border.all(
            //   // color: index == 0 ? Colors.blueAccent : Colors.transparent,
            //   width: 1.5,
            // ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _players[index],
                  style: AppFonts.bodyText1.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _players.removeAt(index);
                    });
                  },
                  child: Container(
                    width: 26.w,
                    height: 26.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.redAccent, width: 2),
                    ),
                    child: const Icon(Icons.close,
                        size: 16, color: Colors.redAccent),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddPlayerField() {
  return SizedBox(
    width: double.infinity,
    height: 55.h,
    child: OutlinedButton(
      onPressed: () {
        _showAddPlayerDialog();
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF6272DB), width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      child: Text(
        '+ Add Player',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
void _showAddPlayerDialog() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xff0C1A4B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Text(
          'Add Player',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _playerNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter player name',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color(0xff1A275F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_playerNameController.text.isNotEmpty) {
                        setState(() {
                          _players.add(_playerNameController.text.trim());
                        });
                        _playerNameController.clear();
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6272DB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
               Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.redAccent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ), 
              ],
            ),
          ],
        ),
      );
    },
  );
}

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          if (_teamNameController.text.isNotEmpty && _players.isNotEmpty) {
            // TODO: Save logic
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Team saved successfully!')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3B4AA2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
        child: Text(
          'Save',
          style: AppFonts.button.copyWith(
            color: AppColors.textWhite,
            fontWeight: AppFonts.semiBold,
            fontSize: AppFonts.fontSize18,
          ),
        ),
      ),
    );
  }
}