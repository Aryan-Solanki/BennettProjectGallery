import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String current;
  const Header({
    this.current,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 3,
      margin: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){

              },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  // padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Home"?Colors.black:Colors.white,),),
                ),
                    child: Text("Home",style: TextStyle(color: Colors.black,),)
                )
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(width: 1,color: Colors.black54,height: 18,),
            ),
            TextButton(
                onPressed: (){

                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  // padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="About"?Colors.black:Colors.white,),),
                    ),
                    child: Text("About",style: TextStyle(color: Colors.black,),)
                )
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(width: 1,color: Colors.black54,height: 18,),
            ),
            TextButton(
                onPressed: (){

                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  // padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Project Gallery"?Colors.black:Colors.white,),),
                    ),
                    child: Text("Project Gallery",style: TextStyle(color: Colors.black,),)
                )
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(width: 1,color: Colors.black54,height: 18,),
            ),
            TextButton(
                onPressed: (){

                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  // padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Achievers"?Colors.black:Colors.white,),),
                    ),
                    child: Text("Achievers",style: TextStyle(color: Colors.black,),)
                )
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(width: 1,color: Colors.black54,height: 18,),
            ),
            TextButton(
                onPressed: (){

                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  // padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Times of Bennett"?Colors.black:Colors.white,),),
                    ),
                    child: Text("Times of Bennett",style: TextStyle(color: Colors.black,),)
                )
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(width: 1,color: Colors.black54,height: 18,),
            ),
            TextButton(
                onPressed: (){

                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  // padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Video Gallery"?Colors.black:Colors.white,),),
                    ),
                    child: Text("Video Gallery",style: TextStyle(color: Colors.black,),)
                )
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(width: 1,color: Colors.black54,height: 18,),
            ),
            TextButton(
                onPressed: (){

                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  // padding: EdgeInsets.all(0.0),
                ),
                child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Contact"?Colors.black:Colors.white,),),
                    ),
                    child: Text("Contact",style: TextStyle(color: Colors.black,),)
                )
            ),

          ],
        ),
      ),
    );
  }
}
