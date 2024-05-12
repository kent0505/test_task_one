import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    // this.color = AppColors.card,
    // this.textColor = AppColors.title,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final Color textColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: CupertinoButton(
        color: color,
        minSize: 40,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
