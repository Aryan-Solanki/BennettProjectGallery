import 'package:flutter/material.dart';

class Header extends StatefulWidget {

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 50,child: Image.asset("assets/logo.png")),
          Container(

            child: Row(
              children: [
                Text("About Us"),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(width: 1,color: Colors.black54,height: 20,),
                ),
                Text("About Us"),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(width: 1,color: Colors.black54,height: 20,),
                ),
                Text("About Us"),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(width: 1,color: Colors.black54,height: 20,),
                ),
                Text("About Us"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
