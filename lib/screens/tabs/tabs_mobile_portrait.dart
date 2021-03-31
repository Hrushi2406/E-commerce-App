import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/app_bloc/applevel_bloc.dart';
import 'package:furnitur/core/ui_helper/custom_icons/custom_icons_icons.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/app_bar.dart';
import 'package:furnitur/core/ui_helper/widgets/bottom_navigation_bar.dart';
import 'package:furnitur/screens/category_screen/category_screen.dart';
import 'package:furnitur/screens/home_screen/home_screen.dart';
import 'package:furnitur/screens/profile_screen/profile_screen.dart';

class TabsMobilePortrait extends StatefulWidget {
  @override
  _TabsMobilePortraitState createState() => _TabsMobilePortraitState();
}

class _TabsMobilePortraitState extends State<TabsMobilePortrait> {
  int _currentIndex = 0;
  List<String> _titles = ['Home', 'Categories', 'Profile'];

  List<Widget> _tabsList = [
    HomeScreen(isScreenTwo: false),
    CategoryScreen(),
    ProfileScreen(),
  ];

  List<IconButton> _homeTrailingIcons(BuildContext context) {
    return <IconButton>[
      IconButton(
        color: kOrangeColor,
        icon: Icon(CustomIcons.shopping_bag),
        onPressed: () {
          Navigator.of(context).pushNamed('/cart');
        },
      ),
      IconButton(
        color: kIconColor,
        icon: Icon(Icons.search),
        onPressed: () {
          Navigator.of(context).pushNamed('/search');
        },
      ),
    ];
  }

  List<FlatButton> _profileTrailingIcons(BuildContext context) {
    return [
      FlatButton(
        child: Text(
          'Log out',
          style: kRegularText,
        ),
        splashColor: kOrangeColor.withOpacity(0.2),
        highlightColor: kOrangeColor.withOpacity(0.2),
        onPressed: () {
          //
          BlocProvider.of<ApplevelBloc>(context).add(SetUnauthenticated());

          Navigator.of(context).pushReplacementNamed('/login');
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: _titles[_currentIndex],
        appBar: AppBar(),
        trailing: _currentIndex == 2
            ? _profileTrailingIcons(context)
            : _homeTrailingIcons(context),
      ),
      bottomNavigationBar: ReusableBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _tabsList[_currentIndex],
      ),
    );
  }
}
