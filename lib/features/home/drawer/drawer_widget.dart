import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/actions/logo_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: AppColors.bg,
      child: Column(
        children: [
          _DrawerHeaderWidget(),
          Spacer(),
          _VersionText(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _DrawerHeaderWidget extends StatelessWidget {
  const _DrawerHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Container(
        height: 200,
        color: AppColors.main,
        child: const Column(
          children: [
            Spacer(),
            LogoWidget(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dark Diary',
                  style: TextStyle(
                    color: AppColors.title,
                    fontSize: 18,
                    fontFamily: 'Merriweather',
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Icon(
            icon,
            color: AppColors.title,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.title,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _VersionText extends StatelessWidget {
  const _VersionText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Version 1.0.0+1',
      style: TextStyle(
        color: AppColors.date,
      ),
    );
  }
}
