import 'dart:io';

import 'package:bennettprojectgallery/DashBoardElements/AddProjectDialog.dart';
import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RightBoard extends StatefulWidget {
  @override
  _RightBoardState createState() => _RightBoardState();
}

class _RightBoardState extends State<RightBoard> {
  File sampleImage;
  Image image;
  String authkey;
  String imageLink;

  // Future<void> uploadStatusImage() async {
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   final Reference postImageRef = storage.ref().child("Post Images");
  //   var timeKey = new DateTime.now();
  //   String xyz = timeKey.toString() + ".jpg";
  //   final UploadTask uploadTask =
  //   postImageRef.child(xyz).putFile(sampleImage);
  //   var imageUrl = await (await uploadTask).ref.getDownloadURL();
  //   final String url_akshat = imageUrl.toString();
  //   savetoDatabase(url_akshat);
  // }

  Future getImage() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);
    File imageFile = File(tempImage.path);
    sampleImage = imageFile;
    image = Image.file(sampleImage);
    // uploadStatusImage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 1050
          ? 1050
          : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        color: Color(0xffdadce4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.width>645?200:500,


      child: MediaQuery.of(context).size.width>645?Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: [
                    Text("Profile",
                        style: TextStyle(
                            fontFamily: "Metrisch-Bold", fontSize: 25)),
                    SizedBox(
                      height: 15,
                    ),
                    Positioned(
                      right: 11,
                      bottom: 7,
                      child: InkWell(
                        onTap: (){
                          getImage();
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 3),
                              color: Color(0xff101770),
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.camera_alt_rounded,size: 14,color: Colors.white,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Aryan Solanki",
                        style: TextStyle(
                            fontFamily: "Metrisch-Bold",
                            fontSize: 18,
                            color: Colors.black)),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "E20CSE157",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          fontSize: 13,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text("Aryan Solanki",style: TextStyle(
                  fontFamily: "Metrisch-Bold",fontSize: 18,color: Colors.black)),
              SizedBox(height: 6,),
              Text(
                "E20CSE157",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:Colors.black54),
              ),


            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Course",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 15,color:Colors.black),
                                  ),
                                  Text(
                                    "CSE",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 15,color:Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Batch",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 15,color:Colors.black),
                                  ),
                                  Text(
                                    "EB10",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 15,color:Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 45,),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 180,
                          height: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue.shade700
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "23",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 16,color:Colors.white),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                            "Likes",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 7,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "123",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 16,color:Colors.white),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                            "Reviews",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Image(image: AssetImage("graph.png"),height: 30,width: 30,)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    GradientButton(
                      buttonheight: 45,
                      buttonwidth: 330,
                      title: "Upload Project",
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AddProjectDialog();
                            }
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 160,
                width: 160,
                child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: [
                    CircleAvatar(
                        foregroundImage: NetworkImage("https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1")
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Course",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "CSE",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Batch",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "EB10",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 7,),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 250,
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue.shade700
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "23",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 16,color:Colors.white),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Likes",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 7,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "123",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 16,color:Colors.white),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Reviews",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Image(image: AssetImage("graph.png"),height: 30,width: 30,)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }
}
