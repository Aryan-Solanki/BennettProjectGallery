import 'dart:convert';

import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/projectgallery.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Directory, File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;

class AdminDashBoard extends StatefulWidget {
  final String current_Year;
  AdminDashBoard({this.current_Year = "2020"});
  @override
  _AdminDashBoardState createState() => _AdminDashBoardState();
}

String selected = "zero";
double num_of_reviews = 5;

class _AdminDashBoardState extends State<AdminDashBoard> {
  Map projectMap = {};
  Map finalProjectMap = {};
  Map finalDataRowMap = {};
  List<DataRow> listRowFinal = [];
  List<Project> projectListFinal = [];
  Map<String, List<List<String>>> csvMap = {};
  FirebaseAuth auth = FirebaseAuth.instance;
  UserServices _services = UserServices();
  bool loading = true;
  bool hover1 = false;
  bool hover2 = false;
  bool hover3 = false;
  bool hover4 = false;
  bool hover5 = false;
  bool hover6 = false;

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  String convert_timestamp_to_string(timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    var formatter = new DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(date);
    return formatted;
  }

  generateCSV() async {
    String csvData = ListToCsvConverter().convert(csvMap[widget.current_Year]);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yy-HH-mm-ss').format(now);
    if (kIsWeb) {
      final bytes = utf8.encode(csvData);
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download =
            'export_CSV_batch${widget.current_Year}_${formattedDate}.csv';
      html.document.body.children.add(anchor);
      anchor.click();
      html.Url.revokeObjectUrl(url);
    } else {
      if (Platform.isAndroid) {
        Directory generalDownloadDir =
            Directory('/storage/emulated/0/Download');
        final File file = await File(
                '${generalDownloadDir.path}/export_CSV_batch${widget.current_Year}_${formattedDate}.csv')
            .create();
        await file.writeAsString(csvData);
      }
      if (Platform.isIOS) {
        Directory generalDownloadDir = Directory(
            '/private/var/mobile/Containers/Data/Application/B8C7C8D8-B9A6-4A2A-B8A7-A9C9C9C9C9C9/Documents');
        final File file = await File(
                '${generalDownloadDir.path}/export_CSV_batch${widget.current_Year}_${formattedDate}.csv')
            .create();
        await file.writeAsString(csvData);
      }
    }
  }

