import 'dart:html' as html;
import 'dart:html';
import 'dart:math';

import 'package:bennettprojectgallery/services/user_services.dart';

import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_button/menu_button.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:textfield_search/textfield_search.dart';

import 'package:bennettprojectgallery/form_error.dart';

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
  final List<dynamic> professorList;
  final List<dynamic> studentList;
  final Map studentDict;

  AddProjectDialog({
    this.id,
    this.yog,
    this.name,
    this.categoryList,
    @required this.professorList,
    @required this.studentList,
    this.studentDict,
  });

  @override
  _AddProjectDialogState createState() => _AddProjectDialogState(
        yog: yog,
        id: id,
        name: name,
        categoryList: categoryList,
        professorList: professorList,
        studentList: studentList,
        studentDict: studentDict,
      );
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
  List<String> errors = [];

  void addError({String error}) {
    setState(() {
      errors.add(error);
    });
  }

  void removeError({String error}) {
    setState(() {
      errors.remove(error);
    });
  }

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
  final List<dynamic> professorList;
  final List<dynamic> studentList;
  final Map studentDict;

  _AddProjectDialogState({
    this.id,
    this.yog,
    this.name,
    this.categoryList,
    this.professorList,
    this.studentList,
    this.studentDict,
  });

  String Title = "";
  String ShortDescription = "";
  String LongDescription = "";
  String ProjectLink = "";
  String DatasetLink = "";
  String ReportLink = "";
  String VideoLink = "";
  String SelectedProfessor = "";

  bool image1selected = false;
  bool image2selected = false;
  bool image3selected = false;

  String student2 = "";
  String student3 = "";
  String student4 = "";
  String student5 = "";

  List listImageLinks = [];

  List listStudents = [];

  String label = "Some Label";
  // List<String> dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  TextEditingController profnameController = TextEditingController();
  TextEditingController studnameController2 = TextEditingController();
  TextEditingController studnameController3 = TextEditingController();
  TextEditingController studnameController4 = TextEditingController();
  TextEditingController studnameController5 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    profnameController.dispose();
    studnameController2.dispose();
    studnameController3.dispose();
    studnameController4.dispose();
    studnameController5.dispose();
    super.dispose();
  }

  _profNameListener() {
    SelectedProfessor = profnameController.text;
  }

  _stud2NameListener() {
    student2 = studnameController2.text;
  }

  _stud3NameListener() {
    student3 = studnameController3.text;
  }

  _stud4NameListener() {
    student4 = studnameController4.text;
  }

  _stud5NameListener() {
    student5 = studnameController5.text;
  }

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
          uploadImageToFirebase(sampleImage1).then((value) {
            setState(() {
              imageLink1 = value;
              listImageLinks.add(value);
            });
          });
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
            uploadImageToFirebase(sampleImage2).then((value) {
              setState(() {
                imageLink2 = value;
                listImageLinks.add(value);
              });
            });
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
            uploadImageToFirebase(sampleImage3).then((value) {
              setState(() {
                imageLink3 = value;
                listImageLinks.add(value);
              });
            });
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
    profnameController.addListener(_profNameListener);
    studnameController2.addListener(_stud2NameListener);
    studnameController3.addListener(_stud3NameListener);
    studnameController4.addListener(_stud4NameListener);
    studnameController5.addListener(_stud5NameListener);
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
                                print("sssssssssssssssssssssssssssssss");
                                print(listImageLinks);
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
                                print("sssssssssssssssssssssssssssssss");
                                print(listImageLinks);
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
                                      image: NetworkImage(imageLink1)),
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
                                      image: NetworkImage(imageLink2)),
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
                                      image: NetworkImage(imageLink3)),
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
                      maxLength: 300,
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.black),
                      onChanged: (value) {
                        ShortDescription = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: "Metrisch-Medium",
                            height: 1.5,
                            fontSize: 15,
                            color: Colors.black),
                        hintText: '* Short Description',
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
                      maxLines: 8,
                      maxLength: 1500,
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.black),
                      onChanged: (value) {
                        LongDescription = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: "Metrisch-Medium",
                            height: 1.5,
                            fontSize: 15,
                            color: Colors.black),
                        hintText: '* Long Description',
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
                        initialList: professorList,
                        label: label,
                        // getSelectedValue: (valu e) {
                        //   // SelectedProfessor =
                        //   //     value.replaceAll(RegExp('\\(.*?\\)'), '');
                        //   print("Selected Professor : $SelectedProfessor");
                        // },
                        controller: profnameController),
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
                                    hintText: '* Member ${index + 1} Name',
                                  ),
                                  initialList: studentList,
                                  label: label,
                                  // getSelectedValue: (value) {
                                  //   if (index == 1) {
                                  //     student2 = value;
                                  //   } else if (index == 2) {
                                  //     student3 = value;
                                  //   } else if (index == 3) {
                                  //     student4 = value;
                                  //   } else if (index == 4) {
                                  //     student4 = value;
                                  //   } else {
                                  //     student5 = value;
                                  //   }
                                  // },
                                  controller: index == 1
                                      ? studnameController2
                                      : index == 2
                                          ? studnameController3
                                          : index == 3
                                              ? studnameController4
                                              : index == 4
                                                  ? studnameController5
                                                  : studnameController5,
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
                        hintText: '* Project Link',
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
                        hintText: '* Dataset Link',
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
                        hintText: '* Report Link',
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
                        hintText: '* Video Link',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  FormError(errors: errors),
                  SizedBox(
                    height: 7.5,
                  ),
                  GradientButton(
                    title: "Add Project",
                    buttonheight: 45,
                    onPressed: () async {
                      errors = [];
                      if (errors.isEmpty) {
                        List<String> ListCategories = [];

                        for (int i = 0; i < _selectedCategories.length; i++) {
                          ListCategories.add(_selectedCategories[i].name);
                        }

                        List studentDicList = [];

                        CollectionReference project =
                            FirebaseFirestore.instance.collection('project');
                        print("working 1");

                        var var1 = studnameController2.text == ""
                            ? studnameController2.text
                            : studnameController2.text
                                .split("(")[1]
                                .split(")")[0];

                        print("working 2");

                        List stud = [
                          id,
                          student2 == ""
                              ? student2
                              : student2.split("(")[1].split(")")[0],
                          student3 == ""
                              ? student3
                              : student3.split("(")[1].split(")")[0],
                          student4 == ""
                              ? student4
                              : student4.split("(")[1].split(")")[0],
                          student5 == ""
                              ? student5
                              : student5.split("(")[1].split(")")[0],
                        ];

                        List listFinalStudents = [];

                        for (int i = 0; i < stud.length; i++) {
                          if (stud[i] != "") {
                            listFinalStudents.add(stud[i]);
                          }
                        }

                        print(sampleImage1);

                        if (Title == "") {
                          addError(error: "Fill Title Field");
                        }
                        if (ShortDescription == "") {
                          addError(error: "Fill Short Description Field");
                        }
                        if (LongDescription == "") {
                          addError(error: "Fill Long Description Field");
                        }
                        if (SelectedProfessor == "") {
                          addError(error: "Fill Professor Name Field");
                        }
                        if (listFinalStudents.length !=
                            int.parse(selectedKey)) {
                          addError(error: "Fill Team Members Field");
                        }
                        if (_selectedCategories.isEmpty) {
                          addError(error: "Fill Categories Field");
                        }
                        if (ProjectLink == "") {
                          addError(error: "Fill Project Link Field");
                        }
                        if (DatasetLink == "") {
                          addError(error: "Fill Dataset Link Field");
                        }
                        if (ReportLink == "") {
                          addError(error: "Fill Report Link Field");
                        }
                        if (VideoLink == "") {
                          addError(error: "Fill Video Link Field");
                        }
                        if(ProjectLink.indexOf("https://")!=0 || DatasetLink.indexOf("https://")!=0 || ReportLink.indexOf("https://")!=0 || VideoLink.indexOf("https://")!=0){
                          addError(error: "Provide HTPP link");
                        }

                        if(sampleImage1.size/1048576>2 || sampleImage2.size/1048576>2 || sampleImage3.size/1048576>2 ){
                          addError(error: "Image Size Should Be Less Than 2 MB");
                        }

                        if (errors.isEmpty) {
                          UserServices _services_user = UserServices();

                          for (int i = 0; i < listFinalStudents.length; i++) {
                            try {
                              var tempStudent =
                                  studentDict[listFinalStudents[i]];
                              var strucDic = {
                                "id": listFinalStudents[i],
                                "name": tempStudent["name"],
                                "batch": tempStudent["batch"],
                                "yog": tempStudent["yog"]
                              };
                              studentDicList.add(strucDic);
                            } catch (e) {
                              errorString = "Student Not Found";
                            }
                          }

                          var profID = SelectedProfessor.split("(")[1]
                              .split(")")[0]
                              .toUpperCase();
                          var profName =
                              SelectedProfessor.split(RegExp('\\(.*?\\)'))[0];

                          var dtnow = DateTime.now();

                          var Structure = {
                            "LikeCount": 0,
                            "ProjectDetails": {
                              "Categories": ListCategories,
                              "ProjectLink": ProjectLink,
                              "DatasetLink": DatasetLink,
                              "ShortDescription": ShortDescription,
                              "LongDescription": LongDescription,
                              "ReportLink": ReportLink,
                              "VideoLink": VideoLink,
                            },
                            "ProfessorDetails": {
                              "id": profID,
                              "name": profName,
                            },
                            "images": listImageLinks,
                            "Reviews": [],
                            "StudentIdList": studentDicList,
                            "title": Title,
                            "viewCount": 0,
                            "datetime": dtnow
                          };

                          String generateRandomString(int len) {
                            var r = Random();
                            const _chars =
                                'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                            return List.generate(len,
                                    (index) => _chars[r.nextInt(_chars.length)])
                                .join();
                          }

                          UserServices userServices = UserServices();

                          while (true) {
                            print("working 3");
                            if (listImageLinks.length != 0) {
                              String uploadID =
                                  dtnow.millisecondsSinceEpoch.toString() +
                                      "_$id" +
                                      "_${generateRandomString(5)}";
                              project.doc(uploadID).set(Structure);

                              UserServices _service = UserServices();

                              var prof =
                                  await _service.getProfessorById(profID);
                              Map profProjects = prof["projects"];
                              try {
                                profProjects[studentDicList[0]["yog"]]
                                    .add(uploadID);
                              } catch (e) {
                                profProjects[studentDicList[0]["yog"]] = [];
                                profProjects[studentDicList[0]["yog"]]
                                    .add(uploadID);
                              }
                              userServices.updateProfData(profID, {
                                "projects": profProjects,
                              });

                              for (int i = 0; i < studentDicList.length; i++) {
                                var studentId = studentDicList[i]["id"];
                                var user =
                                    await _service.getUserById(studentId);
                                List<dynamic> oldProjects = user["projects"];

                                oldProjects.add(uploadID);
                                userServices.updateUserData(studentId, {
                                  "projects": oldProjects,
                                });
                              }
                              break;
                            }
                          }
                          Navigator.pop(context);
                        }
                      }
                    },
                  )
                ],
              ),
            )));
  }
}
