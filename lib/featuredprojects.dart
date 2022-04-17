import 'package:bennettprojectgallery/FeaturedProjectsElements/NonHoverFeaturedProjects.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bennettprojectgallery/FeaturedProjectsElements/FeaturedProductCard.dart';

class FeaturedProjects extends StatefulWidget {
  @override
  _FeaturedProjectsState createState() => _FeaturedProjectsState();
}

final List<dynamic> imgList = [
  [
    [
      "66 Sources for content Inspiration",
      "Canonicals - The Good, The Bad,& The Ugly ",
      "Ways To Analyze Logs Using The File Analyser"
    ],
    [
      "If you work in content, it’s a good idea to build up a bank of sites, newsletters and Twitter accounts that you find insightful and check them on a daily basis. Not only does it help inspire you, it highlights topics and forms of content that are currently working well, which you can then use to inform your strategy.",
      "I recommend BrainPickings.org to just about everyone I meet. It’s run by Maria Popova, who writes extensively about the creative process. It’s an absolute delight, plus as she’s been writing since 2006 there’s an extensive archive to explore, plus she sends out a weekly newsletter.",
      "In truth, a lot of things cross my path from following Volodymyr Kupriyanov. VK (as he’s known) was my colleague at Distilled, data analyst/journalist/visualisation expert, and an awesome resource if anyone needs any research or data wizardry on their projects. He’s freelance these days :)",
    ],
    [
      "https://images.unsplash.com/photo-1529653762956-b0a27278529c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFuZCUyMGhvbGRpbmclMjBwaG9uZXxlbnwwfHwwfHw%3D&w=1000&q=80",
      "https://image.freepik.com/free-photo/female-male-collegues-working-office_1303-17930.jpg",
      "https://images.pexels.com/photos/7693730/pexels-photo-7693730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ],
    [
      "Python",
      "Java",
      "Robotics",
    ],
    ["Aryan Solanki", "Akshat Rastogi", "Aman Singh"],
    [
      "November 16, 2021 ",
      "April 6, 2020 ",
      "March 21, 2021 ",
    ],
  ],
  [
    [
      "66 Sources for content Inspiration",
      "Canonicals - The Good, The Bad,& The Ugly ",
      "Ways To Analyze Logs Using The File Analyser"
    ],
    [
      "If you work in content, it’s a good idea to build up a bank of sites, newsletters and Twitter accounts that you find insightful and check them on a daily basis. Not only does it help inspire you, it highlights topics and forms of content that are currently working well, which you can then use to inform your strategy.",
      "I recommend BrainPickings.org to just about everyone I meet. It’s run by Maria Popova, who writes extensively about the creative process. It’s an absolute delight, plus as she’s been writing since 2006 there’s an extensive archive to explore, plus she sends out a weekly newsletter.",
      "In truth, a lot of things cross my path from following Volodymyr Kupriyanov. VK (as he’s known) was my colleague at Distilled, data analyst/journalist/visualisation expert, and an awesome resource if anyone needs any research or data wizardry on their projects. He’s freelance these days :)",
    ],
    [
      "https://images.unsplash.com/photo-1529653762956-b0a27278529c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFuZCUyMGhvbGRpbmclMjBwaG9uZXxlbnwwfHwwfHw%3D&w=1000&q=80",
      "https://image.freepik.com/free-photo/female-male-collegues-working-office_1303-17930.jpg",
      "https://images.pexels.com/photos/7693730/pexels-photo-7693730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ],
    [
      "Python",
      "Java",
      "Robotics",
    ],
    ["Aryan Solanki", "Akshat Rastogi", "Aman Singh"],
    [
      "November 16, 2021 ",
      "April 6, 2020 ",
      "March 21, 2021 ",
    ],
  ],
  [
    [
      "66 Sources for content Inspiration",
      "Canonicals - The Good, The Bad,& The Ugly ",
      "Ways To Analyze Logs Using The File Analyser"
    ],
    [
      "If you work in content, it’s a good idea to build up a bank of sites, newsletters and Twitter accounts that you find insightful and check them on a daily basis. Not only does it help inspire you, it highlights topics and forms of content that are currently working well, which you can then use to inform your strategy.",
      "I recommend BrainPickings.org to just about everyone I meet. It’s run by Maria Popova, who writes extensively about the creative process. It’s an absolute delight, plus as she’s been writing since 2006 there’s an extensive archive to explore, plus she sends out a weekly newsletter.",
      "In truth, a lot of things cross my path from following Volodymyr Kupriyanov. VK (as he’s known) was my colleague at Distilled, data analyst/journalist/visualisation expert, and an awesome resource if anyone needs any research or data wizardry on their projects. He’s freelance these days :)",
    ],
    [
      "https://images.unsplash.com/photo-1529653762956-b0a27278529c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFuZCUyMGhvbGRpbmclMjBwaG9uZXxlbnwwfHwwfHw%3D&w=1000&q=80",
      "https://image.freepik.com/free-photo/female-male-collegues-working-office_1303-17930.jpg",
      "https://images.pexels.com/photos/7693730/pexels-photo-7693730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ],
    [
      "Python",
      "Java",
      "Robotics",
    ],
    ["Aryan Solanki", "Akshat Rastogi", "Aman Singh"],
    [
      "November 16, 2021 ",
      "April 6, 2020 ",
      "March 21, 2021 ",
    ],
  ],
];
final List<Widget> imageSlidersPC = imgList
    .map((item) => Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FeaturedProductCard(
                  title: item[0][0],
                  description: item[1][0],
                  imagelink: item[2][0],
                  Category: item[3][0],
                  madeby: item[4][0],
                  date: item[5][0]),
              SizedBox(
                width: 20,
              ),
              FeaturedProductCard(
                  title: item[0][1],
                  description: item[1][1],
                  imagelink: item[2][1],
                  Category: item[3][1],
                  madeby: item[4][1],
                  date: item[5][1]),
              SizedBox(
                width: 20,
              ),
              FeaturedProductCard(
                  title: item[0][2],
                  description: item[1][2],
                  imagelink: item[2][2],
                  Category: item[3][2],
                  madeby: item[4][2],
                  date: item[5][2]),
            ],
          ),
        ))
    .toList();

