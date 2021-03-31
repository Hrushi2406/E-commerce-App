import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:furnitur/features/home/domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;

  HomeBloc({this.homeRepository}) : super(HomeLoading());

  @override
  // ignore: must_call_super
  Future<void> onTransition(Transition<HomeEvent, HomeState> transition) async {
    print(transition);
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchHomeScreen) {
      //Start Home Loading State
      yield HomeLoading(); //

      //Get special offers
      // final specialOffersOrFailure = await homeRepository.getSpecialOffersUrl();

      //Special offers
      // yield* specialOffersOrFailure.fold((failure) async* {
      //   yield HomeFailure(errorHandler: failure);
      // }, (offers) async* {
      //Get For You Products
      final forYouProductsOrFailure = await homeRepository.getForYouProducts();

      yield* forYouProductsOrFailure.fold(
        (failure) async* {
          yield HomeFailure(errorHandler: failure);
        },
        (products) async* {
          yield HomeLoaded(forYouProducts: products);
        },
      );
      // });
    }
  }
}
