import 'package:equatable/equatable.dart';
import 'package:football_apps/models/countries_model.dart';

abstract class CountryState extends Equatable {
  @override
  List<Object> get props => [];
}

class CountryUnloadState extends CountryState {}
class CountryLoadingState extends CountryState {}
class CountryLoadedState extends CountryState {
  final CountriesModel data;
  final bool loadingClub;
  final int selectedIndex;

  CountryLoadedState({
    this.data, 
    this.loadingClub,
    this.selectedIndex
  });

  CountryLoadedState copyWith({
    CountriesModel data, 
    bool loadingClub,
    int selectedIndex,
  }) => CountryLoadedState(
    data: data ?? this.data, 
    loadingClub: loadingClub ?? this.loadingClub,
    selectedIndex: selectedIndex ?? this.selectedIndex
  );

  @override
  List<Object> get props => [
    data,
    loadingClub,
    selectedIndex
  ];
}
class CountryErrorState extends CountryState {}