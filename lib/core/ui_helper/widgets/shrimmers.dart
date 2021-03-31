import 'package:flutter/material.dart';
import 'package:furnitur/core/utils/shrimmer.dart';

import '../ui_helper.dart';

class DummyHorizontalCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[300].withOpacity(0.6),
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: sHeight(15.0),
          bottom: sHeight(20.0),
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            height: sWidth(80.0),
            margin: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: sHeight(80.0),
                  width: sWidth(100.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                SizedBox(
                  width: sWidth(15.0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: sHeight(10)),
                      height: sHeight(8.0),
                      width: sWidth(150.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                    SizedBox(
                      height: sWidth(10.0),
                    ),
                    Container(
                      height: sWidth(7.0),
                      width: sWidth(100.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                    SizedBox(
                      height: sWidth(20.0),
                    ),
                    Container(
                      height: sWidth(7.0),
                      width: sWidth(80.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: sWidth(15.0),
          );
        },
      ),
    );
  }
}

class DummyVerticalCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[300].withOpacity(0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: sHeight(35.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
                height: sHeight(8.0),
                width: sWidth(120.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
                height: sHeight(10.0),
                width: sWidth(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: sHeight(25.0)),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: sHeight(155.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: sHeight(100.0),
                              width: sWidth(135.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                            SizedBox(
                              height: sHeight(10.0),
                            ),
                            Container(
                              height: sHeight(8.0),
                              width: sWidth(100.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                            SizedBox(
                              height: sHeight(5.0),
                            ),
                            Container(
                              height: sHeight(8.0),
                              width: sWidth(80.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: sHeight(155.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: sHeight(100.0),
                              width: sWidth(135.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                            SizedBox(
                              height: sHeight(10.0),
                            ),
                            Container(
                              height: sHeight(8.0),
                              width: sWidth(100.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                            SizedBox(
                              height: sHeight(5.0),
                            ),
                            Container(
                              height: sHeight(8.0),
                              width: sWidth(80.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: sWidth(15.0),
                );
              },
            ),
          ),
        ],
      ),

      // child: Container(
      //   height: sHeight(155.0),
      //   width: sWidth(135.0),
      //   decoration: BoxDecoration(
      //     color: kWhiteColor,
      //     boxShadow: [kCardShadow],
      //     borderRadius: BorderRadius.circular(sSp(4.0)),
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       ClipRRect(
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(sSp(4.0)),
      //           topRight: Radius.circular(sSp(4.0)),
      //         ),
      //         child: Container(),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(
      //           left: sWidth(16.0),
      //           bottom: sWidth(10.0),
      //           right: sWidth(10.0),
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Container(width: 100, height: 20, color: Colors.white),
      //             // Text(
      //             //   product.name,
      //             //   style: kCardTitle,
      //             //   maxLines: 1,
      //             //   overflow: TextOverflow.ellipsis,
      //             // ),
      //             SizedBox(
      //               height: sWidth(3.0),
      //             ),
      //             // Text(
      //             //   product.mainCategory,
      //             //   style: kCardSubtitle,
      //             // ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
