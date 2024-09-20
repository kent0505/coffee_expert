import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 44,
      child: Container(
        height: 44,
        width: 44,
        decoration: const BoxDecoration(
          color: AppColors.main,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.delete_rounded,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
