import 'dart:async';

import 'package:dio/dio.dart';
import 'package:football_apps/api/api.dart';
import 'package:football_apps/models/countries_model.dart';

class CountryProvider {
  
  final Api api = new Api();

  Future<CountriesModel> getCountries() async {
    try {
      var res = await api.apiClient().get('/all_countries.php');
      CountriesModel data = CountriesModel.fromJson(res.data);
      return data;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<List<Team>> getClubInCountry({
    String countryName
  }) async {
    try {
      var res = await api.apiClient().get(
        '/search_all_teams.php',
        queryParameters: {
          "s": "Soccer",
          "c": countryName
        }
      );

      var teams = List<Team>.from(res.data["teams"].map((x) => Team.fromJson(x)));
      return teams;
    } on DioError catch (e) {
      print(e.message);
      throw e;
    }
  }

}