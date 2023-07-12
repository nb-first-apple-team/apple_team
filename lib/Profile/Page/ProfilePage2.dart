import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Profile/Page/ProfilePage.dart';
import 'package:miniproject/Profile/ProfileList.dart';
import 'package:miniproject/team_member.dart';

class Profile extends StatefulWidget {
  final String personName;
  final TeamMember teamMember;
  Profile({required this.personName, required this.teamMember});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isButtonPress = true;

  @override
  Widget build(BuildContext context) {
    List<Person> personList = [];
    if (widget.personName == '세준') {
      personList = [
        Person(
          title: '이름',
          subtitle: '박세준',
          photo: Image.asset('images/sejun1.png'),
        ),
        Person(
          title: 'mbti',
          subtitle: 'ISTP',
          photo: Image.asset('images/sejun2.png'),
        ),
        Person(
          title: '장점',
          subtitle: '결단력있는 성격',
          photo: Image.asset('images/sejun3.png'),
        ),
        Person(
          title: '협업스타일',
          subtitle: '주어진 것에 포기하지않고 최선을 다하기',
          photo: Image.asset('images/sejun4.png'),
        ),
      ];
    } else if (widget.personName == '혜린') {
      personList = [
        Person(
          title: '이름',
          subtitle: '박혜린',
          photo: Image.asset('images/hyerin1.png'),
        ),
        Person(
          title: 'mbti',
          subtitle: 'ISTJ',
          photo: Image.asset('images/hyerin4.png'),
        ),
        Person(
          title: '장점',
          subtitle: '수용성이 매우 높다',
          photo: Image.asset('images/hyerin3.png'),
        ),
        Person(
          title: '협업스타일',
          subtitle: '최대 10분 안으로는 피드백 드리려고 하는 피드백왕',
          photo: Image.asset('images/hyerin2.png'),
        ),
      ];
    } else if (widget.personName == '석현') {
      personList = [
        Person(
          title: '이름',
          subtitle: '사석현',
          photo: Image.asset('images/seok1.png'),
        ),
        Person(
          title: 'mbti',
          subtitle: 'ISFJ',
          photo: Image.asset('images/seok2.png'),
        ),
        Person(
          title: '장점',
          subtitle: '뭐든 적응만하면 하는 성격',
          photo: Image.asset('images/seok3.png'),
        ),
        Person(
          title: '협업스타일',
          subtitle: '일단 시간 먼저 갈아넣자',
          photo: Image.asset('images/seok4.png'),
        ),
      ];
    } else if (widget.personName == '지현') {
      personList = [
        Person(
          title: '이름',
          subtitle: '이지현',
          photo: Image.asset('images/hyun1.png'),
        ),
        Person(
          title: 'mbti',
          subtitle: 'ISFJ',
          photo: Image.asset('images/hyun2.png'),
        ),
        Person(
          title: '장점',
          subtitle: '뭐든 적응만하면 하는 성격',
          photo: Image.asset('images/hyun3.png'),
        ),
        Person(
          title: '협업스타일',
          subtitle: '일단 시간 먼저 갈아넣자',
          photo: Image.asset('images/hyun4.png'),
        ),
      ];
    } else if (widget.personName == '지성') {
      personList = [
        Person(
          title: '이름',
          subtitle: '전지성',
          photo: Image.asset('images/sung1.png'),
        ),
        Person(
          title: 'mbti',
          subtitle: 'ISFJ',
          photo: Image.asset('images/sung2.png'),
        ),
        Person(
          title: '장점',
          subtitle: '뭐든 적응만하면 하는 성격',
          photo: Image.asset('images/sung3.png'),
        ),
        Person(
          title: '협업스타일',
          subtitle: '일단 시간 먼저 갈아넣자',
          photo: Image.asset('images/sung4.png'),
        ),
      ];
    }

    return Profilepage(
        personList: personList,
        isButtonPress: isButtonPress,
        teamMember: widget.teamMember);
  }
}
