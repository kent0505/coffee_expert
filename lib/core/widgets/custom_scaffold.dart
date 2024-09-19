import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.home = false,
    this.splash = false,
    this.recipe = false,
  });

  final Widget body;
  final bool home;
  final bool splash;
  final bool recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: splash ? AppColors.bg2 : AppColors.bg,
                  ),
                ),
                if (home)
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                      color: recipe ? AppColors.card1 : AppColors.bg2,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(34),
                      ),
                    ),
                  ),
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
