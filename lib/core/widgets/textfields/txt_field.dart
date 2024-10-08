import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';

class TxtField extends StatefulWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.multiline = false,
    this.number = false,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool multiline;
  final bool number;

  final void Function() onChanged;

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  double? _height() {
    if (widget.multiline) return null;
    return 46;
  }

  int? _maxLines() {
    if (widget.multiline) return null;
    return 1;
  }

  TextInputType? _keyboardType() {
    if (widget.multiline) return TextInputType.multiline;
    if (widget.number) return TextInputType.number;
    return null;
  }

  List<TextInputFormatter>? _inputFormatters() {
    // final length = LengthLimitingTextInputFormatter(widget.length);
    final digit = FilteringTextInputFormatter.digitsOnly;
    if (widget.number) {
      return [
        // length,
        digit,
      ];
    }
    return [
      // length,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height(),
      decoration: BoxDecoration(
        color: AppColors.textfield,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: _keyboardType(),
        maxLines: _maxLines(),
        inputFormatters: _inputFormatters(),
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontFamily: Fonts.medium,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.multiline ? 18 : 0,
            horizontal: 16,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.white48,
            fontSize: 14,
            fontFamily: Fonts.medium,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          widget.onChanged();
        },
      ),
    );
  }
}
