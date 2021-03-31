import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/features/categories/domain/repositories/category_repository.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

class GetProductsForCategoryUseCase implements Usecase<List<Product>, Params> {
  final CategoryRepository categoryRepository;

  GetProductsForCategoryUseCase(this.categoryRepository);

  @override
  Future<Either<Failure, List<Product>>> call(Params params) {
    return categoryRepository.getProductsForCategory(params.categoryEnum);
  }
}

class Params extends Equatable {
  final CategoryEnum categoryEnum;

  Params(this.categoryEnum);

  @override
  List<Object> get props => [categoryEnum];
}