final List<Widget> imageSlidersTab = imgList
    .map((item) => Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FeaturedProductCard(
                  title: item[0][0],
                  description: item[1][0],
                  imagelink: item[2][0],
                  Category: item[3][0],
                  madeby: item[4][0],
                  date: item[5][0]),
              SizedBox(
                width: 20,
              ),
              FeaturedProductCard(
                  title: item[0][1],
                  description: item[1][1],
                  imagelink: item[2][1],
                  Category: item[3][1],
                  madeby: item[4][1],
                  date: item[5][1]),
            ],
          ),
        ))
    .toList();

final List<Widget> imageSlidersMobile = imgList
    .map((item) => Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NonHoverFeaturedProductCard(
                  title: item[0][0],
                  description: item[1][0],
                  imagelink: item[2][0],
                  Category: item[3][0],
                  madeby: item[4][0],
                  date: item[5][0]),
            ],
          ),
        ))
    .toList();

class _FeaturedProjectsState extends State<FeaturedProjects> {
  @override
  int _current = 0;

  final CarouselController _controller = CarouselController();
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50),
      color: Color(0xfff5f6fb),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 10,
                height: 2,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 50,
                height: 2,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange.shade400,
                ),
                width: 10,
                height: 2,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("Featured Projects",
              style: TextStyle(fontFamily: "Metrisch-Bold", fontSize: 25)),
          SizedBox(
            height: 5,
          ),
          Text("Top featured Projects made by Bennetians",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Metrisch-Medium",
                  height: 1.3,
                  fontSize: 15,
                  color: Colors.black54)),
          SizedBox(
            height: 50,
          ),
          MediaQuery.of(context).size.width > 1200
              ? CarouselSlider(
                  items: imageSlidersPC,
                  carouselController: _controller,
                  options: CarouselOptions(
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      viewportFraction: 1,
                      height: 500,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                )
              : MediaQuery.of(context).size.width > 800
                  ? CarouselSlider(
                      items: imageSlidersTab,
                      carouselController: _controller,
                      options: CarouselOptions(
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          viewportFraction: 1,
                          height: 500,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    )
                  : CarouselSlider(
                      items: imageSlidersMobile,
                      carouselController: _controller,
                      options: CarouselOptions(
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          viewportFraction: 1,
                          height: 500,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return InkWell(
                onTap: () => _controller.animateToPage(entry.key),
                child: _current == entry.key
                    ? Container(
                        width: 20.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      )
                    : Container(
                        width: 6.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
