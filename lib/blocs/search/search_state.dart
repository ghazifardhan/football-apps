import 'package:equatable/equatable.dart';
import 'package:football_apps/models/teams_model.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchUnloadState extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchLoadedState extends SearchState {
  final TeamModel data;

  SearchLoadedState({
    this.data,
  });

  SearchLoadedState copyWith({
    TeamModel data, 
  }) => SearchLoadedState(
    data: data ?? this.data,
  );

  @override
  List<Object> get props => [
    data,
  ];
}
class SearchErrorState extends SearchState {}