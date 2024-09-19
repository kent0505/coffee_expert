import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.home = false,
    this.splash = false,
  });

  final Widget body;
  final bool home;
  final bool splash;

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
                    decoration: const BoxDecoration(
                      color: AppColors.bg2,
                      borderRadius: BorderRadius.vertical(
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
