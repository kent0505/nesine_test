import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../api/match_api.dart';
import '../models/match_model.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final matchApi = MatchApi();
  List<MatchModel> matches = [];

  MatchBloc() : super(MatchInitial()) {
    on<GetMatchesEvent>((event, emit) async {
      emit(MatchLoadingState());

      final now = DateTime.now();
      final datetime = DateTime(now.year, now.month, now.day - 1);
      final date = DateFormat('yyyy-MM-dd').format(datetime);

      matches = await matchApi.getMatches(date);

      if (matches.isNotEmpty) {
        emit(MatchesLoadedState(matches: matches));
      } else {
        emit(MatchErrorState());
      }
    });
  }
}
