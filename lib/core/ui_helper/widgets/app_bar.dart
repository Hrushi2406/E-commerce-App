import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final IconButton leading;
  final List<Widget> trailing;

  const ReusableAppBar({
    Key key,
    @required this.title,
    @required this.appBar,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      title: Text(
        title,
        style: kTitle,
      ),
      leading: leading,
      actions: trailing,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
