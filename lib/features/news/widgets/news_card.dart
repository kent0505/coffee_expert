import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/models/news.dart';
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
              borderRadius: BorderRadius.circular(14),
              child: Image.file(
                File(news.image),
                fit: BoxFit.cover,
                height: 80,
                width: 120,
                errorBuilder: (context, error, stackTrace) {
                  return CachedNetworkImage(
                    imageUrl: news.image,
                    fit: BoxFit.cover,
                    height: 80,
                    width: 120,
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        'assets/varieties1.png',
                        fit: BoxFit.cover,
                        height: 80,
                        width: 120,
                      );
                    },
                  );
                },
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
