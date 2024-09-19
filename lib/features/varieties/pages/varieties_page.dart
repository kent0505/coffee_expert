import 'package:flutter/material.dart';

import '../../../core/models/variety.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/varieties_card.dart';

class VarietiesPage extends StatelessWidget {
  const VarietiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Coffee varieties'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    VarietiesCard(variety: variety1),
                    const SizedBox(width: 14),
                    VarietiesCard(variety: variety2),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    VarietiesCard(variety: variety3),
                    const SizedBox(width: 14),
                    VarietiesCard(variety: variety4),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
