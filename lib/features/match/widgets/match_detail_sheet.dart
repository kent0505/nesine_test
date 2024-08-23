import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/x_button.dart';
import '../models/match_model.dart';
import 'club_data.dart';
import 'league_data.dart';

class MatchDetailSheet extends StatelessWidget {
  const MatchDetailSheet({super.key, required this.model});

  final MatchModel model;

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
          _ClubsCard(model: model),
        ],
      ),
    );
  }
}

class _ClubsCard extends StatelessWidget {
  const _ClubsCard({required this.model});

  final MatchModel model;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 122,
      left: 30,
      right: 30,
      child: Container(
        height: 128,
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.main90,
        ),
        child: Column(
          children: [
            LeagueData(title: model.league),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClubData(
                  title: model.homeTeamTitle,
                  image: model.homeTeamLogo,
                ),
                const SizedBox(
                  width: 70,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 18),
                        Text(
                          'VS',
                          style: TextStyle(
                            color: AppColors.navBarIcon,
                            fontSize: 16,
                            fontFamily: Fonts.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClubData(
                  title: model.awayTeamTitle,
                  image: model.awayTeamLogo,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
