import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              // Check the sizing information here and return your UI
              if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Resources",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/45,
                              color: Colors.black,
                              fontWeight: FontWeight.w800
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Resources",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/45,
                              color: Colors.black,
                              fontWeight: FontWeight.w800
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Resources",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/45,
                              color: Colors.black,
                              fontWeight: FontWeight.w800
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("About",style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height/55,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Resources",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/45,
                            color: Colors.black,
                            fontWeight: FontWeight.w800
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Resources",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/45,
                            color: Colors.black,
                            fontWeight: FontWeight.w800
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Resources",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/45,
                            color: Colors.black,
                            fontWeight: FontWeight.w800
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Resources",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/45,
                            color: Colors.black,
                            fontWeight: FontWeight.w800
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("About",style: GoogleFonts.nunito(
                            fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.copyright_rounded,color: Colors.black54,size: MediaQuery.of(context).size.height/45,),
              SizedBox(width:5,),
              Text("2020 all rights reserved",style: GoogleFonts.nunito(
                color: Colors.black54,
                  fontSize: MediaQuery.of(context).size.height/55,
                  fontWeight: FontWeight.w500
              )),
            ],
          )
        ],
      ),
    );
  }
}
