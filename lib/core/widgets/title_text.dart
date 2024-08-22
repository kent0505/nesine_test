import 'package:flutter/material.dart';
import 'package:football_test/core/utils.dart';

import '../config/app_colors.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40 + getStatusBar(context), left: 38),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontFamily: Fonts.bold,
            ),
          ),
        ],
      ),
    );
  }
}
