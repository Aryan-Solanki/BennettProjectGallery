import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:bennettprojectgallery/HomePageElements/Header.dart';

class AdminDashBoard extends StatefulWidget {
  @override
  _AdminDashBoardState createState() => _AdminDashBoardState();
}

String selected = "zero";
double num_of_reviews = 5;

class _AdminDashBoardState extends State<AdminDashBoard> {
  Map projectMap = {};
  Map finalProjectMap = {};
  List<Project> projectListFinal = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  UserServices _services = UserServices();

  getProfProjects() async {
    var ProfID = auth.currentUser.email.toUpperCase();
    var prof = await _services.getProfessorById(ProfID);

    projectMap = prof["projects"];

    for (var yog in projectMap.keys) {
      bool anyProjectRemoved = false;
      List<dynamic> projectList = projectMap[yog];
      finalProjectMap[yog] = List<Project>();
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
                  return Row(
                    children: [
                      LeftSide(),
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
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Age',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Role',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
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
                }

                return Column(
                  children: [
                    LeftSide(),
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
