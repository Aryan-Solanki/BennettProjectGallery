import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ZoomInImage extends StatefulWidget {
  final String ImageLink;
  final String Name;
  final String Title;
  const ZoomInImage({
    this.ImageLink,
    this.Name,
    this.Title,
  });


  @override
  _ZoomInImageState createState() => _ZoomInImageState();
}

Color col1=Colors.blue;
Color col2=Colors.blue.shade900;
List <Color> colors=[
  col1,
  col2,
];

bool isHover1=false;
bool isHover2=false;
bool isHover3=false;
bool isImageHover=false;

class _ZoomInImageState extends State<ZoomInImage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation _animation;
  Animation padding;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 275),
      vsync: this,
    );

    _animation=Tween(begin: 1.0,end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease)
    );

    padding=Tween(begin: 0.0,end: -25).animate(
        CurvedAnimation(parent: _controller, curve: Curves.ease)
    );

    _controller.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            MouseRegion(
              onEnter: (x){
                setState(() {
                  _controller.forward();
                });
              },
              onExit: (x){
                setState(() {
                  _controller.reverse();
                });
              },
              child: Card(
                elevation: 8,
                child: Container(
                  transform: Matrix4(_animation.value,0,0,0,0,_animation.value,0,0,0,0,1,0,padding.value,padding.value,0,1),
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
            ),
            Positioned(
              top: 210,
              left: 50,
              child: InkWell(
                onTap: (){

                },
                  onHover: (x){
                    if(x){
                      setState(() {
                        isHover1=true;
                      });
                    }
                    else{
                      setState(() {
                        isHover1=false;
                      });
                    }
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
                  margin: EdgeInsets.only(bottom: (isHover1) ? 5 : 0.0, top: (isHover1) ? 0 : 5),
                  child: Center(
                      child:  FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 15,)
                  ),
                ),
              ),
            ),
            Positioned(
              top: 210,
              left: 89,
              child: InkWell(
                onTap: (){

                },
                onHover: (x){
                  if(x){
                    setState(() {
                      isHover2=true;
                    });
                  }
                  else{
                    setState(() {
                      isHover2=false;
                    });
                  }
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
                  margin: EdgeInsets.only(bottom: (isHover2) ? 5 : 0.0, top: (isHover2) ? 0 : 5),
                  child: Center(
                      child:  FaIcon(FontAwesomeIcons.facebookF,color: Colors.white,size: 18,)
                  ),
                ),
              ),
            ),
            Positioned(
              top: 210,
              right: 50,
              child: InkWell(
                onTap: (){

                },
                onHover: (x){
                  if(x){
                    setState(() {
                      isHover3=true;
                    });
                  }
                  else{
                    setState(() {
                      isHover3=false;
                    });
                  }
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
                  margin: EdgeInsets.only(bottom: (isHover3) ? 5 : 0.0, top: (isHover3) ? 0 : 5),
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
