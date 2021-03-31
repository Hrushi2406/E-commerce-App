part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchResults extends SearchEvent {
  final String query;

  GetSearchResults({this.query});

  @override
  List<Object> get props => [query];
}
