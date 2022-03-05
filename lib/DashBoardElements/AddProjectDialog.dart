import 'dart:html' as html;
import 'dart:html';
import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter/painting.dart';
// import 'package:image_whisperer/image_whisperer.dart';

import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:menu_button/menu_button.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

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

String selectedKey="1";

class _AddProjectDialogState extends State<AddProjectDialog> {
  List<String> keys = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  List<int> value = [2];
  List<dynamic> _selectedAnimals=[];

  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Lion"),
    Animal(id: 5, name: "Flamingo"),
    Animal(id: 6, name: "Hippo"),
    Animal(id: 7, name: "Lion"),
    Animal(id: 8, name: "Flamingo"),
    Animal(id: 9, name: "Hippo"),
    Animal(id: 10, name: "Lion"),
    Animal(id: 11, name: "Flamingo"),
    Animal(id: 12, name: "Hippo"),
  ];


  String Title = "";
  String Description = "";
  String ProjectLink = "";
  String DatasetLink = "";
  String ReportLink = "";
  String VideoLink = "";

  bool image1selected = false;
  bool image2selected = false;
  bool image3selected = false;

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

  Future<void> uploadImageToFirebase(var image) async {
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
        });
      }
    });
  }

  Future getImage2() async {
    image2selected = false;
    uploadImage(onSelected: (file) {
      if (file != null) {
        setState(() {
          sampleImage2 = file;
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
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final Widget normalChildButton = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: Color(0xfff3f5fe),
      ),

      width: 60,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(selectedKey, overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black54),),
            ),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("* Team Members",style: TextStyle(
                              fontFamily: "Metrisch-Medium",
                              height: 1.5,
                              fontSize: 15,
                              color: Colors.black),),
                        ),
                        MenuButton<String>(
                          scrollPhysics: PageScrollPhysics(),
                          child: normalChildButton,
                          items: keys,
                          itemBuilder: (String value) => Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
                            child: Text(value,style: TextStyle(fontFamily: "Metrisch-Medium",height: 1.5, fontSize: 15,color: Colors.black54),),
                          ),
                          toggledChild: Container(
                            child: normalChildButton,
                          ),
                          onItemSelected: (String value) {
                            setState(() {
                              selectedKey = value;
                            });
                          },
                          onMenuButtonToggle: (bool isToggle) {
                            print(isToggle);
                          },
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: int.parse(selectedKey).toDouble()*60,
                    child: ListView.builder(
                      itemCount: int.parse(selectedKey),
                      itemBuilder: (context, index) {
                        return index==0?Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Color(0xfff3f5fe)),
                          height: 45,
                          child: Text(
                            "E20CSE157",
                            style: TextStyle(
                                fontFamily: "Metrisch-Medium",
                                height: 1.5,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ):Container(
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Color(0xfff3f5fe)),
                          height: 45,
                          child: TextField(
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                            ],
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
                              hintText: '* Member ${index+1} Enrollment Number',
                              // contentPadding:
                              // EdgeInsets.symmetric(horizontal: 20.0),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              // ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xfff3f5fe)),
                    height: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "* Select Categories",
                          style: TextStyle(
                              fontFamily: "Metrisch-Medium",
                              height: 1.5,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        MultiSelectChipField<Animal>(
                          showHeader: false,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff3f5fe))
                          ),
                          items: _animals.map((e) => MultiSelectItem(e, e.name)).toList(),
                          icon: Icon(Icons.check,size: 10,),
                          onTap: (values) {
                            _selectedAnimals = values;
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
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
                  GradientButton(
                    title: "Add Project",
                    buttonheight: 45,
                    onPressed: () async {
                      print(_animals);
                      // CollectionReference project =
                      //     FirebaseFirestore.instance.collection('project');
                      //
                      // List listImageLinks = [];
                      //
                      // if (image1selected) {
                      //   await listImageLinks
                      //       .add(uploadImageToFirebase(sampleImage1));
                      // }
                      //
                      // if (image2selected) {
                      //   await listImageLinks
                      //       .add(uploadImageToFirebase(sampleImage2));
                      // }
                      //
                      // if (image3selected) {
                      //   await listImageLinks
                      //       .add(uploadImageToFirebase(sampleImage3));
                      // }
                      //
                      // var Structure = {
                      //   "LikeCount": 0,
                      //   "ProjectDetails": {
                      //     "ProjectLink": ProjectLink,
                      //     "DatasetLink": DatasetLink,
                      //     "Description": Description,
                      //     "ReportLink": ReportLink,
                      //     "VideoLink": VideoLink,
                      //   },
                      //   "images": listImageLinks,
                      //   "Reviews": [],
                      //   "StudentIdList": [],
                      //   "title": Title,
                      //   "viewCount": 0,
                      // };
                      //
                      // while (true) {
                      //   if (listImageLinks.length != 0) {
                      //     project.add(Structure);
                      //     break;
                      //   }
                      // }
                    },
                  )
                ],
              ),
            )));
  }
}
