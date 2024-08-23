import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/title_text.dart';
import '../bloc/match_bloc.dart';
import '../widgets/match_card.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  void getData() {
    context.read<MatchBloc>().add(GetMatchesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchState>(
      builder: (context, state) {
        if (state is MatchLoadingState) return const LoadingWidget();

        if (state is MatchErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Error',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 6),
                PrimaryButton(
                  title: 'Try again',
                  onPressed: getData,
                ),
              ],
            ),
          );
        }
        if (state is MatchesLoadedState) {
          return Padding(
            padding: EdgeInsets.only(bottom: navBarHeight),
            child: ListView(
              children: [
                const TitleText('Matches'),
                const SizedBox(height: 27),
                ...List.generate(
                  state.matches.length,
                  (index) {
                    return MatchCard(model: state.matches[index]);
                  },
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
