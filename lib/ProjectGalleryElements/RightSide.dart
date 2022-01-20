import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

import 'ProjectCard.dart';

class RightSide extends StatefulWidget {

  @override
  _RightSideState createState() => _RightSideState();
}
String selectedKey="Default sorting";
class _RightSideState extends State<RightSide> {


  List<String> keys = <String>[
    'Default sorting',
    'Sort by popularity',
    'Sort by rating',
    'Sort by latest',
  ];



  @override
  Widget build(BuildContext context) {
    final Widget normalChildButton = Container(
      color: Color(0xfff3f5fe),
      width: 250,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                child: Text(selectedKey, overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black54),),
            ),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 800,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Showing 1–9 of 12 results",style: TextStyle(fontFamily: "Metrisch-Medium",height: 1.5, fontSize:15,color: Colors.black54),
              ),
              MenuButton<String>(
                child: normalChildButton,
                items: keys,
                itemBuilder: (String value) => Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
                  child: Text(value,style: TextStyle(fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black54),),
                ),
                toggledChild: Container(
                  child: normalChildButton,
                ),
                onItemSelected: (String value) {
                  setState(() {
                    selectedKey = value;
                  });
                },
                onMenuButtonToggle: (bool isToggle) {
                  print(isToggle);
                },
              )

            ],

          ),
          SizedBox(height: 40,),
          Container(
            height: 1300,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,mainAxisSpacing: 40,childAspectRatio: 0.68,crossAxisSpacing: 20
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProjectCard();
              },
            ),
          ),

        ],
      ),
    );
  }
}
