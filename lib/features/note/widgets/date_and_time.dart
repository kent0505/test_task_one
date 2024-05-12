import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime({super.key, this.date = ''});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          date.isEmpty ? formatDate(getCurrentTimestamp()) : formatDate(date),
          style: const TextStyle(
            color: AppColors.date,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          date.isEmpty ? formatTime(getCurrentTimestamp()) : formatTime(date),
          style: const TextStyle(
            color: AppColors.date,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
