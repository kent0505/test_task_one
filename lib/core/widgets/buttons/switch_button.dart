import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
    required this.onTap,
    required this.active,
  });

  final void Function() onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 24,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: active ? AppColors.accent : AppColors.main,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: active ? 3 : 19,
            left: active ? 19 : 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: active ? AppColors.title : AppColors.date,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
