import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/features/authentication/data/data_sources/auth_local_datasource.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  AuthLocalDatasourceImpl localDatasource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = new MockSharedPreferences();
    localDatasource =
        new AuthLocalDatasourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getAuthToken', () {
    final token = "string";
    test(
      'should return the auth token ',
      () async {
        //arrage
        when(mockSharedPreferences.getString(any)).thenReturn("string");

        //act
        final result = await localDatasource.getAuthToken();

        //assert
        verify(mockSharedPreferences.getString('token'));
        expect(result, equals(token));
      },
    );
    test(
      'should throw an CacheException when there is not a cached value',
      () async {
        //arrage
        when(mockSharedPreferences.getString(any)).thenReturn(null);

        //act
        final result = await localDatasource.getAuthToken();

        //assert
        expect(result, equals(null));
      },
    );
  });

  group('setAuthToken', () {
    final token = "string";
    test(
      'should call shared prefrences to cache the token',
      () async {
        //act
        await localDatasource.setAuthToken(token);

        //assert
        verify(mockSharedPreferences.setString('token', token));
      },
    );
  });
}
