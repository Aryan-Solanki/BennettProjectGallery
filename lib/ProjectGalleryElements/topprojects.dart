import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TopProjects extends StatefulWidget {
  final String madeBy;
  final String projectName;
  const TopProjects({
    this.madeBy,
    this.projectName,
  });

  @override
  _TopProjectsState createState() => _TopProjectsState();
}
bool hover=false;
class _TopProjectsState extends State<TopProjects> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onHover: (x){
          if(x){
            setState(() {
              hover=true;
            });
          }
          else{
            setState(() {
              hover=false;
            });
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          primary: Colors.white,
          padding: EdgeInsets.all(0.0),
        ),
        onPressed:(){

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
                width: 50,
                child: Image(fit: BoxFit.cover,image: NetworkImage("https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))
            ),
            SizedBox(width: 30,),
            ResponsiveBuilder(
              breakpoints: ScreenBreakpoints(
                  tablet: 550, desktop: 1140, watch: 300),
              builder: (context, sizingInformation) {
                // Check the sizing information here and return your UI
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 170,
                        child: Text(
                          widget.projectName.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 15,color: hover==true?Colors.green:Colors.black87),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        width: 170,
                        child: Text(
                          widget.madeBy.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: Colors.green),
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 140,
                      child: Text(
                        widget.projectName.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 15,color: hover==true?Colors.green:Colors.black87),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      width: 140,
                      child: Text(
                        widget.madeBy.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color: Colors.green),
                      ),
                    ),
                  ],
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
