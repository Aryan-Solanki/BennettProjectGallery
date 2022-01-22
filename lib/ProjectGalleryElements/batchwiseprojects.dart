import 'package:bennettprojectgallery/ProjectGalleryElements/categoriesButton.dart';
import 'package:flutter/material.dart';

class BatchWiseProjects extends StatefulWidget {

  @override
  _BatchWiseProjectsState createState() => _BatchWiseProjectsState();
}
bool hover1=false;
bool hover2=false;
bool hover3=false;
bool hover4=false;
bool hover5=false;
bool hover6=false;
class _BatchWiseProjectsState extends State<BatchWiseProjects> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width>971?Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover1=true;
                  });
                }
                else{
                  setState(() {
                    hover1=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: hover1==true?Colors.orange.shade400:Color(0xfff3f5fe),
                  borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2016",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover1==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover2=true;
                  });
                }
                else{
                  setState(() {
                    hover2=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover2==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2017",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover2==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover3=true;
                  });
                }
                else{
                  setState(() {
                    hover3=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover3==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2018",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover3==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover4=true;
                  });
                }
                else{
                  setState(() {
                    hover4=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover4==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2019",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover4==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover5=true;
                  });
                }
                else{
                  setState(() {
                    hover5=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover5==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2020",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover5==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover6=true;
                  });
                }
                else{
                  setState(() {
                    hover6=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover6==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2021",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover6==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ):MediaQuery.of(context).size.width>715?Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.transparent,
            primary: Colors.transparent,
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: (){

          },
          onHover: (x){
            if(x){
              setState(() {
                hover1=true;
              });
            }
            else{
              setState(() {
                hover1=false;
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: hover1==true?Colors.orange.shade400:Color(0xfff3f5fe),
                borderRadius: BorderRadius.circular(5)
            ),
            height: 30,
            child: Center(
              child: Text(
                "Batch of 2016",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover1==true?Colors.white:Colors.grey.shade600),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.transparent,
            primary: Colors.transparent,
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: (){

          },
          onHover: (x){
            if(x){
              setState(() {
                hover2=true;
              });
            }
            else{
              setState(() {
                hover2=false;
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: hover2==true?Colors.orange.shade400:Color(0xfff3f5fe),
                borderRadius: BorderRadius.circular(5)
            ),
            height: 30,
            child: Center(
              child: Text(
                "Batch of 2017",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover2==true?Colors.white:Colors.grey.shade600),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.transparent,
            primary: Colors.transparent,
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: (){

          },
          onHover: (x){
            if(x){
              setState(() {
                hover3=true;
              });
            }
            else{
              setState(() {
                hover3=false;
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: hover3==true?Colors.orange.shade400:Color(0xfff3f5fe),
                borderRadius: BorderRadius.circular(5)
            ),
            height: 30,
            child: Center(
              child: Text(
                "Batch of 2018",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover3==true?Colors.white:Colors.grey.shade600),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.transparent,
            primary: Colors.transparent,
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: (){

          },
          onHover: (x){
            if(x){
              setState(() {
                hover4=true;
              });
            }
            else{
              setState(() {
                hover4=false;
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: hover4==true?Colors.orange.shade400:Color(0xfff3f5fe),
                borderRadius: BorderRadius.circular(5)
            ),
            height: 30,
            child: Center(
              child: Text(
                "Batch of 2019",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover4==true?Colors.white:Colors.grey.shade600),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.transparent,
            primary: Colors.transparent,
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: (){

          },
          onHover: (x){
            if(x){
              setState(() {
                hover5=true;
              });
            }
            else{
              setState(() {
                hover5=false;
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: hover5==true?Colors.orange.shade400:Color(0xfff3f5fe),
                borderRadius: BorderRadius.circular(5)
            ),
            height: 30,
            child: Center(
              child: Text(
                "Batch of 2020",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover5==true?Colors.white:Colors.grey.shade600),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.transparent,
            primary: Colors.transparent,
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: (){

          },
          onHover: (x){
            if(x){
              setState(() {
                hover6=true;
              });
            }
            else{
              setState(() {
                hover6=false;
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: hover6==true?Colors.orange.shade400:Color(0xfff3f5fe),
                borderRadius: BorderRadius.circular(5)
            ),
            height: 30,
            child: Center(
              child: Text(
                "Batch of 2021",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover6==true?Colors.white:Colors.grey.shade600),
              ),
            ),
          ),
        ),
      ],
    ):MediaQuery.of(context).size.width>430?Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover1=true;
                  });
                }
                else{
                  setState(() {
                    hover1=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover1==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2016",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover1==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover2=true;
                  });
                }
                else{
                  setState(() {
                    hover2=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover2==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2017",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover2==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover3=true;
                  });
                }
                else{
                  setState(() {
                    hover3=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover3==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2018",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover3==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover4=true;
                  });
                }
                else{
                  setState(() {
                    hover4=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover4==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2019",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover4==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover5=true;
                  });
                }
                else{
                  setState(() {
                    hover5=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover5==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2020",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover5==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover6=true;
                  });
                }
                else{
                  setState(() {
                    hover6=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover6==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2021",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover6==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),

          ],
        ),
      ],
    ):Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover1=true;
                  });
                }
                else{
                  setState(() {
                    hover1=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover1==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2016",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover1==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover2=true;
                  });
                }
                else{
                  setState(() {
                    hover2=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover2==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2017",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover2==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover3=true;
                  });
                }
                else{
                  setState(() {
                    hover3=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover3==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2018",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover3==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover4=true;
                  });
                }
                else{
                  setState(() {
                    hover4=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover4==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2019",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover4==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover5=true;
                  });
                }
                else{
                  setState(() {
                    hover5=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover5==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2020",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover5==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: (){

              },
              onHover: (x){
                if(x){
                  setState(() {
                    hover6=true;
                  });
                }
                else{
                  setState(() {
                    hover6=false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: hover6==true?Colors.orange.shade400:Color(0xfff3f5fe),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                child: Center(
                  child: Text(
                    "Batch of 2021",style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: hover6==true?Colors.white:Colors.grey.shade600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
