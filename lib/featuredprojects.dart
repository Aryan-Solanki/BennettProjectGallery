import 'package:flutter/material.dart';

import 'FeaturedProjectsElements/FeaturedProductCard.dart';

class FeaturedProjects extends StatefulWidget {

  @override
  _FeaturedProjectsState createState() => _FeaturedProjectsState();
}

class _FeaturedProjectsState extends State<FeaturedProjects> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50),
      color: Color(0xfff5f6fb),
      child: Column(
        children: [
          Text("\n\nFeatured Projects",
              style:TextStyle(
                  fontFamily: "Metrisch-Bold", fontSize: MediaQuery.of(context).size.height/25)),
          SizedBox(
            height: 5,
          ),
          Text(
              "Top featured Projects made by Bennetians",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Metrisch-Medium",height: 1.3, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54)),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FeaturedProductCard(),
              FeaturedProductCard(),
              FeaturedProductCard(),
            ],
          )
        ],
      ),
    );
  }
}
