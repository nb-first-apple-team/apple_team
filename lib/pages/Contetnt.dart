import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:miniproject/pages/home.dart';

import '../Profile/Widget/ProfileList.dart';
import '../Service.dart/TeamService.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static List<String> personName = [
    '박세준',
    '전지성',
    '사석현',
    '박혜린',
    '이지현',
  ];
  static List<String> mbti = [
    'INTP',
    'INTJ',
    'ISFJ',
    'ISTJ',
    'INTJ',
  ];
  static List<String> strengths = [
    '결단력있는 성격',
    '성실함',
    '뭐든 적응하면 되는 성격',
    '수용성이 높음',
    '참을성',
  ];
  static List<String> collaboration = [
    '주어진 것에 포기하지 않고 최선을 다하기',
    '시간을 잘 아끼기',
    '일단 시간을 먼저 갈아넣자',
    '최대 10분 안으로 피드백 드리기',
    '맡은 바에 책임 다하기',
  ];
  static List<String> blogLink = [
    'https://boradoritech-ai.tistory.com/manage/posts/',
    'https://velog.io/@pmet',
    'https://pathdiary.tistory.com',
    'https://velog.io/@thwn1012',
    'https://penguin1004.tistory.com/',
  ];
  static List<String> teamImagePath = [
    'assets/J1.png',
    'assets/G4.jpeg',
    'assets/S1.jpeg',
    'assets/P4.jpeg',
    'assets/I3.jpeg',
  ];
  static List<String> teamBackImagePath = [
    'assets/J2.jpeg',
    'assets/G1.jpeg',
    'assets/S3.jpeg',
    'assets/P1.jpeg',
    'assets/I2.jpeg',
  ];
  final List<TeamMember> teamData = List.generate(
    collaboration.length,
    (index) => TeamMember(
      name: personName[index],
      mbti: mbti[index],
      strengths: strengths[index],
      collaboration: collaboration[index],
      blogLink: blogLink[index],
      imagePath: teamImagePath[index],
      backPath: teamBackImagePath[index],
    ),
  );
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<List<String>> imageList = [
    [
      'images/sejun1.png',
      'images/sejun2.png',
      'images/sejun3.png',
      'images/sejun4.png',
    ],
    [
      'images/sung1.png',
      'images/sung2.png',
      'images/sung3.png',
      'images/sung4.png',
    ],
    [
      'images/seok1.png',
      'images/seok2.png',
      'images/seok3.png',
      'images/seok4.png',
    ],
    [
      'images/hyerin1.png',
      'images/hyerin2.png',
      'images/hyerin3.png',
      'images/hyerin4.png',
    ],
    [
      'images/hyun1.png',
      'images/hyun2.png',
      'images/hyun3.png',
      'images/hyun4.png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Content",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white70,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 3),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              personName: '세준',
                              teamMember: teamData[0],
                            ),
                          ),
                        );
                      },
                      child: MakeImageSlider(
                        personIndex: 0,
                        name: "박세준\u{1f60e}",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              personName: '지성',
                              teamMember: teamData[1],
                            ),
                          ),
                        );
                      },
                      child: MakeImageSlider(
                        personIndex: 1,
                        name: "전지성😋",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              personName: '석현',
                              teamMember: teamData[2],
                            ),
                          ),
                        );
                      },
                      child: MakeImageSlider(
                        personIndex: 2,
                        name: "사석현🤗",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              personName: '혜린',
                              teamMember: teamData[3],
                            ),
                          ),
                        );
                      },
                      child: MakeImageSlider(
                        personIndex: 3,
                        name: "박혜린🤩",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              personName: '지현',
                              teamMember: teamData[4],
                            ),
                          ),
                        );
                      },
                      child: MakeImageSlider(
                        personIndex: 4,
                        name: "이지현🤨",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sliderWidget(int personIndex) {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList[personIndex].map(
        (imgLink) {
          return Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color.fromARGB(255, 230, 152, 36),
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imgLink,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  Widget sliderIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList[_current].asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12,
              height: 12,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget MakeImageSlider({required int personIndex, required String name}) {
    return Container(
      width: 375,
      height: 351,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF6F6F6),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 343,
            height: 240,
            child: Stack(
              children: [
                sliderWidget(personIndex),
                sliderIndicator(),
              ],
            ),
          ),
          SizedBox(
            width: 343,
            height: 35,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 343,
            height: 35,
            child: Text(
              '',
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
