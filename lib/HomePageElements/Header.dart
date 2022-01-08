import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Header extends StatefulWidget {
  final String current;
  const Header({
    this.current,
  });

  @override
  _HeaderState createState() => _HeaderState();
}
String hover="";

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.white.withOpacity(0.7),
      borderOnForeground: true,
      elevation: 3,
      margin: EdgeInsets.zero,
      child: ResponsiveBuilder(
        breakpoints: ScreenBreakpoints(
            tablet: 550,
            desktop: 790,
            watch: 300
        ),
        builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType ==
              DeviceScreenType.desktop) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              width: MediaQuery.of(context).size.width,
              color: Colors.white.withOpacity(0.7),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Home";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Home"?Colors.black:hover=="Home"?Colors.black26:Colors.transparent,),),
                          ),
                          child: Text("Home",style: TextStyle(color: Colors.black,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.black54,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="About";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="About"?Colors.black:hover=="About"?Colors.black26:Colors.transparent,),),
                          ),
                          child: Text("About",style: TextStyle(color: Colors.black,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.black54,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Project Gallery";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Project Gallery"?Colors.black:hover=="Project Gallery"?Colors.black26:Colors.transparent,),),
                          ),
                          child: Text("Project Gallery",style: TextStyle(color: Colors.black,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.black54,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Achievers";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Achievers"?Colors.black:hover=="Achievers"?Colors.black26:Colors.transparent,),),
                          ),
                          child: Text("Achievers",style: TextStyle(color: Colors.black,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.black54,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Times of Bennett";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Times of Bennett"?Colors.black:hover=="Times of Bennett"?Colors.black26:Colors.transparent,),),
                          ),
                          child: Text("Times of Bennett",style: TextStyle(color: Colors.black,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.black54,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Video Gallery";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Video Gallery"?Colors.black:hover=="Video Gallery"?Colors.black26:Colors.transparent,),),
                          ),
                          child: Text("Video Gallery",style: TextStyle(color: Colors.black,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.black54,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Contact";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Contact"?Colors.black:hover=="Contact"?Colors.black26:Colors.transparent,),),
                          ),
                          child: Text("Contact",style: TextStyle(color: Colors.black,fontFamily: "Metrisch-Bold"),)
                      )
                  ),

                ],
              ),
            );
          }

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            width: MediaQuery.of(context).size.width,
            color: Colors.white.withOpacity(0.7),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.menu)
              ],
            ),
          );
        },
      ),
    );
  }
}
