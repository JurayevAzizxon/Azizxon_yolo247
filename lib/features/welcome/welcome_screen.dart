import 'package:flutter/material.dart';
import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/core/widgets/app_buttons.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _subtitleController;
  late AnimationController _buttonController;

  late Animation<double> _titleFadeAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<double> _subtitleFadeAnimation;
  late Animation<Offset> _subtitleSlideAnimation;
  late Animation<double> _buttonFadeAnimation;
  late Animation<Offset> _buttonSlideAnimation;

  @override
  void initState() {
    super.initState();
    
    _titleController = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );
    
    _subtitleController = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );
    
    _buttonController = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );

    _titleFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _titleController,
      curve: Curves.easeIn,
    ));

    _titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _titleController,
      curve: Curves.easeIn,
    ));

    _subtitleFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _subtitleController,
      curve: Curves.easeIn,
    ));

    _subtitleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _subtitleController,
      curve: Curves.easeIn,
    ));

    _buttonFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Curves.easeIn,
    ));

    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Curves.easeIn,
    ));

    // Start animations with delays
    _titleController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _subtitleController.forward();
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      _buttonController.forward();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.images.welcomeBackground.path, fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: AppConstants.defaultPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2),
                  SlideTransition(
                    position: _titleSlideAnimation,
                    child: FadeTransition(
                      opacity: _titleFadeAnimation,
                      child: Text(
                        'Welcome to Cricket Score Counter!',
                        textAlign: TextAlign.center,
                        style: AppFonts.size42weight300fontKaushanScript
                            .copyWith(color: AppColors.textWhite),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _subtitleSlideAnimation,
                    child: FadeTransition(
                      opacity: _subtitleFadeAnimation,
                      child: Text(
                        'Track matches, manage teams,\nand keep your cricket scores effortlessly.',
                        textAlign: TextAlign.center,
                        style: AppFonts.size20weight500fontInter.copyWith(
                          color: AppColors.textWhite,
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 3),
                  SlideTransition(
                    position: _buttonSlideAnimation,
                    child: FadeTransition(
                      opacity: _buttonFadeAnimation,
                      child: AppButton(
                        text: 'Get Started',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
