import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: 6,
      maxLines: null,
      style: const TextStyle(
        color: AppColors.desc,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        hintText: 'Type something...',
        hintStyle: TextStyle(
          color: AppColors.desc,
          fontSize: 16,
        ),
        border: InputBorder.none,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
