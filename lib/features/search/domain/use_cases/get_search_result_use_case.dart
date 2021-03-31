import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:furnitur/features/search/domain/repositories/search_repository.dart';

class GetSearchResultUseCase implements Usecase<List<Product>, Params> {
  final SearchRepository searchRepository;

  GetSearchResultUseCase(this.searchRepository);

  @override
  Future<Either<Failure, List<Product>>> call(Params params) {
    return searchRepository.getSearchResult(params.query);
  }
}

class Params extends Equatable {
  final String query;

  Params(this.query);

  @override
  List<Object> get props => [query];
}
