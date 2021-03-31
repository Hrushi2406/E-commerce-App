import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker dataConnectionChecker;
  NetworkInfoImpl networkInfoImpl;

  setUp(() {
    dataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(connectionChecker: dataConnectionChecker);
  });

  group('Get Network Status', () {
    test(
      'should return true if connected to internet',
      () async {
        //arrange
        when(dataConnectionChecker.hasConnection).thenAnswer((_) async => true);

        //act
        var result = await networkInfoImpl.isConnected;

        //assert
        expect(result, equals(true));
      },
    );

    test(
      'should return false if not connected to internet',
      () async {
        //arrange
        when(dataConnectionChecker.hasConnection)
            .thenAnswer((_) async => false);

        //act
        var result = await networkInfoImpl.isConnected;

        //assert
        expect(result, equals(false));
      },
    );
  });
}
