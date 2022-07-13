import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/ShopSearch/Bloc/search_event.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/ShopSearch/Bloc/search_state.dart';

import '../../../../../Data/Model/Store/Store.dart';
import '../Data/Repository/search_repository.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepository searchRepository;
  SearchBloc({required this.searchRepository}) : super(SearchUninitialized());

  SearchState get initialState => SearchUninitialized();
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is Search) {
      yield SearchUninitialized();

      try {
        List<Store> recipes = (await searchRepository.searchFoods(event.query)).cast<Store>();
        yield SearchLoaded(stores: recipes);
      } catch (e) {
        yield SearchError();
      }
    }
  }
}
