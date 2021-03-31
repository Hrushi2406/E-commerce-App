import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/app_bloc/applevel_bloc.dart';
import 'package:furnitur/features/authentication/presentation/screens/login_screen/login_screen.dart';
import 'package:furnitur/features/authentication/presentation/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:furnitur/screens/splash_screen/splash_screen.dart';
import 'package:furnitur/screens/tabs/tabs.dart';

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplevelBloc, ApplevelState>(builder: (context, state) {
      if (state is AppLevelIntial) {
        return SplashScreen();
      } else if (state is AppLevelUnauthenticated) {
        return LoginScreen();
      } else if (state is AppLevelAuthenticated) {
        return TabsScreen();
      } else if (state is AppFirstTime) {
        return OnBoardingScreen();
      } else {
        return Container(child: Text("Something went wrong"));
      }
    });
  }
}
