import 'package:bennettprojectgallery/DashBoardElements/RightBoard.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/ProjectCard.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'HomePageElements/Header.dart';
import 'ProjectGalleryElements/NoHoverProjectCard.dart';

class AdminDashBoard extends StatefulWidget {
  final String id;
  final String batch;
  final String course;
  final String email;
  final String image;
  final String name;
  final String school;
  final String yog;
  final List<dynamic> projectList;

  AdminDashBoard(
      {this.id,
        this.batch,
        this.course,
        this.email,
        this.image,
        this.name,
        this.school,
        this.yog,
        this.projectList});
  @override
  _AdminDashBoardState createState() => _AdminDashBoardState(
      id: this.id,
      batch: this.batch,
      course: this.course,
      email: this.email,
      image: this.image,
      name: this.name,
      school: this.school,
      yog: this.yog,
      projectList: this.projectList);
}

String selected = "zero";
double num_of_reviews = 5;

class _AdminDashBoardState extends State<AdminDashBoard> {
  final String id;
  final String batch;
  final String course;
  final String email;
  final String image;
  final String name;
  final String school;
  final String yog;
  final List<dynamic> projectList;
  _AdminDashBoardState(
      {this.id,
        this.batch,
        this.course,
        this.email,
        this.image,
        this.name,
        this.school,
        this.yog,
        this.projectList});

  List<dynamic> projectListupdated = [];

  UserServices _services = UserServices();

  getUserProjects() async {
    var user = await _services.getUserById(id);
    projectListupdated = user["projects"];
  }

  @override
  void initState() {
    getUserProjects();
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
            child: MediaQuery.of(context).size.width > 645
                ? Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Positioned(
                    left: 0,
                    top: 0,
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 5*500.0,
                            child: ListView.builder
                              (
                                itemCount: 5,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("2020 Batch Projects",
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Bold",
                                              fontSize: 25)),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: (){

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
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: DataTable(
                                          showBottomBorder: true,
                                          dataRowHeight: 60,
                                          headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                                          columns: const <DataColumn>[
                                            DataColumn(
                                              label: Text(
                                                'Name',
                                                style: TextStyle(fontStyle: FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Age',
                                                style: TextStyle(fontStyle: FontStyle.italic),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Role',
                                                style: TextStyle(fontStyle: FontStyle.italic),
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
                                        height: 25,
                                      ),
                                    ],
                                  );
                                }
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
                : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text("2020 Batch Projects",
                            style: TextStyle(
                                fontFamily: "Metrisch-Bold",
                                fontSize: 25)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: (){

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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            showBottomBorder: true,
                            dataRowHeight: 60,
                            headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Name',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Age',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Role',
                                  style: TextStyle(fontStyle: FontStyle.italic),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
