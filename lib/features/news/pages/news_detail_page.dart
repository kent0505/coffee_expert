import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/router.dart';
import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
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
            title: news.title,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.file(
                    File(news.image),
                    height: 203,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return CachedNetworkImage(
                        imageUrl: news.image,
                        height: 203,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Image.asset(
                            'assets/varieties1.png',
                            fit: BoxFit.cover,
                            height: 203,
                          );
                        },
                      );
                    },
                  ),
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
