import 'package:bennettprojectgallery/models/Review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProjectDetailsReview extends StatefulWidget {
  final Review re;
  ProjectDetailsReview({this.re});
  @override
  _ProjectDetailsReviewState createState() => _ProjectDetailsReviewState();
}

class _ProjectDetailsReviewState extends State<ProjectDetailsReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/bennettprojectarchive.appspot.com/o/sampleProfilePicImages%2Fpp2.webp?alt=media&token=edc83022-4130-477c-904d-d0cb71b87851")),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width > 850
                ? 700
                : MediaQuery.of(context).size.width - 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaQuery.of(context).size.width > 380
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.re.name,
                            style: TextStyle(
                                color: Colors.black,
                                height: 1.3,
                                fontFamily: "Metrisch-Medium",
                                fontSize: 17),
                          ),
                          RatingBarIndicator(
                            rating: widget.re.rating,
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            widget.re.name,
                            style: TextStyle(
                                color: Colors.black,
                                height: 1.3,
                                fontFamily: "Metrisch-Medium",
                                fontSize: 17),
                          ),
                          RatingBarIndicator(
                            rating: widget.re.rating,
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.re.date,
                  style: TextStyle(
                      fontFamily: "Metrisch-Medium",
                      height: 1.5,
                      fontSize: 12,
                      color: Colors.black26),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.re.reviewText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "Metrisch-Medium",
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.black54),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
