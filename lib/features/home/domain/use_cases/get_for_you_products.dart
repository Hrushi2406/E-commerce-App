import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:furnitur/features/home/domain/repositories/home_repository.dart';

class GetForYouProductsUseCase extends Usecase<List<Product>, NoParams> {
  final HomeRepository homeRepository;

  GetForYouProductsUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) {
    return homeRepository.getForYouProducts();
  }
}
