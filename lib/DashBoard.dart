import 'package:bennettprojectgallery/DashBoardElements/RightBoard.dart';
import 'package:flutter/material.dart';

import 'HomePageElements/Header.dart';

class DashBoard extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(current: "Dash Board",),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 500,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                    child: RightBoard()
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
