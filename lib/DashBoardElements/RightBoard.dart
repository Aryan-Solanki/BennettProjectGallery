import 'dart:io';

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
    return Column(
      children: [
        Text("Profile",
            style: TextStyle(
                fontFamily: "Metrisch-Bold", fontSize: 25)),
        SizedBox(height: 15,),
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
              Positioned(
                right: 11,
                bottom: 7,
                child: InkWell(
                  onTap: (){
                    getImage();
                  },
                  child: Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 3),
                        color: Color(0xff101770),
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.camera_alt_rounded,size: 14,color: Colors.white,),
                  ),
                ),
              )

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
        SizedBox(height: 20,),
        Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.orange.shade400,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  
                ],
              )
            ],
          ),
        )

      ],
    );
  }
}
