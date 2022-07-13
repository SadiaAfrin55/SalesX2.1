import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Bloc/visit_cubit.dart';

import '../ShopSearch/Bloc/search_bloc.dart';
import '../ShopSearch/Bloc/search_event.dart';
import '../ShopSearch/Bloc/search_state.dart';

class SearchUser extends SearchDelegate {
  SearchBloc? searchBloc;
  SearchUser(this.searchBloc);

  @override
  List<Widget>? buildActions(BuildContext context) {
    String? queryString;
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close_outlined)
      )
    ];
  }



  @override
  Widget? buildLeading(BuildContext context) {
    String? queryString;
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    String? queryString;
    queryString = query;
    searchBloc?.add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        if (state is SearchUninitialized) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchError) {
          return Center(
            child: Text('Failed To Load'),
          );
        }
        if (state is SearchLoaded) {
          if (state.stores.isEmpty) {
            return Center(
              child: Text('No Results'),
            );
          }
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 100,
                          child:Text(state.stores[index].storename.toString()),),
                      ],
                    ),
                  ),
                );

                //Text(state.recipes[index].title);
              },
              itemCount: state.stores.length);
        }
        return Scaffold();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Search Shop'),);
  }

}