  getProfProjects() async {
    var ProfID = auth.currentUser.email.toUpperCase();
    var prof = await _services.getProfessorById(ProfID);

    projectMap = prof["projects"];

    loading = true;

    for (var yog in projectMap.keys) {
      bool isFirst = true;
      csvMap[yog] = [];

      bool anyProjectRemoved = false;
      List<dynamic> projectList = projectMap[yog];
      finalProjectMap[yog] = List<Project>();
      finalDataRowMap[yog] = List<DataRow>();

      for (var projectID in projectList) {
        var project = await FirebaseFirestore.instance
            .collection("project")
            .doc(projectID)
            .get();

        bool projectExists = project.exists;

        if (!projectExists) {
          anyProjectRemoved = true;
          projectMap[yog].remove(projectID);
          continue;
        }

        String StudentString = "";

        String StringCategories = "";

        for (var student in project["StudentIdList"]) {
          StudentString += student["name"] +
              " | " +
              student["id"] +
              " | " +
              student["batch"] +
              "\n";
        }

        for (var category in project["ProjectDetails"]["Categories"]) {
          StringCategories += category + "\n";
        }

        finalDataRowMap[yog].add(
          DataRow(
            cells: <DataCell>[
              DataCell(Text(project.id)),
              DataCell(Text(project["title"])),
              DataCell(Text(StudentString)),
              DataCell(FlatButton(
                child: Text(project["ProjectDetails"]["DatasetLink"]),
                onPressed: () {
                  _launchURL(project["ProjectDetails"]["DatasetLink"]);
                },
              )),
              DataCell(FlatButton(
                child: Text(project["ProjectDetails"]["ProjectLink"]),
                onPressed: () {
                  _launchURL(project["ProjectDetails"]["ProjectLink"]);
                },
              )),
              DataCell(FlatButton(
                child: Text(project["ProjectDetails"]["ReportLink"]),
                onPressed: () {
                  _launchURL(project["ProjectDetails"]["ReportLink"]);
                },
              )),
              DataCell(FlatButton(
                child: Text(project["ProjectDetails"]["VideoLink"]),
                onPressed: () {
                  _launchURL(project["ProjectDetails"]["VideoLink"]);
                },
              )),
              DataCell(Text(StringCategories)),
              DataCell(Text(convert_timestamp_to_string(project["datetime"]))),
            ],
          ),
        );

        if (isFirst) {
          csvMap[yog].add(
            [
              "Project ID",
              "Title",
              "Students",
              "Dataset Link",
              "Project Link",
              "Report Link",
              "Video Link",
              "Categories",
              "DateTime",
              "Description",
            ],
          );
          isFirst = false;
        }

        csvMap[yog].add(
          [
            project.id,
            project["title"],
            StudentString,
            project["ProjectDetails"]["DatasetLink"],
            project["ProjectDetails"]["ProjectLink"],
            project["ProjectDetails"]["ReportLink"],
            project["ProjectDetails"]["VideoLink"],
            StringCategories,
            convert_timestamp_to_string(project["datetime"]),
            project["ProjectDetails"]["Description"],
          ],
        );

        finalProjectMap[yog].add(
          new Project(
            yog: project["StudentIdList"][0]["yog"].toString(),
            like_count: project["LikeCount"],
            DatasetLink: project["ProjectDetails"]["DatasetLink"],
            Description: project["ProjectDetails"]["Description"],
            ProjectLink: project["ProjectDetails"]["ProjectLink"],
            ReportLink: project["ProjectDetails"]["ReportLink"],
            VideoLink: project["ProjectDetails"]["VideoLink"],
            Reviews: project["Reviews"],
            StudentList: project["StudentIdList"],
            images: project["images"],
            title: project["title"],
            timestamp: project["datetime"],
            viewCount: project["viewCount"],
            Categories: project["ProjectDetails"]["Categories"],
            ProfessorDetails: project["ProfessorDetails"],
          ),
        );
      }
      List<Project> yog_list = finalProjectMap[yog];
      yog_list
          .sort((a, b) => a.timestamp.seconds.compareTo(b.timestamp.seconds));
      if (anyProjectRemoved)
        _services.updateProfData(ProfID, {"projects": projectMap});
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getProfProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
            current: "Dashboard",
          ),
          Container(
            height: MediaQuery.of(context).size.height - 60,
            child: SingleChildScrollView(
                child: ResponsiveBuilder(
              breakpoints:
                  ScreenBreakpoints(tablet: 971, desktop: 971, watch: 300),
              builder: (context, sizingInformation) {
                // Check the sizing information here and return your UI
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop) {
                  return loading
                      ? Center(
                          child: Container(
                            height: 300,
                            width: 300,
                            child: Lottie.asset('assets/loading.json',
                                frameRate: FrameRate.max),
                          ),
                        )
                      : Row(
                          children: [
                            ResponsiveBuilder(
                              breakpoints: ScreenBreakpoints(
                                  tablet: 971, desktop: 971, watch: 300),
                              builder: (context, sizingInformation) {
                                // Check the sizing information here and retrurn your UI
                                if (sizingInformation.deviceScreenType ==
                                    DeviceScreenType.desktop) {
                                  return Container(
                                    width: 250,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Batch Wise Projects",
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.black87,
                                              fontFamily: "Metrisch-Bold"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        MediaQuery.of(context).size.width > 971
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover1 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover1 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover1 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2016",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover1 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover2 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover2 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover2 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2017",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover2 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover3 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover3 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover3 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2018",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover3 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover4 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover4 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover4 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2019",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover4 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover5 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover5 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover5 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2020",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover5 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover6 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover6 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover6 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2021",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover6 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    715
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              "hijedwcasfwes");
                                                        },
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover1 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover1 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover1 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2016",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover1 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover2 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover2 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover2 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2017",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover2 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover3 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover3 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover3 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2018",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover3 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover4 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover4 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover4 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2019",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover4 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover5 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover5 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover5 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2020",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover5 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover6 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover6 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover6 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2021",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover6 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        430
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      "hijedwcasfwes");
                                                                },
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover1 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover1 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover1 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2016",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover1 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover2 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover2 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover2 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2017",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover2 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover3 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover3 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover3 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2018",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover3 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover4 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover4 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover4 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2019",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover4 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover5 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover5 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover5 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2020",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover5 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover6 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover6 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover6 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2021",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover6 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      "hijedwcasfwes");
                                                                },
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover1 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover1 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover1 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2016",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover1 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover2 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover2 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover2 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2017",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover2 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover3 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover3 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover3 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2018",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover3 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover4 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover4 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover4 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2019",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover4 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover5 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover5 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover5 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2020",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover5 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  primary: Colors
                                                                      .transparent,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                onHover: (x) {
                                                                  if (x) {
                                                                    setState(
                                                                        () {
                                                                      hover6 =
                                                                          true;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      hover6 =
                                                                          false;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      color: hover6 ==
                                                                              true
                                                                          ? Colors
                                                                              .orange
                                                                              .shade400
                                                                          : Color(
                                                                              0xfff3f5fe),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Batch of 2021",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Metrisch-Medium",
                                                                          fontSize:
                                                                              13,
                                                                          color: hover6 == true
                                                                              ? Colors.white
                                                                              : Colors.grey.shade600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                return Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Batch Wise Projects",
                                        style: TextStyle(
                                            fontSize: 21,
                                            color: Colors.black87,
                                            fontFamily: "Metrisch-Bold"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      MediaQuery.of(context).size.width > 971
                                          ? Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover1 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover1 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover1 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2016",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover1 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover2 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover2 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover2 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2017",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover2 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover3 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover3 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover3 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2018",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover3 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover4 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover4 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover4 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2019",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover4 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover5 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover5 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover5 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2020",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover5 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover6 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover6 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover6 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2021",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover6 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : MediaQuery.of(context).size.width >
                                                  715
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {
                                                        print("hijedwcasfwes");
                                                      },
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover1 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover1 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover1 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2016",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover1 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover2 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover2 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover2 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2017",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover2 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover3 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover3 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover3 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2018",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover3 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover4 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover4 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover4 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2019",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover4 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover5 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover5 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover5 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2020",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover5 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover6 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover6 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover6 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2021",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover6 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      430
                                                  ? Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    "hijedwcasfwes");
                                                              },
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover1 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover1 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover1 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2016",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover1 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover2 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover2 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover2 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2017",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover2 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover3 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover3 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover3 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2018",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover3 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover4 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover4 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover4 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2019",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover4 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover5 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover5 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover5 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2020",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover5 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover6 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover6 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover6 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2021",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover6 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  : Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    "hijedwcasfwes");
                                                              },
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover1 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover1 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover1 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2016",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover1 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover2 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover2 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover2 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2017",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover2 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover3 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover3 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover3 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2018",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover3 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover4 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover4 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover4 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2019",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover4 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover5 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover5 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover5 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2020",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover5 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                primary: Colors
                                                                    .transparent,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                              ),
                                                              onPressed: () {},
                                                              onHover: (x) {
                                                                if (x) {
                                                                  setState(() {
                                                                    hover6 =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    hover6 =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: hover6 ==
                                                                            true
                                                                        ? Colors
                                                                            .orange
                                                                            .shade400
                                                                        : Color(
                                                                            0xfff3f5fe),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Batch of 2021",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            13,
                                                                        color: hover6 ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.grey.shade600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 20, right: 20, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Dashboard",
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          fontSize: 25)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        generateCSV();
                                      },
                                      child: Text("Download CSV",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontFamily: "Metrisch-Bold",
                                              fontSize: 12)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width-350,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                          showBottomBorder: true,
                                          dataRowHeight: 60,
                                          headingRowColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey[200]),
                                          columns: const <DataColumn>[
                                            DataColumn(
                                              label: Text(
                                                'ProjectId',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Project Title',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Students',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Dataset Link',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Project Link',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Report Link',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Video Link',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Categories',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Submission Time',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ],
                                          rows: finalDataRowMap[
                                              widget.current_Year]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                }

                return Column(
                  children: [
                    ResponsiveBuilder(
                      breakpoints: ScreenBreakpoints(
                          tablet: 971, desktop: 971, watch: 300),
                      builder: (context, sizingInformation) {
                        // Check the sizing information here and retrurn your UI
                        if (sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop) {
                          return Container(
                            width: 250,
                            child: Column(
                              children: [
                                Text(
                                  "Batch Wise Projects",
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.black87,
                                      fontFamily: "Metrisch-Bold"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                MediaQuery.of(context).size.width > 971
                                    ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover1 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover1 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover1 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2016",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover1 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover2 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover2 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover2 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2017",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover2 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover3 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover3 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover3 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2018",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover3 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover4 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover4 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover4 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2019",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover4 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover5 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover5 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover5 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2020",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover5 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover6 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover6 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover6 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2021",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover6 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : MediaQuery.of(context).size.width > 715
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {
                                                  print("hijedwcasfwes");
                                                },
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover1 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover1 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover1 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2016",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover1 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover2 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover2 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover2 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2017",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover2 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover3 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover3 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover3 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2018",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover3 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover4 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover4 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover4 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2019",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover4 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover5 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover5 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover5 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2020",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover5 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  primary: Colors.transparent,
                                                  padding: EdgeInsets.all(0.0),
                                                ),
                                                onPressed: () {},
                                                onHover: (x) {
                                                  if (x) {
                                                    setState(() {
                                                      hover6 = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hover6 = false;
                                                    });
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: hover6 == true
                                                          ? Colors
                                                              .orange.shade400
                                                          : Color(0xfff3f5fe),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(
                                                      "Batch of 2021",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          fontSize: 13,
                                                          color: hover6 == true
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : MediaQuery.of(context).size.width >
                                                430
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              "hijedwcasfwes");
                                                        },
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover1 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover1 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover1 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2016",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover1 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover2 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover2 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover2 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2017",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover2 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover3 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover3 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover3 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2018",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover3 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover4 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover4 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover4 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2019",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover4 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover5 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover5 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover5 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2020",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover5 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover6 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover6 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover6 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2021",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover6 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              "hijedwcasfwes");
                                                        },
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover1 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover1 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover1 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2016",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover1 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover2 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover2 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover2 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2017",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover2 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover3 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover3 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover3 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2018",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover3 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover4 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover4 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover4 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2019",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover4 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover5 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover5 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover5 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2020",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover5 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          primary: Colors
                                                              .transparent,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                        ),
                                                        onPressed: () {},
                                                        onHover: (x) {
                                                          if (x) {
                                                            setState(() {
                                                              hover6 = true;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              hover6 = false;
                                                            });
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: hover6 ==
                                                                      true
                                                                  ? Colors
                                                                      .orange
                                                                      .shade400
                                                                  : Color(
                                                                      0xfff3f5fe),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                              "Batch of 2021",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Metrisch-Medium",
                                                                  fontSize: 13,
                                                                  color: hover6 ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          );
                        }

                        return Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Batch Wise Projects",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.black87,
                                    fontFamily: "Metrisch-Bold"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MediaQuery.of(context).size.width > 971
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover1 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover1 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover1 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2016",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover1 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover2 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover2 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover2 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2017",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover2 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover3 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover3 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover3 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2018",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover3 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover4 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover4 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover4 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2019",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover4 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover5 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover5 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover5 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2020",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover5 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover6 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover6 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover6 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2021",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover6 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : MediaQuery.of(context).size.width > 715
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                print("hijedwcasfwes");
                                              },
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover1 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover1 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover1 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2016",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover1 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover2 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover2 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover2 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2017",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover2 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover3 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover3 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover3 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2018",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover3 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover4 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover4 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover4 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2019",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover4 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover5 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover5 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover5 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2020",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover5 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.transparent,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {},
                                              onHover: (x) {
                                                if (x) {
                                                  setState(() {
                                                    hover6 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    hover6 = false;
                                                  });
                                                }
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: hover6 == true
                                                        ? Colors.orange.shade400
                                                        : Color(0xfff3f5fe),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                height: 30,
                                                child: Center(
                                                  child: Text(
                                                    "Batch of 2021",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        fontSize: 13,
                                                        color: hover6 == true
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : MediaQuery.of(context).size.width > 430
                                          ? Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {
                                                        print("hijedwcasfwes");
                                                      },
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover1 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover1 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover1 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2016",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover1 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover2 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover2 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover2 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2017",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover2 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover3 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover3 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover3 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2018",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover3 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover4 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover4 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover4 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2019",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover4 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover5 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover5 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover5 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2020",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover5 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover6 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover6 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover6 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2021",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover6 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {
                                                        print("hijedwcasfwes");
                                                      },
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover1 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover1 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover1 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2016",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover1 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover2 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover2 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover2 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2017",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover2 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover3 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover3 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover3 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2018",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover3 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover4 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover4 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover4 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2019",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover4 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover5 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover5 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover5 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2020",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover5 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        primary:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      onPressed: () {},
                                                      onHover: (x) {
                                                        if (x) {
                                                          setState(() {
                                                            hover6 = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            hover6 = false;
                                                          });
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: hover6 ==
                                                                    true
                                                                ? Colors.orange
                                                                    .shade400
                                                                : Color(
                                                                    0xfff3f5fe),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            "Batch of 2021",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Metrisch-Medium",
                                                                fontSize: 13,
                                                                color: hover6 ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text("2020 Batch Projects",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Bold", fontSize: 25)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {},
                              child: Text("Download CSV",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: "Metrisch-Bold",
                                      fontSize: 12)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              showBottomBorder: true,
                              dataRowHeight: 60,
                              headingRowColor:
                                  MaterialStateProperty.all(Colors.grey[200]),
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'Name',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Age',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Role',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                              rows: const <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Sarah\n\nWilliam')),
                                    DataCell(Text('19')),
                                    DataCell(Text('Student')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Janine')),
                                    DataCell(Text('43')),
                                    DataCell(Text('Professor')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('William')),
                                    DataCell(Text('27')),
                                    DataCell(Text('Associate Professor')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            )),
          )
        ],
      ),
    );
  }
}
