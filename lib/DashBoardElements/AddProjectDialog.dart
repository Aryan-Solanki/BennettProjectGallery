import 'dart:html' as html;
import 'dart:html';
import 'dart:io' as io;

import 'package:flutter/painting.dart';
// import 'package:image_whisperer/image_whisperer.dart';

import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddProjectDialog extends StatefulWidget {
  final String id;
  final String name;
  final String batch;

  AddProjectDialog({this.id, this.batch, this.name});

  @override
  _AddProjectDialogState createState() =>
      _AddProjectDialogState(batch: batch, id: id, name: name);
}

File sampleImage1;
Image image1;
String imageLink1 = "";

File sampleImage2;
Image image2;
String imageLink2 = "";

File sampleImage3;
Image image3;
String imageLink3 = "";

class _AddProjectDialogState extends State<AddProjectDialog> {
  final String id;
  final String name;
  final String batch;

  _AddProjectDialogState({this.id, this.batch, this.name});

  String Title = "";
  String Description = "";
  String ProjectLink = "";
  String DatasetLink = "";
  String ReportLink = "";
  String VideoLink = "";

  bool image1selected = false;
  bool image2selected = false;
  bool image3selected = false;

  List listImageLinks = [];

  void uploadImage({@required Function(html.File file) onSelected}) {
    InputElement uploadInput = FileUploadInputElement()
      ..accept = 'image/*'; //it will upload only image
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
    //selected image
  }

  Future<String> uploadImageToFirebase(var image) async {
    final dateTime = DateTime.now();
    final path = 'projectImages/$dateTime';
    try {
      await fb
          .storage()
          .refFromURL('gs://bennettprojectarchive.appspot.com')
          .child(path)
          .put(image);

      bool found_image = false;
      var downloadUrl;

      while (!found_image) {
        try {
          downloadUrl = await fb
              .storage()
              .refFromURL('gs://bennettprojectarchive.appspot.com')
              .child(path)
              .getDownloadURL();
          found_image = true;
        } catch (e) {
          null;
        }
      }
      String url = downloadUrl.toString();
      return url;
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future getImage1() async {
    image1selected = true;
    uploadImage(onSelected: (file) {
      if (file != null) {
        setState(() {
          sampleImage1 = file;
          uploadImageToFirebase(sampleImage1)
              .then((value) => {listImageLinks.add(value)});
        });
      }
    });
  }

  Future getImage2() async {
    image2selected = true;
    uploadImage(onSelected: (file) {
      if (file != null) {
        setState(() {
          sampleImage2 = file;
          if (image2selected) {
            uploadImageToFirebase(sampleImage2)
                .then((value) => {listImageLinks.add(value)});
          }
        });
      }
    });
  }

  Future getImage3() async {
    image3selected = true;
    uploadImage(onSelected: (file) {
      if (file != null) {
        setState(() {
          sampleImage3 = file;
          if (image3selected) {
            uploadImageToFirebase(sampleImage2)
                .then((value) => {listImageLinks.add(value)});
          }
        });
      }
    });
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
                        color: Colors.black,
                        height: 1.3,
                        fontFamily: "Metrisch-Bold",
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      image1 == null
                          ? TextButton(
                              onPressed: () {
                                getImage1();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
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
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                getImage1();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                primary: Colors.white,
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xfff3f5fe),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1"),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 15,
                      ),
                      image2 == null
                          ? TextButton(
                              onPressed: () {
                                getImage2();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
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
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                getImage2();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                primary: Colors.white,
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xfff3f5fe),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1"),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 15,
                      ),
                      image3 == null
                          ? TextButton(
                              onPressed: () {
                                getImage3();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
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
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                getImage3();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                primary: Colors.white,
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xfff3f5fe),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1"),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xfff3f5fe)),
                    height: 45,
                    child: TextField(
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.black),
                      onChanged: (value) {
                        Title = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: "Metrisch-Medium",
                            height: 1.5,
                            fontSize: 15,
                            color: Colors.black),
                        hintText: '* Title',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xfff3f5fe)),
                    child: TextField(
                      maxLines: 3,
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.black),
                      onChanged: (value) {
                        Description = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: "Metrisch-Medium",
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
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xfff3f5fe)),
                    height: 45,
                    child: TextField(
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.black),
                      onChanged: (value) {
                        ProjectLink = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: "Metrisch-Medium",
                            height: 1.5,
                            fontSize: 15,
                            color: Colors.black),
                        hintText: 'Project Link',
                        // contentPadding:
                        // EdgeInsets.symmetric(horizontal: 20.0),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xfff3f5fe)),
                    height: 45,
                    child: TextField(
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.black),
                      onChanged: (value) {
                        DatasetLink = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: "Metrisch-Medium",
                            height: 1.5,
                            fontSize: 15,
                            color: Colors.black),
                        hintText: 'Dataset Link',
                        // contentPadding:
                        // EdgeInsets.symmetric(horizontal: 20.0),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xfff3f5fe)),
                    height: 45,
                    child: TextField(
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.black),
                      onChanged: (value) {
                        ReportLink = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: "Metrisch-Medium",
                            height: 1.5,
                            fontSize: 15,
                            color: Colors.black),
                        hintText: 'Report Link',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xfff3f5fe)),
                    height: 45,
                    child: TextField(
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.black),
                      onChanged: (value) {
                        VideoLink = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: "Metrisch-Medium",
                            height: 1.5,
                            fontSize: 15,
                            color: Colors.black),
                        hintText: 'Video Link',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GradientButton(
                    title: "Add Project",
                    buttonheight: 45,
                    onPressed: () {
                      CollectionReference project =
                          FirebaseFirestore.instance.collection('project');

                      var Structure = {
                        "LikeCount": 0,
                        "ProjectDetails": {
                          "ProjectLink": ProjectLink,
                          "DatasetLink": DatasetLink,
                          "Description": Description,
                          "ReportLink": ReportLink,
                          "VideoLink": VideoLink,
                        },
                        "images": listImageLinks,
                        "Reviews": [],
                        "StudentIdList": [
                          {id: name}
                        ],
                        "title": Title,
                        "status": "Pending",
                        "viewCount": 0,
                      };

                      while (true) {
                        if (listImageLinks.length != 0) {
                          project.add(Structure);
                          break;
                        }
                      }
                    },
                  )
                ],
              ),
            )));
  }
}
