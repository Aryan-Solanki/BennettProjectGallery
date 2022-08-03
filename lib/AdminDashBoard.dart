import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/projectgallery.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:url_launcher/url_launcher.dart';

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

  getProfProjects() async {
    var ProfID = auth.currentUser.email.toUpperCase();
    var prof = await _services.getProfessorById(ProfID);

    projectMap = prof["projects"];

    loading = true;

    for (var yog in projectMap.keys) {
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
                        Container(
                          width: MediaQuery.of(context).size.width-50,
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
                  );
                }

                return Padding(
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
                      Container(
                        width: MediaQuery.of(context).size.width-50,
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
                );
              },
            )),
          )
        ],
      ),
    );
  }
}
