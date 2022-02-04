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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(current: "Dash Board",),
          Container(
            height: MediaQuery.of(context).size.height-60,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                    top: 0,
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
