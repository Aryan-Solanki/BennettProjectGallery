import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:ui' as ui;


class IconPalette extends StatefulWidget {
  final String title;
  final String text;
  final IconData icon;
  final bool mobile;

  IconPalette({
    this.title,
    this.mobile,
    this.text,
    this.icon,
  });


  @override
  _IconPaletteState createState() => _IconPaletteState();
}
Color buttoncolor=Colors.black;
double elev1=0;
double elev2=0;
double elev3=0;
Color col1=Color(0xfff5f6fb);
Color col2=Color(0xfff5f6fb);
Color col3=Color(0xfff5f6fb);
class _IconPaletteState extends State<IconPalette> {
  @override
  Widget build(BuildContext context) {

    return ResponsiveBuilder(
      breakpoints: ScreenBreakpoints(
          tablet: 750,
          desktop: 1100,
          watch: 300
      ),
      builder: (context, sizingInformation) {

        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType ==
            DeviceScreenType.desktop) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                elevation: elev1,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: col1,
                    padding: EdgeInsets.all(30),
                    primary: col1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onPressed: (){

                  },
                  onHover: (x){
                    if(x){
                      setState(() {
                        col1=Colors.white;
                        col2=Color(0xfff5f6fb);
                        col3=Color(0xfff5f6fb);
                        elev1=8;
                        elev2=0;
                        elev3=0;
                      });
                    }
                    else{
                      setState(() {
                        col1=Color(0xfff5f6fb);
                        col2=Color(0xfff5f6fb);
                        col3=Color(0xfff5f6fb);
                        elev1=0;
                        elev2=0;
                        elev3=0;
                      });
                    }
                  },
                  child: Container(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: widget.mobile==true?CrossAxisAlignment.end:CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: col1,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Tab(
                                height: 100,
                                icon: ShaderMask(

                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) {
                                      return ui.Gradient.linear(
                                        Offset(20.0, 30.0),
                                        Offset(44.0, 40.0),
                                        [
                                          Colors.blue.shade400,
                                          Colors.purple.shade800,
                                        ],
                                      );
                                    },
                                    child: Icon(Icons.pie_chart_rounded,size:60,color: Colors.white,)))
                        ),
                        SizedBox(height: 20,),
                        Text("Projects Overview",style: TextStyle(
                            fontFamily: "Metrisch-Bold",fontSize: 18,color: Colors.black)),
                        SizedBox(height: 20,),
                        Text("Watch and learn from the Projects made by Bennett Achievers",textAlign: widget.mobile==true?TextAlign.right:TextAlign.left,style: TextStyle(
                            fontFamily: "Metrisch-Medium",height: 1.3, fontSize: 15,color: Colors.black54)),
                        SizedBox(height: 20,),
                        Text("Learn More...",style: TextStyle(
                            fontFamily: "Metrisch-Bold",height: 1.3, fontSize: 15,color: Colors.black)),
                        Container(
                          height: 1.5,
                          width: 80,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                elevation: elev2,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: col2,
                    padding: EdgeInsets.all(30),
                    primary: col2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onPressed: (){

                  },
                  onHover: (x){
                    if(x){
                      setState(() {
                        col1=Color(0xfff5f6fb);
                        col2=Colors.white;
                        col3=Color(0xfff5f6fb);
                        elev1=0;
                        elev2=8;
                        elev3=0;
                      });
                    }
                    else{
                      setState(() {
                        col1=Color(0xfff5f6fb);
                        col2=Color(0xfff5f6fb);
                        col3=Color(0xfff5f6fb);
                        elev1=0;
                        elev2=0;
                        elev3=0;
                      });
                    }
                  },
                  child: Container(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: widget.mobile==true?CrossAxisAlignment.end:CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: col2,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Tab(
                                height: 100,
                                icon: ShaderMask(

                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) {
                                      return ui.Gradient.linear(
                                        Offset(20.0, 30.0),
                                        Offset(44.0, 40.0),
                                        [
                                          Colors.blue.shade400,
                                          Colors.purple.shade800,
                                        ],
                                      );
                                    },
                                    child: Icon(Icons.people_rounded,size:60,color: Colors.white,)))
                        ),
                        SizedBox(height: 20,),
                        Text("Community",style: TextStyle(
                            fontFamily: "Metrisch-Bold",fontSize: 18,color: Colors.black)),
                        SizedBox(height: 20,),
                        Text("Get to know your fellow Bennatians and learn from their Projects",textAlign: widget.mobile==true?TextAlign.right:TextAlign.left,style: TextStyle(
                            fontFamily: "Metrisch-Medium",height: 1.3, fontSize: 15,color: Colors.black54)),
                        SizedBox(height: 20,),
                        Text("Learn More...",style: TextStyle(
                            fontFamily: "Metrisch-Bold",height: 1.3, fontSize: 15,color: Colors.black)),
                        Container(
                          height: 1.5,
                          width: 80,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                elevation: elev3,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: col3,
                    padding: EdgeInsets.all(30),
                    primary: col3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onPressed: (){

                  },
                  onHover: (x){
                    if(x){
                      setState(() {
                        col1=Color(0xfff5f6fb);
                        col2=Color(0xfff5f6fb);
                        col3=Colors.white;
                        elev1=0;
                        elev2=0;
                        elev3=8;
                      });
                    }
                    else{
                      setState(() {
                        col1=Color(0xfff5f6fb);
                        col2=Color(0xfff5f6fb);
                        col3=Color(0xfff5f6fb);
                        elev1=0;
                        elev2=0;
                        elev3=0;
                      });
                    }
                  },
                  child: Container(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: widget.mobile==true?CrossAxisAlignment.end:CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: col3,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Tab(
                                height: 100,
                                icon: ShaderMask(

                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) {
                                      return ui.Gradient.linear(
                                        Offset(20.0, 30.0),
                                        Offset(44.0, 40.0),
                                        [
                                          Colors.blue.shade400,
                                          Colors.purple.shade800,
                                        ],
                                      );
                                    },
                                    child: Icon(Icons.person_rounded,size: 60,color: Colors.white,)))
                        ),
                        SizedBox(height: 20,),
                        Text("DashBoard",style: TextStyle(
                            fontFamily: "Metrisch-Bold",fontSize: 18,color: Colors.black)),
                        SizedBox(height: 20,),
                        Text("Manage all your projects by tracking Activities in Dashboard",textAlign: widget.mobile==true?TextAlign.right:TextAlign.left,style: TextStyle(
                            fontFamily: "Metrisch-Medium",height: 1.3, fontSize: 15,color: Colors.black54)),
                        SizedBox(height: 20,),
                        Text("Learn More...",style: TextStyle(
                            fontFamily: "Metrisch-Bold",height: 1.3, fontSize: 15,color: Colors.black)),
                        Container(
                          height: 1.5,
                          width: 80,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 8,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(30),
              primary: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
            onPressed: (){

            },
            child: Container(
              width: 280,
              child: Column(
                crossAxisAlignment: widget.mobile==true?CrossAxisAlignment.end:CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          // color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Tab(
                        height: 100,
                          icon: ShaderMask(

                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return ui.Gradient.linear(
                              Offset(20.0, 30.0),
                              Offset(44.0, 40.0),
                              [
                                Colors.blue.shade400,
                                Colors.purple.shade800,
                              ],
                            );
                          },
                          child: Icon(widget.icon,size:60,color: Colors.white,)))
                  ),
                  SizedBox(height: 20,),
                  Text(widget.title,style: TextStyle(
                      fontFamily: "Metrisch-Bold",fontSize: 18,color: Colors.black)),
                  SizedBox(height: 20,),
                  Text(widget.text,textAlign: widget.mobile==true?TextAlign.right:TextAlign.left,style: TextStyle(
                      fontFamily: "Metrisch-Medium",height: 1.3, fontSize: 15,color: Colors.black54)),
                  SizedBox(height: 20,),
                  Text("Learn More...",style: TextStyle(
                      fontFamily: "Metrisch-Bold",height: 1.3, fontSize: 15,color: Colors.black)),
                  Container(
                    height: 1.5,
                    width: 80,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
