import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_apps/blocs/country/country_state.dart';
import 'package:football_apps/resources/country/country_provider.dart';

class CountryCubit extends Cubit<CountryState> {
  
  final CountryProvider _countryProvider = new CountryProvider();

  CountryCubit() : super(CountryUnloadState());

  Future<void> getCountries() async {
    try {
      // push loading state
      emit(CountryLoadingState());

      // fetch data
      var data = await _countryProvider.getCountries();
      emit(CountryLoadedState(
        data: data,
        loadingClub: false,
        selectedIndex: 0
      ));
    } catch (e) {
      emit(CountryErrorState());
    }
  }

  Future<void> getClubInCountries({
    String countryName,
    int selectedIndex
  }) async {
    try {
      if (state is CountryLoadedState) {
        // get country first
        var countries = (state as CountryLoadedState).data;
        var country = countries.countries.firstWhere((element) => element.nameEn == countryName);

        if (country.teams.length == 0) {
          // set loading in country club
          emit((state as CountryLoadedState).copyWith(
            loadingClub: true,
            selectedIndex: selectedIndex
          ));

          // fetch data
          var data = await _countryProvider.getClubInCountry(countryName: countryName);
          
          if (country.teams.length == 0) {
            country.teams.addAll(data);
          }

          emit((state as CountryLoadedState).copyWith(
            data: countries,
            loadingClub: false
          ));
        }
      }
    } catch (e) {
      emit(CountryErrorState());
    }
  }

}