import 'package:flutter/material.dart';

import '../../../core/config/router.dart';
import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      recipe: true,
      home: true,
      body: Column(
        children: [
          CustomAppbar(
            title: 'Add News',
            edit: true,
            settings: false,
            onEdit: () {
              context.push(Routes.newsEdit, extra: news);
            },
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 12),
                CustomImage(
                  image: news.image,
                  height: 203,
                  borderRadius: 24,
                ),
                const SizedBox(height: 24),
                TextM(
                  news.content,
                  fontSize: 14,
                  maxLines: 200,
                ),
                SizedBox(height: 24 + getBottom(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
