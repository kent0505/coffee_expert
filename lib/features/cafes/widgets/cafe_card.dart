import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/models/cafe.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/texts/text_r.dart';

class CafeCard extends StatelessWidget {
  const CafeCard({super.key, required this.cafe});

  final Cafe cafe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card1,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push(Routes.cafeDetail, extra: cafe);
        },
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              image: cafe.image,
              height: 118,
              width: double.infinity,
              borderRadius: 14,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(14),
            //   child: Image.asset(
            //     cafe.image,
            //     height: 158,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const Spacer(),
            TextE(cafe.title, fontSize: 14),
            const Spacer(),
            Row(
              children: [
                SvgPicture.asset('assets/location.svg'),
                const SizedBox(width: 4),
                Expanded(
                  child: TextR(
                    cafe.location,
                    fontSize: 12,
                    maxLines: 2,
                    color: AppColors.white48,
                  ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset('assets/arrow-right.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
