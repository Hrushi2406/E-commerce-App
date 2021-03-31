import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/home/domain/repositories/home_repository.dart';

class GetSpecialOffersUrlUseCase extends Usecase<List<String>, NoParams> {
  final HomeRepository homeRepository;

  GetSpecialOffersUrlUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) {
    return homeRepository.getSpecialOffersUrl();
  }
}
