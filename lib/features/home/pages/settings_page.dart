import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: 'Settings ⚙️',
            settings: false,
          ),
          SizedBox(height: 12),
          _Tile(id: 1, title: 'Contact Us', contact: true),
          _Tile(id: 2, title: 'Rate App'),
          _Tile(id: 3, title: 'Terms of Service'),
          _Tile(id: 4, title: 'Privacy Policy'),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.id,
    required this.title,
    this.contact = false,
  });

  final int id;
  final String title;
  final bool contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.card1,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CupertinoButton(
        onPressed: () {
          if (contact) context.push(Routes.contact);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.white14,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset('assets/settings$id.svg'),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: TextB(
                title,
                fontSize: 16,
              ),
            ),
            SvgPicture.asset('assets/arrow-right.svg'),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
