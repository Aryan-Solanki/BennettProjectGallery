import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconPalette extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;

   IconPalette({
    this.title,
     this.text,
     this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(6)
              ),
              child: Icon(icon,size:MediaQuery.of(context).size.height/40,color: Colors.white,)
          ),
          SizedBox(height: 10,),
          Text(title,style: GoogleFonts.nunito(
            fontSize: MediaQuery.of(context).size.height/45,
            fontWeight: FontWeight.w800
          )),
          SizedBox(height: 10,),
          Text(text,style: GoogleFonts.nunito(
              fontSize: MediaQuery.of(context).size.height/52,
              fontWeight: FontWeight.w400,
              color:Colors.black54
          )),
          SizedBox(height: 2,),
          TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero
              ),
              child: Text("Learn More...",style: GoogleFonts.nunito(
                  fontSize: MediaQuery.of(context).size.height/52,
                  fontWeight: FontWeight.w800,
                  color:Colors.black
              ))
          ),
          Container(
            height: 1.5,
            width: 80,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
