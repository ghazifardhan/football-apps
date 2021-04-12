import 'package:dio/dio.dart';
import 'package:football_apps/api/api.dart';
import 'package:football_apps/models/teams_model.dart';

class SearchProvider {

  final Api api = new Api();

  Future<TeamModel> getSearchs({
    String query
  }) async {
    try {
      var res = await api.apiClient().get(
        "/searchteams.php",
        queryParameters: {
          "t": query
        }  
      );
      TeamModel data = TeamModel.fromJson(res.data);
      return data;
    } on DioError catch (e) {
      throw e;
    }
  }
}