import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/settings_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      home: true,
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 14 + getStatusBar(context)),
              const Row(
                children: [
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextB(
                          'Hello 👋 ',
                          fontSize: 20,
                          color: AppColors.text1,
                        ),
                        SizedBox(height: 8),
                        TextM(
                          'What do you want to do?',
                          fontSize: 14,
                          color: AppColors.text2,
                        ),
                      ],
                    ),
                  ),
                  SettingsButton(),
                  SizedBox(width: 24),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
