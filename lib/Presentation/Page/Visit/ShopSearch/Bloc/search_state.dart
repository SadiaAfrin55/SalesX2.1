import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../Data/Model/Store/Store.dart';


abstract class SearchState extends Equatable {}

class SearchUninitialized extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  List<Store> stores;
  SearchLoaded({required this.stores});
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  @override
  List<Object> get props => [];
}
