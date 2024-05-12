import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IcoButton extends StatelessWidget {
  const IcoButton({
    super.key,
    required this.icon,
    this.color = Colors.transparent,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(56),
      minSize: 56,
      color: color,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
