import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardExpandAnimation extends StatefulWidget {
  final String imagelink;
  final bool left;
  final double widdth;
  CardExpandAnimation({this.imagelink,this.widdth,this.left, Key key}) : super(key: key);
  @override
  _CardExpandAnimationState createState() => _CardExpandAnimationState();
}

class _CardExpandAnimationState extends State<CardExpandAnimation> {
  BorderRadius border;
  Color color;
  double height;
  double width;
  bool animate;
  bool textAppear;
  @override
  void initState() {
    super.initState();
    animate = false;
    textAppear = false;
    changer(animate);
  }
  void changer(bool a) {
    setState(() {
      if (a) {
        height = 370;
        width = 700;
        color = Color(0xff004b93);
        border = BorderRadius.circular(40.0);
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 370;
        width = 370;
        color = Color(0xff004b93);
        border = BorderRadius.circular(300.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (a) {
          setState(() {
            animate = true;
            changer(animate);
          });
        },
        onExit: (a) {
          setState(() {
            animate = false;
            changer(animate);
            textAppear = false;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width/widget.widdth,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: AnimatedContainer(
                  height: height,
                  width: width,
                  duration: Duration(milliseconds: 275),
                  padding:
                  EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
                  decoration: BoxDecoration(
                    borderRadius: border,
                    color: color,
                  ),
                  child: AnimatedOpacity(
                    opacity: textAppear? 1 : 0,
                    duration: Duration(milliseconds: textAppear? 400 : 100),
                    curve: Curves.easeOut,
                    child: Align(
                      alignment: widget.left==true?Alignment.topRight:Alignment.topLeft,
                      child: Column(
                        children: [
                          Text("Learn",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/35,
                              fontWeight: FontWeight.w700,
                            color: Colors.white
                          )),
                          Container(
                            padding: EdgeInsets.only(top: 10.0),
                            width: 170,
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                style: GoogleFonts.nunito(
                                fontSize: MediaQuery.of(context).size.height/52,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: AnimatedContainer(
                  padding: widget.left==true?EdgeInsets.only(right: animate? 270 : 0):EdgeInsets.only(left: animate? 270 : 0),
                  duration: Duration(milliseconds: 270),
                  height: height,
                  child: ClipRRect(
                    borderRadius: animate?border:BorderRadius.circular(40.0),
                    child: Image(
                      image: NetworkImage(widget.imagelink),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
