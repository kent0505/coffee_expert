import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/router.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.push(Routes.settings);
      },
      padding: EdgeInsets.zero,
      minSize: 44,
      child: Container(
        height: 44,
        width: 44,
        decoration: const BoxDecoration(
          color: AppColors.main,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset('assets/settings.svg'),
        ),
      ),
    );
  }
}
