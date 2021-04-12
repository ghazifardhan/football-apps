import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_apps/blocs/league/league_state.dart';
import 'package:football_apps/resources/league/league_provider.dart';

class LeagueCubit extends Cubit<LeagueState> {
  
  final LeagueProvider _leagueProvider = new LeagueProvider();

  LeagueCubit() : super(LeagueUnloadState());

  Future<void> getLeagues() async {
    try {
      // push loading state
      emit(LeagueLoadingState());

      // fetch data
      var data = await _leagueProvider.getLeagues();

      // filter list only soccerr
      var soccers = data.leagues.where((element) => element.strSport == "Soccer").toList();

      emit(LeagueLoadedState(
        datas: soccers,
        loadingEvent: false,
        selectedIndex: 0
      ));
    } catch (e) {
      emit(LeagueErrorState());
    }
  }

  Future<void> getEventInLeagues({
    String leagueId,
    int selectedIndex
  }) async {
    try {
      if (state is LeagueLoadedState) {
        // get league first
        var leagues = (state as LeagueLoadedState).datas;
        var league = leagues.firstWhere((element) => element.idLeague == leagueId);

        if (league.eventsPast.length == 0) {
          // set loading in league club
          emit((state as LeagueLoadedState).copyWith(
            loadingEvent: true,
            selectedIndex: selectedIndex
          ));

          // fetch data
          var data = await _leagueProvider.getLeaguePastEvent(leagueId: leagueId);
          
          if (league.eventsPast.length == 0) {
            league.eventsPast.addAll(data);
          }

          emit((state as LeagueLoadedState).copyWith(
            datas: leagues,
            loadingEvent: false
          ));
        }
      }
    } catch (e) {
      emit(LeagueErrorState());
    }
  }

}