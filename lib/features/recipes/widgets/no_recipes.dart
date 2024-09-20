import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';

class NoRecipes extends StatelessWidget {
  const NoRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextE(
        'No data',
        fontSize: 14,
        maxLines: 2,
      ),
    );
  }
}
