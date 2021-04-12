import 'package:dio/dio.dart';
import 'package:football_apps/api/api.dart';
import 'package:football_apps/models/leagues_model.dart';

class LeagueProvider {

  final Api api = new Api();

  Future<LeaguesModel> getLeagues() async {
    try {
      var res = await api.apiClient().get("/all_leagues.php");
      LeaguesModel data = LeaguesModel.fromJson(res.data);
      return data;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<List<Event>> getLeaguePastEvent({
    String leagueId
  }) async {
    try {
      var res = await api.apiClient().get(
        '/eventspastleague.php',
        queryParameters: {
          "id": leagueId,
        }
      );

      var teams = List<Event>.from(res.data["events"].map((x) => Event.fromJson(x)));
      return teams;
    } on DioError catch (e) {
      print(e.message);
      throw e;
    }
  }
}