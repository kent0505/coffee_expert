import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  Color getBgColor(String title) {
    if (title == 'Coffee varieties') {
      return AppColors.card2;
    } else if (title == 'Popular cafes') {
      return AppColors.card3;
    } else {
      return AppColors.main;
    }
  }

  Color getTitleColor(String title) {
    if (title == 'Coffee varieties') {
      return AppColors.text1;
    } else if (title == 'Popular cafes') {
      return AppColors.main;
    } else {
      return AppColors.text1;
    }
  }

  Color getDescriptionColor(String title) {
    if (title == 'Coffee varieties') {
      return AppColors.text2;
    } else if (title == 'Popular cafes') {
      return AppColors.text2;
    } else {
      return AppColors.white;
    }
  }

  String getSvg(String title) {
    if (title == 'Coffee varieties') {
      return 'assets/coffee1.svg';
    } else if (title == 'Popular cafes') {
      return 'assets/coffee2.svg';
    } else {
      return 'assets/coffee3.svg';
    }
  }

  String getImage(String title) {
    if (title == 'Coffee varieties') {
      return 'assets/onboard2.png';
    } else if (title == 'Popular cafes') {
      return 'assets/onboard4.png';
    } else {
      return 'assets/logo.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: getBgColor(title),
        borderRadius: BorderRadius.circular(24),
      ),
      child: CupertinoButton(
        onPressed: () {
          if (title == 'Coffee varieties') {
            context.push(Routes.varieties);
          } else if (title == 'Popular cafes') {
            context.push(Routes.varieties);
          } else {
            context.push(Routes.varieties);
          }
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(getSvg(title)),
                  const Spacer(),
                  TextB(
                    title,
                    fontSize: 16,
                    color: getTitleColor(title),
                  ),
                  const Spacer(),
                  TextR(
                    description,
                    fontSize: 12,
                    maxLines: 2,
                    color: getDescriptionColor(title),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Image.asset(getImage(title)),
          ],
        ),
      ),
    );
  }
}
