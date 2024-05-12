import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: const TextStyle(
        color: AppColors.title,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Merriweather',
      ),
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        hintText: 'Title',
        hintStyle: TextStyle(
          color: AppColors.desc,
          fontSize: 20,
          fontFamily: 'Merriweather',
        ),
        border: InputBorder.none,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
