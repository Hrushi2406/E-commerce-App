import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:furnitur/features/search/domain/repositories/search_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;

  SearchBloc({this.searchRepository}) : super(SearchInitial());

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(
    Stream<SearchEvent> events,
    transitionFn,
  ) {
    final differedEvents = events
        .where((e) => e is GetSearchResults)
        .debounceTime(const Duration(milliseconds: 700))
        .distinct()
        .switchMap(transitionFn);
    //not affected events
    final forwardedEvents = events
        .where(
          (e) => e is! GetSearchResults,
        )
        .asyncExpand(transitionFn);
    return forwardedEvents.mergeWith([differedEvents]);
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is GetSearchResults) {
      //set loading
      yield SearchLoading();

      //call the method
      final productsOrFailure =
          await searchRepository.getSearchResult(event.query);

      //handle product or failure
      yield* productsOrFailure.fold(
        (failure) async* {
          yield SearchFailure(errorHandler: failure);
        },
        (products) async* {
          if (products.length == 0) {
            yield SearchFailure(
                errorHandler:
                    ErrorHandler().setError(errorMessage: "No Products found"));
            return;
          }
          yield SearchResults(searchResults: products);
        },
      );
    }
  }
}
