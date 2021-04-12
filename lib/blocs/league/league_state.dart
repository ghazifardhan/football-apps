import 'package:equatable/equatable.dart';
import 'package:football_apps/models/leagues_model.dart';

abstract class LeagueState extends Equatable {
  @override
  List<Object> get props => [];
}

class LeagueUnloadState extends LeagueState {}
class LeagueLoadingState extends LeagueState {}
class LeagueLoadedState extends LeagueState {
  final List<League> datas;
  final bool loadingEvent;
  final int selectedIndex;

  LeagueLoadedState({
    this.datas, 
    this.loadingEvent,
    this.selectedIndex
  });

  LeagueLoadedState copyWith({
    List<League> datas, 
    bool loadingEvent,
    int selectedIndex,
  }) => LeagueLoadedState(
    datas: datas ?? this.datas, 
    loadingEvent: loadingEvent ?? this.loadingEvent,
    selectedIndex: selectedIndex ?? this.selectedIndex
  );

  @override
  List<Object> get props => [
    datas,
    loadingEvent,
    selectedIndex
  ];
}
class LeagueErrorState extends LeagueState {}