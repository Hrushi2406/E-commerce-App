import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/features/authentication/data/data_sources/auth_local_datasource.dart';

part 'applevel_event.dart';
part 'applevel_state.dart';

class ApplevelBloc extends Bloc<ApplevelEvent, ApplevelState> {
  final AuthLocalDatasource localDatasource;
  final ServerInteractor server;

  ApplevelBloc({this.localDatasource, this.server}) : super(AppLevelIntial());

  @override
  // ignore: must_call_super
  Future<void> onTransition(
      Transition<ApplevelEvent, ApplevelState> transition) async {
    print(transition);
  }

  @override
  Stream<ApplevelState> mapEventToState(
    ApplevelEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AppLevelIntial();
      await Future.delayed(Duration(milliseconds: 900));
      //Check if user has entered for first time
      final bool isFirstTime = await localDatasource.isFirstTime();

      if (isFirstTime) {
        yield AppFirstTime();
      } else {
        print(await localDatasource.getAuthToken());
        //Check if user has token or not
        final String token = await localDatasource.getAuthToken();

        if (token.isNotEmpty) {
          //if has token set headers
          server.setDefaultHeaders({'authorization': token});

//yield state authenticated
          yield AppLevelAuthenticated();
        } else {
          yield AppLevelUnauthenticated();
        }
      }
    } else if (event is SetAuthenticated) {
      add(AppStarted());
    } else if (event is SetUnauthenticated) {
      //delete token
      localDatasource.setAuthToken('');

      //remove headers
      server.setDefaultHeaders({});
      yield AppLevelUnauthenticated();
    } else if (event is SetIsFirstTime) {
      await localDatasource.setIsFirstTime();
      add(AppStarted());
    }
  }
}
