import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/models/variety.dart';
import '../../../core/widgets/texts/text_r.dart';

class VarietiesCard extends StatelessWidget {
  const VarietiesCard({super.key, required this.variety});

  final Variety variety;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 244,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.card1,
          borderRadius: BorderRadius.circular(24),
        ),
        child: CupertinoButton(
          onPressed: () {
            context.push(Routes.varietyDetail, extra: variety);
          },
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  variety.image1,
                  height: 158,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              TextE(variety.title, fontSize: 14),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: TextR(
                      variety.description1,
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
      ),
    );
  }
}
