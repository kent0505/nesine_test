import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import 'match_detail_sheet.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: AppColors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          builder: (BuildContext context) {
            return const MatchDetailSheet();
          },
        );
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 172,
        margin: const EdgeInsets.only(bottom: 27),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.main90,
        ),
      ),
    );
  }
}
