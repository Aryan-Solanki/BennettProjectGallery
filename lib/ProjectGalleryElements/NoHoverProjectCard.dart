import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NoHoverProjectCard extends StatefulWidget {

  @override
  _NoHoverProjectCardState createState() => _NoHoverProjectCardState();
}
bool hover =false;

class _NoHoverProjectCardState extends State<NoHoverProjectCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        primary: Colors.white,
        padding: EdgeInsets.all(0.0),
      ),
      onPressed: (){

      },
      onHover: (x){
        if(x){
          setState(() {
            hover=true;
          });
        }
        else{
          setState(() {
            hover=false;
          });

        }
      },
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Card(
            shadowColor: Colors.black,
            elevation: hover==true?8:1,
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 170,
                        width: 150,
                        child: Image(fit: BoxFit.cover,image: NetworkImage("https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 150,
                      child: Text(
                        "Computer Vision using Machine Learning and DeepLearning",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 15,color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 10,),
                    RatingBarIndicator(
                      rating: 3.5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 150,
                      child: Text(
                        "Aryan Singh Solanki",overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: Colors.green),
                      ),
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            child: GradientButton(title: "Open Project",buttonwidth: 165,buttonheight: 40,),
          ),
        ],
      ),
    );
  }
}