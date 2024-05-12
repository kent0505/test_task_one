import 'package:flutter/cupertino.dart';

class TxtButton extends StatelessWidget {
  const TxtButton({
    super.key,
    required this.title,
    // this.color = AppColors.title,
    required this.color,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: CupertinoButton(
        minSize: 40,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
