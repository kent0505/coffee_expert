import 'package:flutter/material.dart';

import '../../../core/models/variety.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class VarietyDetailPage extends StatelessWidget {
  const VarietyDetailPage({super.key, required this.variety});

  final Variety variety;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      home: true,
      recipe: true,
      body: Column(
        children: [
          CustomAppbar(title: variety.title),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    variety.image1,
                    height: 203,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                TextM(
                  variety.description1,
                  fontSize: 14,
                  maxLines: 50,
                ),
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    variety.image2,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                TextM(
                  variety.description2,
                  fontSize: 14,
                  maxLines: 50,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
