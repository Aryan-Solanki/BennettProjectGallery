import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:flutter/material.dart';

import '../login.dart';

class ForgotPasswordCard extends StatefulWidget {

  @override
  _ForgotPasswordCardState createState() => _ForgotPasswordCardState();
}

class _ForgotPasswordCardState extends State<ForgotPasswordCard> {
  final myController = TextEditingController();
  bool Hoveralreadyhaveaccnt=false;
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
            Text("Forgot Password",
                style: TextStyle(
                    height: 1.3,
                    fontFamily: "Metrisch-ExtraBold", fontSize: MediaQuery.of(context).size.height/25)),
            SizedBox(height: 15,),
            Container(
              child: Text(
                "Please enter your email first.\nVerification link will be send",
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
                    hintText: 'roll@bennett.edu.in',
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
            Align(alignment: Alignment.center,child: GradientButton(title: "Send Verification",buttonwidth: 300,)),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onHover: (x){
                  if(x){
                    setState(() {
                      Hoveralreadyhaveaccnt=true;
                    });
                  }
                  else{
                    setState(() {
                      Hoveralreadyhaveaccnt=false;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Hoveralreadyhaveaccnt==true?Colors.black54:Colors.white),),
                  ),
                  child: Text("Already have an Account ?",
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
