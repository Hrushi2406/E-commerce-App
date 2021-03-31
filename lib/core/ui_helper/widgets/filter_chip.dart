import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';

class ReusableFilterChip extends StatelessWidget {
  final String title;
  final bool value;
  final Function onSelected;

  const ReusableFilterChip({
    Key key,
    @required this.title,
    @required this.value,
    @required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: value,
      label: Text(
        title,
        style: TextStyle(
          color: kBrownColor,
          fontSize: sSp(12.0),
        ),
      ),
      checkmarkColor: kBrownColor,
      selectedColor: kSkinColor,
      backgroundColor: const Color(0xFFEFEFEF),
      onSelected: onSelected,
    );
  }
}
