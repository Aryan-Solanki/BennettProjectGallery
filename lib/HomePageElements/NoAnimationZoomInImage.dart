import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoAnimationZoomInImage extends StatefulWidget {
  final String ImageLink;
  final String Name;
  final String Title;
  const NoAnimationZoomInImage({
    this.ImageLink,
    this.Name,
    this.Title,
  });


  @override
  _NoAnimationZoomInImageState createState() => _NoAnimationZoomInImageState();
}

Color col1=Colors.blue;
Color col2=Colors.blue.shade900;
List <Color> colors=[
  col1,
  col2,
];

class _NoAnimationZoomInImageState extends State<NoAnimationZoomInImage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              elevation: 8,
              child: Container(
                clipBehavior: Clip.hardEdge,
                padding: EdgeInsets.all(10),
                width: 200,
                height: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.ImageLink,),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 218,
              left: 50,
              child: InkWell(
                onTap: (){

                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    gradient:LinearGradient(
                      begin:  FractionalOffset(0.0, 0.0),
                      end:  FractionalOffset(1.0, 0.0),
                      colors: colors,
                    ),
                  ),
                  child: Center(
                      child:  FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 15,)
                  ),
                ),
              ),
            ),
            Positioned(
              top: 218,
              left: 89,
              child: InkWell(
                onTap: (){

                },
                child: AnimatedContainer(
                  height: 30,
                  width: 30,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    gradient:LinearGradient(
                      begin:  FractionalOffset(0.0, 0.0),
                      end:  FractionalOffset(1.0, 0.0),
                      colors: colors,
                    ),
                  ),
                 child: Center(
                      child:  FaIcon(FontAwesomeIcons.facebookF,color: Colors.white,size: 18,)
                  ),
                ),
              ),
            ),
            Positioned(
              top: 218,
              right: 50,
              child: InkWell(
                onTap: (){

                },
                child: AnimatedContainer(
                  height: 30,
                  width: 30,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    gradient:LinearGradient(
                      begin:  FractionalOffset(0.0, 0.0),
                      end:  FractionalOffset(1.0, 0.0),
                      colors: colors,
                    ),
                  ),
                  child: Center(
                      child:  FaIcon(FontAwesomeIcons.linkedinIn,color: Colors.white,size: 18,)
                  ),
                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 30,),
        Text(widget.Name,style: TextStyle(
            fontFamily: "Metrisch-Bold",fontSize: 18,color: Colors.black)),
        SizedBox(height: 5,),
        Text(widget.Title,style: TextStyle(
            fontFamily: "Metrisch-Medium",height: 1.3, fontSize: 15,color: Colors.black54)),
      ],
    );
  }
}
