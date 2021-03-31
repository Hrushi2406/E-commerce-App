import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/app_bloc/applevel_bloc.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/features/authentication/presentation/screens/login_screen/login_screen.dart';
import 'package:furnitur/features/authentication/presentation/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:furnitur/features/home/presentation/bloc/home_bloc.dart';
import 'package:furnitur/screens/tabs/tabs.dart';

class SplashMobilePortrait extends StatefulWidget {
  @override
  _SplashMobilePortraitState createState() => _SplashMobilePortraitState();
}

class _SplashMobilePortraitState extends State<SplashMobilePortrait>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _scaleController;
  Animation<Offset> _positionAnimation;
  Animation<double> _scaleAnimation;

  //keeping the status of loading
  bool success = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _positionAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.5),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: _controller,
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: sWidth(120.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.easeInCubic,
        parent: _scaleController,
      ),
    );

    //play the animation
    play();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();

    super.dispose();
  }

  void play() async {
    // loadData();
    //play animation while data
    //is loading
    while (!success) {
      //animation in loop
      await _controller.reverse();
      await _controller.forward();
    }
  }

  void loadData() async {
    //TODO: load data here
    //dummy data loading
    // await Future.delayed(Duration(milliseconds: 4000));

    //change success when data is loaded
    setState(() {
      success = true;
    });
    await _controller.forward();
    //navigate to given screen
    // navigate();
  }

  void navigate(screen) {
    scale();
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, primaryAnimation, secondaryAnimation) {
          return screen;
        },
        transitionsBuilder:
            (context, primaryAnimation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: primaryAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void scale() {
    _scaleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplevelBloc, ApplevelState>(
        listener: (context, state) {
      //App First TIme
      if (state is AppFirstTime) {
        loadData();
        navigate(OnBoardingScreen());
      }

      //Navigate To Login screen
      if (state is AppLevelUnauthenticated) {
        loadData();
        navigate(LoginScreen());
      }

      //Navigate To Home Screen
      if (state is AppLevelAuthenticated) {
        // ignore: close_sinks
        HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

        homeBloc.add(FetchHomeScreen());
        homeBloc.listen((state) {
          if (state is HomeLoaded) {
            loadData();
            navigate(TabsScreen());
          }
        });
        homeBloc.close();
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: <Widget>[
              Image.asset(
                'assets/images/logo_splash.png',
                width: sWidth(162.0),
              ),
              Positioned(
                top: sWidth(12.0),
                right: sWidth(62.5),
                child: SlideTransition(
                  position: _positionAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: AnimatedContainer(
                      curve: Curves.easeOut,
                      duration: const Duration(seconds: 1),
                      height: sWidth(9.0),
                      width: sWidth(9.0),
                      decoration: BoxDecoration(
                        color: kOrangeColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
