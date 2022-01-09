import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class GradientButton extends StatefulWidget {


  @override
  _GradientButtonState createState() => _GradientButtonState();
}



Color col1=Colors.lightGreen.shade500;
Color col2=Colors.deepOrange.shade800;
List <Color> colors=[
  col1,
  col2,
];


class _GradientButtonState extends State<GradientButton> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onHover: (x){
        if(x){
          setState(() {
            colors=[
              col2,
              col1,
            ];
          });

        }
        else{
          setState(() {
            colors=[
              col1,
              col2,
            ];
          });
        }
      },
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: Colors.white,
        primary: Colors.black87,
        padding: EdgeInsets.all(0.0),
      ),
      child: AnimatedContainer(
        height: 50,
        width: 180,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient:LinearGradient(
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
              colors: colors
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 30, vertical: 8),
        child: Center(
          child: Text(
            "Explore More",
            style: TextStyle(color: Colors.white,
                height: 1.3,
                fontFamily: "Metrisch-Bold", fontSize: MediaQuery.of(context).size.height/40),
          ),
        ),
      ),
    );
  }
}