import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Project {
  final int like_count;
  final String DatasetLink;
  final String ShortDescription;
  final String LongDescription;
  final String KeyFeature1;
  final String KeyFeature2;
  final String KeyFeature3;
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
      @required this.ShortDescription,
      @required this.LongDescription,
      @required this.KeyFeature1,
      @required this.KeyFeature2,
      @required this.KeyFeature3,
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
      this.timestamp,
      @required this.ProfessorDetails});
}
