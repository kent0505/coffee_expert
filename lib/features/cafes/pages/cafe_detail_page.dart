import 'package:flutter/material.dart';

import '../../../core/config/router.dart';
import '../../../core/models/cafe.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class CafeDetailPage extends StatelessWidget {
  const CafeDetailPage({super.key, required this.cafe});

  final Cafe cafe;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      recipe: true,
      home: true,
      body: Column(
        children: [
          CustomAppbar(
            title: cafe.title,
            edit: true,
            settings: false,
            onEdit: () {
              context.push(Routes.cafeEdit, extra: cafe);
            },
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 12),
                CustomImage(
                  image: cafe.image,
                  height: 203,
                  borderRadius: 24,
                ),
                const SizedBox(height: 24),
                TextM(
                  cafe.description,
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
