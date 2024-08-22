import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/title_text.dart';
import '../widgets/match_card.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TitleText('Matches'),
        Padding(
          padding: EdgeInsets.only(bottom: navBarHeight),
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 150,
            ),
            children: const [
              MatchCard(),
            ],
          ),
        ),
      ],
    );
  }
}
