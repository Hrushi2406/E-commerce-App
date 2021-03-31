part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final ErrorHandler errorHandler;

  SearchFailure({this.errorHandler});
}

class SearchResults extends SearchState {
  final List<ProductModel> searchResults;

  SearchResults({this.searchResults});
}
