import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils.dart';
import '../config/app_colors.dart';
import 'buttons/delete_button.dart';
import 'buttons/edit_button.dart';
import 'buttons/settings_button.dart';
import 'texts/text_r.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.settings = true,
    this.edit = false,
    this.delete = false,
    this.onDelete,
    this.onEdit,
  });

  final String title;
  final bool settings;
  final bool edit;
  final bool delete;
  final void Function()? onEdit;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 14 + getStatusBar(context),
        bottom: 12,
      ),
      child: Row(
        children: [
          const SizedBox(width: 24),
          CupertinoButton(
            onPressed: () {
              context.pop();
            },
            padding: EdgeInsets.zero,
            minSize: 44,
            child: Container(
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                color: AppColors.main,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset('assets/back.svg'),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: TextB(
              title,
              fontSize: 20,
              maxLines: 2,
            ),
          ),
          const SizedBox(width: 14),
          if (settings) const SettingsButton(),
          if (edit) EditButton(onPressed: onEdit),
          if (delete) DeleteButton(onPressed: onDelete),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
