import 'dart:collection';
import 'dart:html' as html;
import 'dart:html';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';

import 'package:bennettprojectgallery/services/project_services.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
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
import 'package:textfield_search/textfield_search.dart';

class CategoryClass {
  final int id;
  final String name;

  CategoryClass({
    this.id,
    this.name,
  });
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class AddProjectDialog extends StatefulWidget {
  final String id;
  final String name;
  final String yog;
  final List<dynamic> categoryList;

  AddProjectDialog({this.id, this.yog, this.name, this.categoryList});

  @override
  _AddProjectDialogState createState() => _AddProjectDialogState(
      yog: yog, id: id, name: name, categoryList: categoryList);
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

String selectedKey = "1";

class _AddProjectDialogState extends State<AddProjectDialog> {
  List<String> keys = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  List<int> value = [2];
  List<dynamic> _selectedCategories = [];
  String TempStudent = "";

  static List<CategoryClass> _catList = [];

  final String id;
  final String name;
  final String yog;
  final List<dynamic> categoryList;

  _AddProjectDialogState({this.id, this.yog, this.name, this.categoryList});

  String Title = "";
  String Description = "";
  String ProjectLink = "";
  String DatasetLink = "";
  String ReportLink = "";
  String VideoLink = "";

  bool image1selected = false;
  bool image2selected = false;
  bool image3selected = false;

  String student2;
  String student3;
  String student4;
  String student5;

  List listImageLinks = [];

  List listStudents = [];

  String label = "Some Label";
  List<String> dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  List<String> studentList = ['student 1', 'student 2', 'student 3', 'student 4', 'student 5'];

  TextEditingController profnameController = TextEditingController();
  TextEditingController studnameController1 = TextEditingController();
  TextEditingController studnameController2 = TextEditingController();
  TextEditingController studnameController3 = TextEditingController();
  TextEditingController studnameController4 = TextEditingController();
  TextEditingController studnameController5 = TextEditingController();

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

  GetAllCategories() {
    setState(() {
      for (int i = 0; i < categoryList.length; i++) {
        _catList.add(CategoryClass(id: i, name: categoryList[i]));
      }
    });
  }

  @override
  void initState() {
    GetAllCategories();
    listStudents.add(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String errorString = "";
    for (int i = 0; i < categoryList.length; i++) {
      _catList.add(CategoryClass(id: i, name: categoryList[i]));
    }

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
              child: Text(
                selectedKey,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: "Metrisch-Medium",
                    height: 1.5,
                    fontSize: 15,
                    color: Colors.black54),
              ),
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
                      imageLink1 == ""
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
                                    image: imageLink1 == ""
                                        ? NetworkImage(
                                            "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1")
                                        : NetworkImage(imageLink1),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 15,
                      ),
                      imageLink2 == ""
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
                                    image: imageLink2 == ""
                                        ? NetworkImage(
                                            "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1")
                                        : NetworkImage(imageLink2),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 15,
                      ),
                      imageLink3 == ""
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
                                    image: imageLink3 == ""
                                        ? NetworkImage(
                                            "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1")
                                        : NetworkImage(imageLink3),
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
                    child: TextFieldSearch(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontFamily: "Metrisch-Medium",
                              height: 1.5,
                              fontSize: 15,
                              color: Colors.black),
                          hintText: '* Professor Name',
                        ),
                        initialList: dummyList, label: label, controller: profnameController
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
                          child: Text(
                            "* Team Members",
                            style: TextStyle(
                                fontFamily: "Metrisch-Medium",
                                height: 1.5,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                        MenuButton<String>(
                          scrollPhysics: PageScrollPhysics(),
                          child: normalChildButton,
                          items: keys,
                          itemBuilder: (String value) => Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 16),
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontFamily: "Metrisch-Medium",
                                  height: 1.5,
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
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
                    height: int.parse(selectedKey).toDouble() * 60,
                    child: ListView.builder(
                      itemCount: int.parse(selectedKey),
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xfff3f5fe)),
                                height: 45,
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      fontFamily: "Metrisch-Medium",
                                      height: 1.5,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xfff3f5fe)),
                                height: 45,
                                child: TextFieldSearch(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontFamily: "Metrisch-Medium",
                                          height: 1.5,
                                          fontSize: 15,
                                          color: Colors.black),
                                      hintText: '* Member ${index+1} Name',
                                    ),
                                    initialList: studentList, label: label, controller: index==1?studnameController1:index==2?studnameController2:index==3?studnameController3:index==4?studnameController4:studnameController5,
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
                        MultiSelectChipField<CategoryClass>(
                          showHeader: false,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xfff3f5fe))),
                          items: _catList
                              .map((e) => MultiSelectItem(e, e.name))
                              .toList(),
                          icon: Icon(
                            Icons.check,
                            size: 10,
                          ),
                          onTap: (values) {
                            _selectedCategories = values;
                          },
                        )
                      ],
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
                    onPressed: () async {
                      List<String> ListCategories = [];

                      for (int i = 0; i < _selectedCategories.length; i++) {
                        ListCategories.add(_selectedCategories[i].name);
                      }

                      List studentDicList = [];

                      CollectionReference project =
                          FirebaseFirestore.instance.collection('project');

                      List stud = [id, student2, student3, student4, student5];
                      List listFinalStudents = [];

                      for (int i = 0; i < stud.length; i++) {
                        if (stud[i] != null) {
                          listFinalStudents.add(stud[i]);
                        }
                      }

                      UserServices _services_user = UserServices();

                      for (int i = 0; i < listFinalStudents.length; i++) {
                        try {
                          var tempStudent = await _services_user
                              .getUserById(listFinalStudents[i]);
                          var strucDic = {
                            "id": listFinalStudents[i],
                            "name": tempStudent["name"],
                          };
                          studentDicList.add(strucDic);
                        } catch (e) {
                          errorString = "Student Not Found";
                        }
                      }

                      // List listImageLinks = [];

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

                      var Structure = {
                        "LikeCount": 0,
                        "ProjectDetails": {
                          "Categories": ListCategories,
                          "ProjectLink": ProjectLink,
                          "DatasetLink": DatasetLink,
                          "Description": Description,
                          "ReportLink": ReportLink,
                          "VideoLink": VideoLink,
                        },
                        "images": listImageLinks,
                        "Reviews": [],
                        "StudentIdList": studentDicList,
                        "title": Title,
                        "viewCount": 0,
                      };

                      String generateRandomString(int len) {
                        var r = Random();
                        const _chars =
                            'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                        return List.generate(len,
                            (index) => _chars[r.nextInt(_chars.length)]).join();
                      }

                      UserServices userServices = UserServices();

                      while (true) {
                        if (listImageLinks.length != 0) {
                          String uploadID =
                              DateTime.now().millisecondsSinceEpoch.toString() +
                                  "_$id" +
                                  "_${generateRandomString(5)}";
                          project.doc(uploadID).set(Structure);

                          UserServices _service = UserServices();

                          var user = await _service.getUserById(id);
                          List<dynamic> oldProjects = user["projects"];
                          oldProjects.add(uploadID);
                          userServices.updateUserData(id, {
                            "projects": oldProjects,
                          });
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
