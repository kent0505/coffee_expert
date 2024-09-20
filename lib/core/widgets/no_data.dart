import 'package:flutter/material.dart';

import 'texts/text_r.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

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
