import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Project {
  final int like_count;
  final String DatasetLink;
  final String Description;
  final String ProjectLink;
  final String ReportLink;
  final String VideoLink;
  final List Reviews;
  final List StudentList;
  final List Categories;
  final List images;
  final String title;
  final int viewCount;
  final String yog;
  final Timestamp timestamp;
  final Map ProfessorDetails;

  Project(
      {@required this.like_count,
      @required this.DatasetLink,
      @required this.Description,
      @required this.ProjectLink,
      @required this.ReportLink,
      @required this.VideoLink,
      @required this.Reviews,
      @required this.Categories,
      @required this.StudentList,
      @required this.images,
      @required this.title,
      @required this.viewCount,
      @required this.yog,
      @required this.timestamp,
      @required this.ProfessorDetails});
}
