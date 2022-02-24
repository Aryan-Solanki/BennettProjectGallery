import 'dart:io';

import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProjectDialog extends StatefulWidget {

  @override
  _AddProjectDialogState createState() => _AddProjectDialogState();
}


File sampleImage1;
Image image1;

File sampleImage2;
Image image2;

File sampleImage3;
Image image3;


class _AddProjectDialogState extends State<AddProjectDialog> {
  Future getImage1() async {
    var tempImage1 = await ImagePicker().getImage(source: ImageSource.gallery);
    File imageFile1 = File(tempImage1.path);
    setState(() {
      sampleImage1 = imageFile1;
      image1 = Image.file(sampleImage1);
    });
    // uploadStatusImage();
  }
  Future getImage2() async {
    var tempImage2 = await ImagePicker().getImage(source: ImageSource.gallery);
    File imageFile2 = File(tempImage2.path);
    setState(() {
      sampleImage2 = imageFile2;
      image2 = Image.file(sampleImage2);
    });
    // uploadStatusImage();
  }
  Future getImage3() async {
    var tempImage3 = await ImagePicker().getImage(source: ImageSource.gallery);
    File imageFile3 = File(tempImage3.path);
    setState(() {
      sampleImage3 = imageFile3;
      image3 = Image.file(sampleImage3);
    });
    // uploadStatusImage();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 500,
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select images to share",
                style: TextStyle(
                    color:Colors.black,
                    height: 1.3,
                    fontFamily: "Metrisch-Bold",
                    fontSize: 17),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  image1==null?TextButton(
                    onPressed: (){
                      getImage1();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                      Colors.transparent,
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfff3f5fe),
                      ),
                      child: Icon(Icons.add,color: Colors.black,),
                    ),
                  ):TextButton(
                    onPressed: (){
                      getImage1();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                      Colors.transparent,
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfff3f5fe),
                        image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  image2==null?TextButton(
                    onPressed: (){
                      getImage2();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                      Colors.transparent,
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfff3f5fe),
                      ),
                      child: Icon(Icons.add,color: Colors.black,),
                    ),
                  ):TextButton(
                    onPressed: (){
                      getImage1();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                      Colors.transparent,
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfff3f5fe),
                        image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  image3==null?TextButton(
                    onPressed: (){
                      getImage3();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                      Colors.transparent,
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfff3f5fe),
                      ),
                      child: Icon(Icons.add,color: Colors.black,),
                    ),
                  ):TextButton(
                    onPressed: (){
                      getImage1();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                      Colors.transparent,
                      primary: Colors.white,
                      padding: EdgeInsets.all(0.0),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfff3f5fe),
                        image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Color(0xfff3f5fe)
                ),
                height: 45,
                child: TextField(
                  style: TextStyle(

                      fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(

                        fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black),
                    hintText: '* Title',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0)),
                    color: Color(0xfff3f5fe)),
                child: TextField(
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: "Metrisch-Medium",
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.black),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily:
                        "Metrisch-Medium",
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black),
                    hintText: '* Description',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Color(0xfff3f5fe)
                ),
                height: 45,
                child: TextField(
                  style: TextStyle(

                      fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(

                        fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black),
                    hintText: 'Project Link',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Color(0xfff3f5fe)
                ),
                height: 45,
                child: TextField(
                  style: TextStyle(

                      fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(

                        fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black),
                    hintText: 'Dataset Link',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Color(0xfff3f5fe)
                ),
                height: 45,
                child: TextField(
                  style: TextStyle(

                      fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(

                        fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black),
                    hintText: 'Report Link',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              GradientButton(
                title: "Add Project",
                buttonheight: 45,
              )
            ],
          ),
        )
      )
    );
  }
}
