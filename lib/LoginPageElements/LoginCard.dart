import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final myController = TextEditingController();
  bool Hover=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.height/2.3,
        height: MediaQuery.of(context).size.height/1.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login",
                style: TextStyle(
                    height: 1.3,
                    fontFamily: "Metrisch-ExtraBold", fontSize: MediaQuery.of(context).size.height/25)),
            SizedBox(height: 15,),
            Container(
              child: Text(
                "Please enter your credentials first.\nWo'nt be shared publicly.",
                style: TextStyle(
                    fontFamily: "Metrisch-Medium",height: 1.3, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black),
              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey.shade200,
                ),
                height: 40,
                child: TextField(
                  style: TextStyle(

                      fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintStyle: TextStyle(

                        fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
                    hintText: 'User Name',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey.shade200,
                ),


                height: 40,
                child: TextField(
                  style: TextStyle(

                      fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintStyle: TextStyle(

                        fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
                    hintText: 'User Name',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Align(alignment: Alignment.center,child: GradientButton(buttonwidth: 300,)),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: (){

                },
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                  ),
                onHover: (x){
                  if(x){
                    setState(() {
                      Hover=true;
                    });
                  }
                  else{
                    setState(() {
                      Hover=false;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Hover==true?Colors.black54:Colors.white),),
                  ),
                  child: Text("Back to Home Page",
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",color: Colors.black54 ,fontSize: MediaQuery.of(context).size.height/50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
