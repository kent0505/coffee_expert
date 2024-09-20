import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/models/news.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/texts/text_r.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.card1,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push(Routes.newsDetail, extra: news);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            ClipRRect(
              child: CustomImage(
                image: news.image,
                height: 80,
                width: 120,
                borderRadius: 14,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextB(
                    news.title,
                    fontSize: 14,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  TextR(
                    news.content,
                    fontSize: 12,
                    color: AppColors.text3,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            SvgPicture.asset('assets/arrow-right.svg'),
          ],
        ),
      ),
    );
  }
}
