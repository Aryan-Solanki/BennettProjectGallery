import 'package:bennettprojectgallery/ProjectGalleryElements/batchwiseprojects.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/categoriesButton.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/topprojects.dart';
import 'package:flutter/material.dart';

class LeftSide extends StatefulWidget {

  @override
  _LeftSideState createState() => _LeftSideState();
}

bool button1hover=false;
bool button2hover=false;
bool button3hover=false;

class _LeftSideState extends State<LeftSide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.grey.shade200,
            ),
            height: 45,
            child: TextField(
              style: TextStyle(

                  fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search,size: 22,color: Colors.black,),

                border: InputBorder.none,
                hintStyle: TextStyle(

                    fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
                hintText: 'Search Project',
                // contentPadding:
                // EdgeInsets.symmetric(horizontal: 20.0),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                // ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 5,
                height: 3,
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 20,
                height: 3,
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 5,
                height: 3,
              )
            ],
          ),
          SizedBox(height: 15,),
          Text("Categories",style: TextStyle(fontSize: MediaQuery.of(context).size.height/33,color: Colors.black87,fontFamily: "Metrisch-Bold"),),
          SizedBox(height: 20,),
          Container(
            height: 180,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CategoriesButton(categoryName: "PYTHON",categoryQuantity: 213,),
                    Divider(color: Colors.black12,thickness: 1,)
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 5,
                height: 3,
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 20,
                height: 3,
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 5,
                height: 3,
              )
            ],
          ),
          SizedBox(height: 15,),
          Text("Most Viewed Projects",style: TextStyle(fontSize: MediaQuery.of(context).size.height/33,color: Colors.black87,fontFamily: "Metrisch-Bold"),),
          SizedBox(height: 20,),
          Container(
            height: 300,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return TopProjects(projectName: "Computer Vision using Deep Learning and Machine Learning",madeBy: "Aryan Solanki",);
              },
            ),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 5,
                height: 3,
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 20,
                height: 3,
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 5,
                height: 3,
              )
            ],
          ),
          SizedBox(height: 15,),
          Text("Batch Wise Projects",style: TextStyle(fontSize: MediaQuery.of(context).size.height/33,color: Colors.black87,fontFamily: "Metrisch-Bold"),),
          SizedBox(height: 20,),
          BatchWiseProjects(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

}

