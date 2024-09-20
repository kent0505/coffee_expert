import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.width,
    this.bottom = false,
    this.add = false,
    this.edit = false,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final double? width;
  final bool bottom;
  final bool add;
  final bool edit;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: bottom ? Alignment.bottomCenter : Alignment.center,
      child: Container(
        height: 56,
        width: width,
        margin: bottom
            ? const EdgeInsets.only(
                bottom: 70,
                left: 24,
                right: 24,
              )
            : null,
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(56),
        ),
        child: CupertinoButton(
          onPressed: active ? onPressed : null,
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: TextB(
                  title,
                  fontSize: 16,
                  color: active ? AppColors.white : AppColors.white48,
                ),
              ),
              edit
                  ? Container(
                      height: 44,
                      width: 44,
                      decoration: const BoxDecoration(
                        color: AppColors.text3,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.edit_rounded,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : SvgPicture.asset(
                      add ? 'assets/add.svg' : 'assets/arrow-right2.svg',
                    ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }
}
