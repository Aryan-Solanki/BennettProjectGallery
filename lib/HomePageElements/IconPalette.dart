import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
class _IconPaletteState extends State<IconPalette> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 8,
      child: TextButton(
        style: TextButton.styleFrom(
          // backgroundColor: Colors.red,
          padding: EdgeInsets.all(30),
          primary: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        onPressed: (){

        },
        child: Container(
          width: 180,
          child: Column(
            crossAxisAlignment: widget.mobile==true?CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Icon(widget.icon,size:MediaQuery.of(context).size.height/40,color: Colors.white,)
              ),
              SizedBox(height: 10,),
              Text(widget.title,style: TextStyle(
                  fontFamily: "Metrisch-Bold",fontSize: MediaQuery.of(context).size.height/45,color: Colors.black)),
              SizedBox(height: 10,),
              Text(widget.text,textAlign: widget.mobile==true?TextAlign.right:TextAlign.left,style: TextStyle(
                  fontFamily: "Metrisch-Medium",height: 1.3, fontSize: MediaQuery.of(context).size.height/52,color: Colors.black54)),
              SizedBox(height: 10,),
              Text("Learn More...",style: TextStyle(
                  fontFamily: "Metrisch-Bold",height: 1.3, fontSize: MediaQuery.of(context).size.height/52,color: Colors.black)),
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
}
