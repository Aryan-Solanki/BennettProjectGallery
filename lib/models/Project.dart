import 'dart:collection';

import 'package:flutter/material.dart';

class Project {
  final int like_count;
  final String DatasetLink;
  final String Description;
  final String ProjectLink;
  final String ReportLink;
  final String VideoLink;
  final HashMap Reviews;
  final HashMap StudentIdList;
  final List<String> images;
  final String status;
  final String title;
  final int viewCount;
  final String yog;

  Project({
    @required this.like_count,
    @required this.DatasetLink,
    @required this.Description,
    @required this.ProjectLink,
    @required this.ReportLink,
    @required this.VideoLink,
    @required this.Reviews,
    @required this.StudentIdList,
    @required this.images,
    @required this.status,
    @required this.title,
    @required this.viewCount,
    @required this.yog,
  });
}
