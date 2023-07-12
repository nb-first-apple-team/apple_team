import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:miniproject/team_member.dart';
import '../Profile/Page/ProfilePage2.dart';

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
          backPath: teamBackImagePath[index]));
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List imageList = [
    "https://cdn.pixabay.com/photo/2014/04/14/20/11/pink-324175_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_1280.jpg",
    "https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg",
    "https://cdn.pixabay.com/photo/2015/06/19/20/13/sunset-815270_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/01/08/05/24/sunflower-1127174_1280.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(
                top: 50,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 343,
                      height: 36,
                      child: Text(
                        'Content',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
                        child: MakeImageSlider("박세준")),
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
                        child: MakeImageSlider("전지성")),
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
                        child: MakeImageSlider("사석현")),
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
                        child: MakeImageSlider("박혜린")),
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
                        child: MakeImageSlider("이지현")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList.map(
        (imgLink) {
          return Builder(
            builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    imgLink,
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
        children: imageList.asMap().entries.map((entry) {
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

  Widget MakeImageSlider(name) {
    String slidername = name;
    //제가 만든 위젯인데, 돌아는 가는데 이렇게 하는게 맞나 모르겠습니다.

    return Container(
      width: 375,
      height: 351,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 343,
            height: 240,
            decoration: ShapeDecoration(
              color: Color(0xFFF6F6F6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Stack(
              children: [
                sliderWidget(),
                sliderIndicator(),
              ],
            ),
          ),
          SizedBox(
            width: 343,
            height: 35,
            child: Text(
              slidername,
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
              'minute ago',
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
