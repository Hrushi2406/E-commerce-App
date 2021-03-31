import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/features/categories/domain/repositories/category_repository.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CategoryRepository categoryRepository;

  ProductBloc({this.categoryRepository}) : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is FetchProductOfCategoryEvent) {
//set loading
      yield ProductLoading();

      //call the method
      final productsOrFailure =
          await categoryRepository.getProductsForCategory(event.categoryEnum);

      //handle product or failure
      yield* productsOrFailure.fold(
        (failure) async* {
          yield ProductFailure(errorHandler: failure);
        },
        (products) async* {
          if (products.length == 0) {
            yield ProductFailure(
                errorHandler:
                    ErrorHandler().setError(errorMessage: "No Products found"));
            return;
          }
          yield ProductLoaded(
              products: products, type: ProductTypeEnum.CategoryProducts);
        },
      );
    } else if (event is FetchAllProducts) {
//set loading
      yield ProductLoading();

      //call the method
      final productsOrFailure = await categoryRepository.getAllProducts();

      //handle product or failure
      yield* productsOrFailure.fold(
        (failure) async* {
          yield ProductFailure(errorHandler: failure);
        },
        (products) async* {
          if (products.length == 0) {
            yield ProductFailure(
                errorHandler:
                    ErrorHandler().setError(errorMessage: "No Products found"));
            return;
          }
          yield ProductLoaded(
              products: products, type: ProductTypeEnum.AllProducts);
        },
      );
    }
  }
}
