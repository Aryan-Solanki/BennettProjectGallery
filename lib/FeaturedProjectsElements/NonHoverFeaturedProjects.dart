import 'package:flutter/material.dart';

class NonHoverFeaturedProductCard extends StatefulWidget {
  final String title;
  final String imagelink;
  final String Category;
  final String description;
  final String madeby;
  final String date;
  final String userprofilelink;


  NonHoverFeaturedProductCard({
    this.title,
    this.imagelink,
    this.Category,
    this.description,
    this.madeby,
    this.date,
    this.userprofilelink,
  });

  @override
  _NonHoverFeaturedProductCardState createState() => _NonHoverFeaturedProductCardState();
}



class _NonHoverFeaturedProductCardState extends State<NonHoverFeaturedProductCard> {




  int i=0;
  @override
  Widget build(BuildContext context) {


    return Card(
      elevation: 8,
      child: Stack(
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(maxWidth:MediaQuery.of(context).size.width>360?350:MediaQuery.of(context).size.width-40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onPressed: (){

                  },
                  child: Container(
                    height: 250,
                    constraints: BoxConstraints(maxWidth:MediaQuery.of(context).size.width-10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                         fit: BoxFit.cover,image: NetworkImage(
                       widget.imagelink,
                        )),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  constraints: BoxConstraints(maxWidth:MediaQuery.of(context).size.width),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onPressed: (){

                    },

                    child: Text(widget.title,style: TextStyle(
                        height: 1.3,overflow: TextOverflow.ellipsis,
                        fontFamily: "Metrisch-Bold",fontSize: 18,color: Colors.black)),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  constraints: BoxConstraints(maxWidth:MediaQuery.of(context).size.width),
                  child: Text(widget.description,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.left,style: TextStyle(
                      fontFamily: "Metrisch-Medium",height: 1.3, fontSize:15,color: Colors.black54)),
                ),
                SizedBox(height: 20,),
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0),
                  constraints: BoxConstraints( maxWidth: 300),
                  height: 1,
                  color: Colors.black26,
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                      ),
                      SizedBox(width: 10,),
                      Text(widget.madeby,style: TextStyle(
                          decorationThickness: 3,
                          decorationColor: Colors.green,
                          decoration: TextDecoration.underline,
                          fontFamily: "Metrisch-Medium",height: 1.3, fontSize: 13,color: Colors.green))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(widget.date,style: TextStyle(
                      fontFamily: "Metrisch-Medium",height: 1.3, fontSize: 13,color: Colors.black54)),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
          Positioned(
            top: 235,
            left: 25,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Color(0xff101770),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
              onPressed: (){

              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff101770),
                  border: Border.all(
                    color: Color(0xff101770),  // red as border color
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(4),

                child: Text(
                  "PYTHON",style: TextStyle(
                    fontFamily: "Metrisch-Medium",height: 1.3, fontSize: 12,color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
