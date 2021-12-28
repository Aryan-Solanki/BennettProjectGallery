import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTile extends StatelessWidget {
  final double top;
  final double left;
  final String title;
  final String subtitle;
  final double factor;
  const ProfileTile({
    this.left,
    this.top,
    this.title,
    this.subtitle,
    this.factor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: top,
      left: left,
      child: Container(
        padding: EdgeInsets.all(8*factor),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0,5*factor),
              blurRadius: 5*factor,
            )
          ]
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 12*factor,
              backgroundColor: Colors.grey[800],
              child: Icon(
                Icons.mail_outline_rounded,
                size: 12*factor,
                color: Colors.white,

              ),
            ),
            SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 9.0*factor,
                    color: Colors.black
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.nunito(
                      fontSize: 8.0*factor,
                      color: Colors.black
                  ),
                ),
              ],
            )
          ],
        ),

      ),

    );
  }
}
