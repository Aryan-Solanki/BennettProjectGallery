import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';


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
double elev=0;
Color col=Color(0xfff5f6fb);
class _IconPaletteState extends State<IconPalette> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType ==
            DeviceScreenType.desktop) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            elevation: elev,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: col,
                padding: EdgeInsets.all(30),
                primary: col,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    col=Colors.white;
                    elev=8;
                  });
                }
                else{
                  setState(() {
                    col=Color(0xfff5f6fb);
                    elev=0;
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
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Icon(widget.icon,size:MediaQuery.of(context).size.height/30,color: Colors.white,)
                    ),
                    SizedBox(height: 20,),
                    Text(widget.title,style: TextStyle(
                        fontFamily: "Metrisch-Bold",fontSize: MediaQuery.of(context).size.height/35,color: Colors.black)),
                    SizedBox(height: 20,),
                    Text(widget.text,textAlign: widget.mobile==true?TextAlign.right:TextAlign.left,style: TextStyle(
                        fontFamily: "Metrisch-Medium",height: 1.3, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54)),
                    SizedBox(height: 20,),
                    Text("Learn More...",style: TextStyle(
                        fontFamily: "Metrisch-Bold",height: 1.3, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black)),
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
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Icon(widget.icon,size:MediaQuery.of(context).size.height/30,color: Colors.white,)
                  ),
                  SizedBox(height: 20,),
                  Text(widget.title,style: TextStyle(
                      fontFamily: "Metrisch-Bold",fontSize: MediaQuery.of(context).size.height/35,color: Colors.black)),
                  SizedBox(height: 20,),
                  Text(widget.text,textAlign: widget.mobile==true?TextAlign.right:TextAlign.left,style: TextStyle(
                      fontFamily: "Metrisch-Medium",height: 1.3, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54)),
                  SizedBox(height: 20,),
                  Text("Learn More...",style: TextStyle(
                      fontFamily: "Metrisch-Bold",height: 1.3, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black)),
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
