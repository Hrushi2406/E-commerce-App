import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/app_bar.dart';
import 'package:furnitur/core/ui_helper/widgets/buttons.dart';

//! 0 to-do's on this screen

class ReviewOrderMobilePortrait extends StatelessWidget {
  final String _orderNumber = 'AQ9865';
  final String _deliveryCharges = '₹50';
  final String _gstCharges = '₹59';
  final String _total = '₹13,056';
  final String _deliveryDate = 'Saturday, 13th Feb';

  final List<List<String>> _productDetails = [
    ['1', 'Combo of 5 vase', '₹2,999'],
    ['2', 'Brown lounge', '₹8,999'],
    ['1', 'Green plant vase', '₹199'],
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //showing products
  List<Widget> showProducts() {
    List<Widget> _widgets = [];

    for (int i = 0; i < _productDetails.length; i++) {
      _widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            '${_productDetails[i][0]}x ${_productDetails[i][1]}',
            style: TextStyle(
              color: kBrownColor,
              fontSize: sSp(11.0),
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            _productDetails[i][2],
            style: TextStyle(
              color: kBrownColor,
              fontSize: sSp(11.0),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ));
      _widgets.add(SizedBox(
        height: sHeight(5.0),
      ));
    }

    return _widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ReusableAppBar(
        title: 'Review Order',
        appBar: AppBar(),
        leading: IconButton(
          color: kIconColor,
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        trailing: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: sWidth(32.0),
                top: sHeight(25.0),
                right: sWidth(32.0),
                bottom: sHeight(15.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: sWidth(20.0),
                vertical: sHeight(20.0),
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(sSp(4.0)),
                boxShadow: [kCardShadow],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Order Number: $_orderNumber',
                    style: kRegularText.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(15.0),
                  ),
                  Text(
                    'Order details',
                    style: TextStyle(
                      color: kBrownColor,
                      fontSize: sSp(12.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(6.0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: showProducts(),
                  ),
                  SizedBox(
                    height: sHeight(10.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'delivery charges',
                        style: TextStyle(
                          color: kBrownColor,
                          fontSize: sSp(11.0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        _deliveryCharges,
                        style: TextStyle(
                          color: kBrownColor,
                          fontSize: sSp(11.0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sHeight(5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'GST(18%)',
                        style: TextStyle(
                          color: kBrownColor,
                          fontSize: sSp(11.0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        _gstCharges,
                        style: TextStyle(
                          color: kBrownColor,
                          fontSize: sSp(11.0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sHeight(12.0),
                  ),
                  Divider(
                    thickness: sSp(0.5),
                    color: kBrownColor,
                  ),
                  SizedBox(
                    height: sHeight(5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Total:',
                        style: TextStyle(
                          color: kBrownColor,
                          fontSize: sSp(11.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _total,
                        style: TextStyle(
                          color: kBrownColor,
                          fontSize: sSp(11.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sHeight(20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'To be delivered by: ',
                        style: TextStyle(
                          color: kBrownColor,
                          fontSize: sSp(11.0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        _deliveryDate,
                        style: TextStyle(
                          color: kBrownColor,
                          fontSize: sSp(11.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sHeight(5.0),
                  ),
                  Text(
                    'Customer service: +23 76893224',
                    style: TextStyle(
                      color: kBrownColor,
                      fontSize: sSp(11.0),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: sWidth(32.0)),
              alignment: Alignment.centerRight,
              child: ReusableRegularButton(
                text: 'PLACE ORDER',
                onPressed: () {
                  SnackBar snackBar = SnackBar(
                    content: Text('Order placed. Thank You!'),
                    backgroundColor: kBrownColor,
                  );
                  _scaffoldKey.currentState.showSnackBar(snackBar);
                  Navigator.of(context).pushNamed('/home');
                },
              ),
            ),
            SizedBox(
              height: sHeight(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
