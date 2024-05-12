import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import 'logo_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.dark = false});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return const Center(
      // child: CupertinoActivityIndicator(
      //   color: dark ? Colors.black : Colors.white,
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoWidget(),
          SizedBox(height: 20),
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
    );
  }
}
