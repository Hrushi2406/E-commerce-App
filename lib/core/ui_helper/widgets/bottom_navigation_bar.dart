import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';

class ReusableBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;

  const ReusableBottomNavigationBar({
    Key key,
    @required this.currentIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: kSkinColor,
      selectedItemColor: kBrownColor,
      unselectedItemColor: kBrownColor.withOpacity(0.45),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          title: Container(),
        ),
      ],
      onTap: onTap,
    );
  }
}
