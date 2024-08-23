import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/x_button.dart';

class MatchDetailSheet extends StatelessWidget {
  const MatchDetailSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 137,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              'assets/bg4.png',
              height: 210,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 210,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black.withOpacity(0),
                  AppColors.black,
                ],
              ),
            ),
          ),
          const Positioned(
            right: 0,
            top: 0,
            child: XButton(),
          ),
          const _ClubsCard(),
        ],
      ),
    );
  }
}

class _ClubsCard extends StatelessWidget {
  const _ClubsCard();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 122,
      left: 30,
      right: 30,
      child: Container(
        height: 128,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.main90,
        ),
      ),
    );
  }
}
