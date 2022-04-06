import 'dart:io';

import 'package:bennettprojectgallery/DashBoardElements/AddProjectDialog.dart';
import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/services/project_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RightBoard extends StatefulWidget {
  final String batch;
  final String course;
  final String email;
  final String id;
  final String image;
  final String name;
  final String school;
  final String yog;

  RightBoard({
    this.batch,
    this.course,
    this.email,
    this.id,
    this.image,
    this.name,
    this.school,
    this.yog,
  });

  @override
  _RightBoardState createState() => _RightBoardState(
      batch: batch,
      course: course,
      email: email,
      id: id,
      imageL: image,
      name: name,
      school: school,
      yog: yog);
}

class _RightBoardState extends State<RightBoard> {
  File sampleImage;
  Image image;
  String authkey;
  String imageLink;

  final String batch;
  final String course;
  final String email;
  final String id;
  final String imageL;
  final String name;
  final String school;
  final String yog;

  _RightBoardState(
      {this.batch,
      this.course,
      this.email,
      this.id,
      this.imageL,
      this.name,
      this.school,
      this.yog});
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

  List<dynamic> categoryList = [];

  Future<void> getAllCategories() async {
    ProjectServices _services = ProjectServices();
    DocumentSnapshot cat = await _services.mainscreen.get();
    categoryList = await cat["categoryList"];
  }

  var studentDict = {};
  List<String> studentList1 = [];
  List<String> professorList1 = [];

  Future<void> getAllProfessors() async {
    ProjectServices _services = ProjectServices();
    // setState(() async {
    QuerySnapshot querySnapshot = await _services.professorCol.get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      String name = a.get("name");
      String email = a.id;
      professorList1.add(name + " (${email.toLowerCase()}) ");
    }
    // });
  }

  Future<void> getAllStudents() async {
    ProjectServices _services = ProjectServices();
    // setState(() async {
    QuerySnapshot querySnapshot = await _services.studentCol.get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      String name = a.get("name");
      String batch = a.get("batch");
      String course = a.get("course");
      String school = a.get("school");
      String yog = a.get("yog").toString();
      studentList1.add(name + " " + "(${a.id})");
      studentDict[a.id] = {
        "name": name,
        "batch": batch,
        "course": course,
        "school": school,
        "yog": yog
      };
    }
    // });
  }

  @override
  void initState() {
    getAllCategories();
    getAllProfessors();
    getAllStudents();
    super.initState();
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
      padding: EdgeInsets.only(right: 20),
      height: MediaQuery.of(context).size.width > 645 ? 200 : 500,
      child: MediaQuery.of(context).size.width > 645
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1")),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      height: 200,
                      width: 200,
                      child: Stack(
                        fit: StackFit.expand,
                        overflow: Overflow.visible,
                        children: [
                          Positioned(
                            left: 11,
                            top: 7,
                            child: InkWell(
                              onTap: () {
                                getImage();
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    color: Color(0xff101770),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                          color: Colors.white.withOpacity(0.55),
                        ),
                        width: 200,
                        height: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(name,
                                style: TextStyle(
                                    fontFamily: "Metrisch-Bold",
                                    fontSize: 18,
                                    color: Colors.black)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              id,
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
                    )
                  ],
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
                                          yog,
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
                                          "Section",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Bold",
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          batch,
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
                                width: 45,
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                width: 180,
                                height: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade700),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "23",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Bold",
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Likes",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "123",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Bold",
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Reviews",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Image(
                                          image: AssetImage("graph.png"),
                                          height: 30,
                                          width: 30,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GradientButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AddProjectDialog(
                                        yog: yog,
                                        id: id,
                                        name: name,
                                        categoryList: categoryList,
                                        professorList: professorList1,
                                        studentList: studentList1,
                                        studentDict: studentDict);
                                    ;
                                  });
                            },
                            buttonheight: 45,
                            buttonwidth: 330,
                            title: "Upload Project",
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          : Column(
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
                              foregroundImage: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1")),
                          Positioned(
                            right: 11,
                            bottom: 7,
                            child: InkWell(
                              onTap: () {
                                getImage();
                              },
                              child: Container(
                                height: 33,
                                width: 33,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    color: Color(0xff101770),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(name,
                        style: TextStyle(
                            fontFamily: "Metrisch-Bold",
                            fontSize: 18,
                            color: Colors.black)),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      id,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          fontSize: 13,
                          color: Colors.black54),
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
                                      "Batch",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      yog,
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
                                      "Section",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      batch,
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
                          Container(
                            padding: EdgeInsets.all(15),
                            width: 250,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue.shade700),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "23",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Likes",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "123",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Reviews",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: AssetImage("graph.png"),
                                      height: 30,
                                      width: 30,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GradientButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AddProjectDialog(
                                        yog: yog,
                                        id: id,
                                        name: name,
                                        categoryList: categoryList,
                                        professorList: professorList1,
                                        studentList: studentList1,
                                        studentDict: studentDict);
                                  });
                            },
                            buttonheight: 45,
                            buttonwidth: 250,
                            title: "Upload Project",
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
