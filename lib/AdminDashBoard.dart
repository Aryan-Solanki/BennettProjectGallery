import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:url_launcher/url_launcher.dart';

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
    String csvData = ListToCsvConverter().convert(csvMap["result"]);
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
      csvMap["result"] = [];

      bool anyProjectRemoved = false;
      List<dynamic> projectList = projectMap[yog];
      finalProjectMap["result"] = List<Project>();
      finalDataRowMap["result"] = List<DataRow>();

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

        String imageLinks = "";

        for (var image in project["images"]) {
          imageLinks += image + "\n";
        }

        for (var student in project["StudentIdList"]) {
          StudentString += student["name"] +
              " | " +
              student["id"] +
              " | " +
              student["batch"] +
              " | " +
              student["yog"] +
              "\n";
        }

        for (var category in project["ProjectDetails"]["Categories"]) {
          StringCategories += category + "\n";
        }

        // Split a string into a list of strings, splitting on a delimiter.
        List<String> students = StudentString.split("\n");
        String studentNameString = "";
        String studentIDString = "";
        String studentBatchString = "";
        String studentYogString = "";
        for (var student in students) {
          if (student == "") {
            continue;
          }
          studentNameString += student.split("|")[0] + "\n";
          studentIDString += student.split("|")[1] + "\n";
          studentBatchString += student.split("|")[2] + "\n";
          studentYogString += student.split("|")[3] + "\n";
        }

        finalDataRowMap["result"].add(
          DataRow(
            cells: <DataCell>[
              DataCell(Text(project.id)),
              DataCell(Text(project["title"])),
              DataCell(Text(studentNameString)),
              DataCell(Text(studentIDString)),
              DataCell(Text(studentBatchString)),
              DataCell(Text(studentYogString)),
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
              //find length of the list of images
              project["images"].length == 1
                  ? DataCell(
                      Row(
                        children: [
                          FlatButton(
                            child: Text(project["images"][0]),
                            onPressed: () {
                              _launchURL(project["images"][0]);
                            },
                          ),
                        ],
                      ),
                    )
                  : project["images"].length == 2
                      ? DataCell(
                          Row(
                            children: [
                              FlatButton(
                                child: Text(project["images"][0]),
                                onPressed: () {
                                  _launchURL(project["images"][0]);
                                },
                              ),
                              FlatButton(
                                child: Text(project["images"][1]),
                                onPressed: () {
                                  _launchURL(project["images"][1]);
                                },
                              ),
                            ],
                          ),
                        )
                      : project["images"].length == 3
                          ? DataCell(
                              Row(
                                children: [
                                  FlatButton(
                                    child: Text(project["images"][0]),
                                    onPressed: () {
                                      _launchURL(project["images"][0]);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(project["images"][1]),
                                    onPressed: () {
                                      _launchURL(project["images"][1]);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(project["images"][2]),
                                    onPressed: () {
                                      _launchURL(project["images"][2]);
                                    },
                                  ),
                                ],
                              ),
                            )
                          : DataCell(Text("No Images")),
              DataCell(Text(StringCategories)),
              DataCell(Text(convert_timestamp_to_string(project["datetime"]))),
            ],
          ),
        );

        if (isFirst) {
          csvMap["result"].add(
            [
              "Project ID",
              "Title",
              "Student 1 Name",
              "Student 2 Name",
              "Student 3 Name",
              "Student 4 Name",
              "Student 5 Name",
              "Student 1 Roll Number",
              "Student 2 Roll Number",
              "Student 3 Roll Number",
              "Student 4 Roll Number",
              "Student 5 Roll Number",
              "Student 1 Batch",
              "Student 2 Batch",
              "Student 3 Batch",
              "Student 4 Batch",
              "Student 5 Batch",
              "Student 1 Year",
              "Student 2 Year",
              "Student 3 Year",
              "Student 4 Year",
              "Student 5 Year",
              "Dataset Link",
              "Project Link",
              "Report Link",
              "Video Link",
              "Image Links",
              "Categories",
              "DateTime",
              "Short Description",
              "Long Description",
              "KeyFeature1",
              "KeyFeature2",
              "KeyFeature3",
            ],
          );
          isFirst = false;
        }

        String imgString = "";
        for (var image in project["images"]) {
          imgString += image + "\n";
        }

        int x = studentNameString.split("\n").length;

        csvMap["result"].add(
          [
            project.id,
            project["title"],
            x >= 1 ? studentNameString.split("\n")[0] : "",
            x >= 2 ? studentNameString.split("\n")[1] : "",
            x >= 3 ? studentNameString.split("\n")[2] : "",
            x >= 4 ? studentNameString.split("\n")[3] : "",
            x == 5 ? studentNameString.split("\n")[4] : "",
            x >= 1 ? studentIDString.split("\n")[0] : "",
            x >= 2 ? studentIDString.split("\n")[1] : "",
            x >= 3 ? studentIDString.split("\n")[2] : "",
            x >= 4 ? studentIDString.split("\n")[3] : "",
            x == 5 ? studentIDString.split("\n")[4] : "",
            x >= 1 ? studentBatchString.split("\n")[0] : "",
            x >= 2 ? studentBatchString.split("\n")[1] : "",
            x >= 3 ? studentBatchString.split("\n")[2] : "",
            x >= 4 ? studentBatchString.split("\n")[3] : "",
            x == 5 ? studentBatchString.split("\n")[4] : "",
            x >= 1 ? studentYogString.split("\n")[0] : "",
            x >= 2 ? studentYogString.split("\n")[1] : "",
            x >= 3 ? studentYogString.split("\n")[2] : "",
            x >= 4 ? studentYogString.split("\n")[3] : "",
            x == 5 ? studentYogString.split("\n")[4] : "",
            project["ProjectDetails"]["DatasetLink"],
            project["ProjectDetails"]["ProjectLink"],
            project["ProjectDetails"]["ReportLink"],
            project["ProjectDetails"]["VideoLink"],
            imgString,
            StringCategories,
            convert_timestamp_to_string(project["datetime"]),
            project["ProjectDetails"]["ShortDescription"],
            project["ProjectDetails"]["LongDescription"],
            project["ProjectDetails"]["KeyFeature1"],
            project["ProjectDetails"]["KeyFeature2"],
            project["ProjectDetails"]["KeyFeature3"],
          ],
        );

        finalProjectMap["result"].add(
          new Project(
            id: project.id,
            yog: project["StudentIdList"][0]["yog"].toString(),
            like_count: project["LikeCount"],
            DatasetLink: project["ProjectDetails"]["DatasetLink"],
            ShortDescription: project["ProjectDetails"]["ShortDescription"],
            LongDescription: project["ProjectDetails"]["LongDescription"],
            KeyFeature1: project["ProjectDetails"]["KeyFeature1"],
            KeyFeature2: project["ProjectDetails"]["KeyFeature2"],
            KeyFeature3: project["ProjectDetails"]["KeyFeature3"],
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
      List<Project> yog_list = finalProjectMap["result"];
      yog_list
          .sort((a, b) => a.timestamp.seconds.compareTo(b.timestamp.seconds));
      if (anyProjectRemoved) {
        _services.updateProfData(ProfID, {"projects": projectMap});
      }
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
            width: 1050,
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
                      : Padding(
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
                                width: MediaQuery.of(context).size.width - 50,
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
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Project Title',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Student Name',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Student Roll Number',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Student Batch',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Year',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Dataset Link',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Project Link',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Report Link',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Video Link',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Image Links',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Categories',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Submission Time',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ],
                                      rows: finalDataRowMap["result"]),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        );
                }

                return loading
                    ? Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          child: Lottie.asset('assets/loading.json',
                              frameRate: FrameRate.max),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text("DashBoard",
                                style: TextStyle(
                                    fontFamily: "Metrisch-Bold", fontSize: 25)),
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
                              width: MediaQuery.of(context).size.width - 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                    showBottomBorder: true,
                                    dataRowHeight: 60,
                                    headingRowColor: MaterialStateProperty.all(
                                        Colors.grey[200]),
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Text(
                                          'ProjectId',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Project Title',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Student Name',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Student Roll Number',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Student Batch',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Year',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Dataset Link',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Project Link',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Report Link',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Video Link',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Image Links',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Categories',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Submission Time',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ],
                                    rows: finalDataRowMap["result"]),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      );
              },
            )),
          )
        ],
      ),
    );
  }
}
