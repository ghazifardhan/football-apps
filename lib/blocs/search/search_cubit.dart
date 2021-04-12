import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_apps/blocs/search/search_state.dart';
import 'package:football_apps/resources/search/search_provider.dart';

class SearchCubit extends Cubit<SearchState> {
  
  final SearchProvider _searchProvider = new SearchProvider();

  SearchCubit() : super(SearchUnloadState());

  Future<void> searchTeam({
    String query
  }) async {
    try {
      // push loading state
      emit(SearchLoadingState());

      // fetch data
      var data = await _searchProvider.getSearchs(query: query);

      emit(SearchLoadedState(
        data: data,
      ));
    } catch (e) {
      emit(SearchErrorState());
    }
  }

}