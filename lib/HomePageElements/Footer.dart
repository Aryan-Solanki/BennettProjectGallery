import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 1220
        ? Container(
      padding: EdgeInsets.only(top: 100,right: 20,left: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/footerimg.png"), fit: BoxFit.fill),
              color: Color(0xfff5f6fb),
            ),
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                height: 90,
                                image: AssetImage(
                                  "assets/logo1.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: 270,
                                child: Text(
                                    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum.",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.8,
                                        fontSize: 15,
                                        color: Colors.white)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.white,
                                      size: 10,
                                    )),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.white,
                                      size: 10,
                                    )),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.white,
                                      size: 10,
                                    )),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.white,
                                      size: 10,
                                    )),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.white,
                                      size: 10,
                                    )),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 65,),
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Services",
                                  style: TextStyle(
                                      fontFamily: "Metrisch-Bold",
                                      height: 1.8,
                                      fontSize: 22,
                                      color: Colors.white)),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onHover: (x) {
                                  if (x) {
                                    setState(() {});
                                  } else {
                                    setState(() {});
                                  }
                                },
                                child: Text("Search Engine Marketing",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.8,
                                        fontSize: 15,
                                        color: Colors.white)),
                              ),
                              InkWell(
                                onHover: (x) {
                                  if (x) {
                                    setState(() {});
                                  } else {
                                    setState(() {});
                                  }
                                },
                                child: Text("Search Engine Marketing",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.8,
                                        fontSize: 15,
                                        color: Colors.white)),
                              ),
                              InkWell(
                                onHover: (x) {
                                  if (x) {
                                    setState(() {});
                                  } else {
                                    setState(() {});
                                  }
                                },
                                child: Text("Search Engine Marketing",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.8,
                                        fontSize: 15,
                                        color: Colors.white)),
                              ),
                              InkWell(
                                onHover: (x) {
                                  if (x) {
                                    setState(() {});
                                  } else {
                                    setState(() {});
                                  }
                                },
                                child: Text("Search Engine Marketing",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.8,
                                        fontSize: 15,
                                        color: Colors.white)),
                              ),
                              InkWell(
                                onHover: (x) {
                                  if (x) {
                                    setState(() {});
                                  } else {
                                    setState(() {});
                                  }
                                },
                                child: Text("Search Engine Marketing",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.8,
                                        fontSize: 15,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Container(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Contacts",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Bold",
                                        height: 1.8,
                                        fontSize: 22,
                                        color: Colors.white)),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {});
                                    } else {
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                      "Adress: 27 Division St, New York, NY 10002, United States of America",
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Medium",
                                          height: 1.8,
                                          fontSize: 15,
                                          color: Colors.white)),
                                ),
                                InkWell(
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {});
                                    } else {
                                      setState(() {});
                                    }
                                  },
                                  child: Text("Website: seofy.com",
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Medium",
                                          height: 1.8,
                                          fontSize: 15,
                                          color: Colors.white)),
                                ),
                                InkWell(
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {});
                                    } else {
                                      setState(() {});
                                    }
                                  },
                                  child: Text("Email: seofy@mail.com",
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Medium",
                                          height: 1.8,
                                          fontSize: 15,
                                          color: Colors.white)),
                                ),
                                InkWell(
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {});
                                    } else {
                                      setState(() {});
                                    }
                                  },
                                  child: Text("Phone: +91 92385 78339",
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Medium",
                                          height: 1.8,
                                          fontSize: 15,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Updates",
                                  style: TextStyle(
                                      fontFamily: "Metrisch-Bold",
                                      height: 1.8,
                                      fontSize: 22,
                                      color: Colors.white)),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.grey.shade200,
                                ),
                                height: 50,
                                width: 250,
                                child: TextField(
                                  style: TextStyle(
                                      fontFamily: "Metrisch-Medium",
                                      height: 1.5,
                                      fontSize: 15,
                                      color: Colors.black54),
                                  onChanged: (value) {
                                    //Do something with the user input.
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.5,
                                        fontSize: 15,
                                        color: Colors.black54),
                                    hintText: 'Enter Your Email *',
                                    // contentPadding:
                                    // EdgeInsets.symmetric(horizontal: 20.0),
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    // ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GradientButton(
                                title: "Sign In",
                                buttonwidth: 250,
                                buttonheight: 50,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 65,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white24,
                        width: 1110,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Terms of use | Privacy Environmental Policy",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Medium",
                                  height: 1.8,
                                  fontSize: 15,
                                  color: Colors.white)),
                          SizedBox(
                            width: 390,
                          ),
                          Text(
                              "Copyright © 2021 Bennett University. All Rights Reserved.",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Medium",
                                  height: 1.8,
                                  fontSize: 15,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : MediaQuery.of(context).size.width > 844
            ? Container(
      padding: EdgeInsets.only(top: 100,right: 20,left: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/footerimg.png"),
                      fit: BoxFit.fill),
                  color: Color(0xfff5f6fb),
                ),
                height: 730,
                width: MediaQuery.of(context).size.width,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    height: 90,
                                    image: AssetImage(
                                      "assets/logo1.png",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    width: 330,
                                    child: Text(
                                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum.",
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            height: 1.8,
                                            fontSize: 15,
                                            color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                          size: 10,
                                        )),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                          size: 10,
                                        )),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                          size: 10,
                                        )),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                          size: 10,
                                        )),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                          size: 10,
                                        )),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: 65,),
                                ],
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Services",
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          height: 1.8,
                                          fontSize: 22,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                    onHover: (x) {
                                      if (x) {
                                        setState(() {});
                                      } else {
                                        setState(() {});
                                      }
                                    },
                                    child: Text("Search Engine Marketing",
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            height: 1.8,
                                            fontSize: 15,
                                            color: Colors.white)),
                                  ),
                                  InkWell(
                                    onHover: (x) {
                                      if (x) {
                                        setState(() {});
                                      } else {
                                        setState(() {});
                                      }
                                    },
                                    child: Text("Search Engine Marketing",
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            height: 1.8,
                                            fontSize: 15,
                                            color: Colors.white)),
                                  ),
                                  InkWell(
                                    onHover: (x) {
                                      if (x) {
                                        setState(() {});
                                      } else {
                                        setState(() {});
                                      }
                                    },
                                    child: Text("Search Engine Marketing",
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            height: 1.8,
                                            fontSize: 15,
                                            color: Colors.white)),
                                  ),
                                  InkWell(
                                    onHover: (x) {
                                      if (x) {
                                        setState(() {});
                                      } else {
                                        setState(() {});
                                      }
                                    },
                                    child: Text("Search Engine Marketing",
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            height: 1.8,
                                            fontSize: 15,
                                            color: Colors.white)),
                                  ),
                                  InkWell(
                                    onHover: (x) {
                                      if (x) {
                                        setState(() {});
                                      } else {
                                        setState(() {});
                                      }
                                    },
                                    child: Text("Search Engine Marketing",
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            height: 1.8,
                                            fontSize: 15,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Container(
                                width: 330,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Contacts",
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            height: 1.8,
                                            fontSize: 22,
                                            color: Colors.white)),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InkWell(
                                      onHover: (x) {
                                        if (x) {
                                          setState(() {});
                                        } else {
                                          setState(() {});
                                        }
                                      },
                                      child: Text(
                                          "Adress: 27 Division St, New York, NY 10002, United States of America",
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.8,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ),
                                    InkWell(
                                      onHover: (x) {
                                        if (x) {
                                          setState(() {});
                                        } else {
                                          setState(() {});
                                        }
                                      },
                                      child: Text("Website: seofy.com",
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.8,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ),
                                    InkWell(
                                      onHover: (x) {
                                        if (x) {
                                          setState(() {});
                                        } else {
                                          setState(() {});
                                        }
                                      },
                                      child: Text("Email: seofy@mail.com",
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.8,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ),
                                    InkWell(
                                      onHover: (x) {
                                        if (x) {
                                          setState(() {});
                                        } else {
                                          setState(() {});
                                        }
                                      },
                                      child: Text("Phone: +91 92385 78339",
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.8,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Updates",
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Bold",
                                          height: 1.8,
                                          fontSize: 22,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.grey.shade200,
                                    ),
                                    height: 50,
                                    width: 250,
                                    child: TextField(
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Medium",
                                          height: 1.5,
                                          fontSize: 15,
                                          color: Colors.black54),
                                      onChanged: (value) {
                                        //Do something with the user input.
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            height: 1.5,
                                            fontSize: 15,
                                            color: Colors.black54),
                                        hintText: 'Enter Your Email *',
                                        // contentPadding:
                                        // EdgeInsets.symmetric(horizontal: 20.0),
                                        // border: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        // ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GradientButton(
                                    title: "Sign In",
                                    buttonwidth: 250,
                                    buttonheight: 50,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 65,
                          ),
                          Container(
                            height: 1,
                            color: Colors.white24,
                            width: 910,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Terms of use | Privacy Environmental Policy",
                                  style: TextStyle(
                                      fontFamily: "Metrisch-Medium",
                                      height: 1.8,
                                      fontSize: 15,
                                      color: Colors.white)),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                  "Copyright © 2021 Bennett University. All Rights Reserved.",
                                  style: TextStyle(
                                      fontFamily: "Metrisch-Medium",
                                      height: 1.8,
                                      fontSize: 15,
                                      color: Colors.white)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
      padding: EdgeInsets.only(top: 100,right: 20,left: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/footerimg.png"),
                      fit: BoxFit.cover),
                  color: Color(0xfff5f6fb),
                ),
                height: 1030,
                width: MediaQuery.of(context).size.width,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 330,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        width: 330,
                                        child: Text(
                                            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum.",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: FaIcon(
                                              FontAwesomeIcons.twitter,
                                              color: Colors.white,
                                              size: 10,
                                            )),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: FaIcon(
                                              FontAwesomeIcons.twitter,
                                              color: Colors.white,
                                              size: 10,
                                            )),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: FaIcon(
                                              FontAwesomeIcons.twitter,
                                              color: Colors.white,
                                              size: 10,
                                            )),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: FaIcon(
                                              FontAwesomeIcons.twitter,
                                              color: Colors.white,
                                              size: 10,
                                            )),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: FaIcon(
                                              FontAwesomeIcons.twitter,
                                              color: Colors.white,
                                              size: 10,
                                            )),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: 65,),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 330,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Services",
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Bold",
                                              height: 1.8,
                                              fontSize: 22,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Search Engine Marketing",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Search Engine Marketing",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Search Engine Marketing",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Search Engine Marketing",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Search Engine Marketing",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 330,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Contacts",
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Bold",
                                              height: 1.8,
                                              fontSize: 22,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text(
                                            "Adress: 27 Division St, New York, NY 10002, United States of America",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Website: seofy.com",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Email: seofy@mail.com",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                      InkWell(
                                        onHover: (x) {
                                          if (x) {
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Phone: +91 92385 78339",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.8,
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 330,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Updates",
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Bold",
                                              height: 1.8,
                                              fontSize: 22,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          color: Colors.grey.shade200,
                                        ),
                                        height: 50,
                                        width: 250,
                                        child: TextField(
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.5,
                                              fontSize: 15,
                                              color: Colors.black54),
                                          onChanged: (value) {
                                            //Do something with the user input.
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.5,
                                                fontSize: 15,
                                                color: Colors.black54),
                                            hintText: 'Enter Your Email *',
                                            // contentPadding:
                                            // EdgeInsets.symmetric(horizontal: 20.0),
                                            // border: OutlineInputBorder(
                                            //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            // ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      GradientButton(
                                        title: "Sign In",
                                        buttonwidth: 250,
                                        buttonheight: 50,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.white24,
                                  width: 910,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "Terms of use | Privacy Environmental Policy",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.8,
                                        fontSize: 15,
                                        color: Colors.white)),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                    "Copyright © 2021 Bennett University. All Rights Reserved.",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.8,
                                        fontSize: 15,
                                        color: Colors.white))
                              ],
                            ),
                            Positioned(
                              top: -107,
                              child: Image(
                                height: 90,
                                image: AssetImage(
                                  "assets/logo1.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
