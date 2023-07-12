import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:miniproject/pages/home.dart';
import 'package:miniproject/Profile/Page/ProfilePage.dart';
import 'package:miniproject/team_member.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

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
    'assets/J1.jpeg',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Content',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: ListView.builder(
          itemCount: teamData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(teamData[index].name),
                leading: SizedBox(
                    height: 150,
                    width: 150,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Image.asset(
                          teamData[index].imagePath,
                        ))
                      ],
                    )),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfilePage(
                            teamMember: teamData[index],
                          )));
                  debugPrint(teamData[index].name);
                },
              ),
            );
          },
        ));
  }
}
