import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/home/domain/repositories/home_repository.dart';
import 'package:furnitur/features/home/domain/use_cases/get_special_offers_url_use_case.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  MockHomeRepository mockHomeRepository;
  GetSpecialOffersUrlUseCase getSpecialOffersUrlUseCase;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getSpecialOffersUrlUseCase = GetSpecialOffersUrlUseCase(mockHomeRepository);
  });

  group('Get Special Offers URL', () {
    final List<String> _specialOffersUrls = ["card", "Just", "Cards"];

    test(
      'should return List<String> on success',
      () async {
        //arrange
        when(mockHomeRepository.getSpecialOffersUrl())
            .thenAnswer((_) async => Right(_specialOffersUrls));

        //act
        final result = await getSpecialOffersUrlUseCase.call(NoParams());

        //assert
        verify(mockHomeRepository.getSpecialOffersUrl());
        expect(result, Right(_specialOffersUrls));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        when(mockHomeRepository.getSpecialOffersUrl())
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        final result = await getSpecialOffersUrlUseCase.call(NoParams());

        //assert
        verify(mockHomeRepository.getSpecialOffersUrl());
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
