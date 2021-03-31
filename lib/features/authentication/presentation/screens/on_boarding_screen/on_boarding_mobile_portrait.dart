import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/app_bloc/applevel_bloc.dart';

import '../../../../../core/ui_helper/ui_helper.dart';

//! No To-Do in this file

class OnBoardingMobilePortrait extends StatefulWidget {
  @override
  _OnBoardingMobilePortraitState createState() =>
      _OnBoardingMobilePortraitState();
}

class _OnBoardingMobilePortraitState extends State<OnBoardingMobilePortrait> {
  //index of current page of onBoarding screen
  int _currentPageIndex = 0;

  //list of onBoarding Pages
  final List<Widget> _pages = [
    _ScreenOne(),
    _ScreenTwo(),
    _ScreenThree(),
  ];

  //used to determine the drag on the screen
  int _dragValue = 0;
  bool _forward = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        //used to determine the drag
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          if (details.delta.dx > 0) {
            _dragValue = 1;
          } else if (details.delta.dx < 0) {
            _dragValue = -1;
          }
        },
        //what to do after drag is finished
        onHorizontalDragEnd: (_) {
          if (_dragValue == -1 && _currentPageIndex != 2) {
            setState(() {
              _currentPageIndex++;
              _forward = true;
            });
          } else if (_dragValue == 1 && _currentPageIndex != 0) {
            setState(() {
              _currentPageIndex--;
              _forward = false;
            });
          }
          _dragValue = 0;
        },
        //gives fade-in transition between the pages
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: !_forward,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          //showing current page
          child: _pages[_currentPageIndex],
        ),
      ),
    );
  }
}

//screen one
class _ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Skeleton(
      screenIndex: 0,
      imageName: 'furniture.png',
      headline: 'Furniture for everything',
      description: '''From home furniture to office,
we have got you covered''',
    );
  }
}

//screen two
class _ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Skeleton(
      screenIndex: 1,
      imageName: 'money.png',
      headline: 'Get more, spend less',
      description: '''Low prices, regular discounts & referral
programs equals huge savings''',
    );
  }
}

//screen three
class _ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Skeleton(
      screenIndex: 2,
      imageName: 'shop.png',
      headline: 'No more waiting',
      description: '''Dive right in and get the products that
you always wanted to have''',
    );
  }
}

//skeleton for the onBoarding screen
class _Skeleton extends StatelessWidget {
  final int screenIndex;
  final String imageName;
  final String headline;
  final String description;

  const _Skeleton({
    Key key,
    @required this.screenIndex,
    @required this.imageName,
    @required this.headline,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/$imageName'),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: sHeight(40.0),
            ),
            Text(
              headline,
              style: kHeading1,
            ),
            SizedBox(
              height: sHeight(15.0),
            ),
            Text(
              description,
              style: kSubheading.copyWith(
                height: sSp(1.3),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: sHeight(40.0),
            ),
            Hero(
              tag: 'position',
              child: MaterialButton(
                onPressed: () {
                  BlocProvider.of<ApplevelBloc>(context).add(SetIsFirstTime());
                  Navigator.of(context).pushReplacementNamed('/splash');
                },
                color: kOrangeColor,
                splashColor: kWhiteColor.withOpacity(0.2),
                height: sHeight(45.0),
                minWidth: sWidth(12.0),
                highlightElevation: 0.0,
                child: Text(
                  'GET STARTED',
                  style: kButtonText.copyWith(
                    color: kWhiteColor,
                    fontSize: sSp(14.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: sHeight(70.0),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: sHeight(32.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: sWidth(8.0),
                width: sWidth(8.0),
                decoration: BoxDecoration(
                  color: screenIndex == 0 ? kOrangeColor : kSkinColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: sWidth(8.0),
              ),
              Container(
                height: sWidth(8.0),
                width: sWidth(8.0),
                decoration: BoxDecoration(
                  color: screenIndex == 1 ? kOrangeColor : kSkinColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: sWidth(8.0),
              ),
              Container(
                height: sWidth(8.0),
                width: sWidth(8.0),
                decoration: BoxDecoration(
                  color: screenIndex == 2 ? kOrangeColor : kSkinColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
