import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  final String title;
  final String subtitle;
  final Widget photo;

  Person({required this.title, required this.subtitle, required this.photo});
}

class ProfileList extends StatelessWidget {
  ProfileList({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);
  final IndexedWidgetBuilder itemBuilder;

  List<Person> sejun = [
    Person(
        title: '이름', subtitle: '박세준', photo: Image.asset('images/sejun1.png')),
    Person(
        title: 'mbti',
        subtitle: 'ISTP',
        photo: Image.asset('images/sejun2.png')),
    Person(
        title: '장점',
        subtitle: '결단력있는 성격',
        photo: Image.asset('images/sejun3.png')),
    Person(
        title: '협업스타일',
        subtitle: ' 주어진것에 포기하지않고 최선을 다하기',
        photo: Image.asset('images/sejun4.png')),
    // 다른 사람들의 정보를 추가로 계속해서 작성할 수 있습니다.
  ];
  List<Person> hyerin = [
    Person(
        title: '이름', subtitle: '박혜린', photo: Image.asset('images/hyerin1.png')),
    Person(
        title: 'mbti',
        subtitle: 'ISTJ',
        photo: Image.asset('images/hyerin2.png')),
    Person(
        title: '장점',
        subtitle: '수용성이 매우 높다',
        photo: Image.asset('images/hyerin3.png')),
    Person(
        title: '협업스타일',
        subtitle: ' 최대 10분 안으로는 피드백 드리려고 하는 피드백왕',
        photo: Image.asset('images/hyerin4.png')),
    // 다른 사람들의 정보를 추가로 계속해서 작성할 수 있습니다.
  ];
  List<Person> seok = [
    Person(
        title: '이름', subtitle: '사석현', photo: Image.asset('images/seok1.png')),
    Person(
        title: 'mbti',
        subtitle: 'ISFJ',
        photo: Image.asset('images/seok2.png')),
    Person(
        title: '장점',
        subtitle: '뭐든 적응만하면 하는 성격',
        photo: Image.asset('images/seok3.png')),
    Person(
        title: '협업스타일',
        subtitle: ' 일단 시간 먼저 갈아넣자',
        photo: Image.asset('images/seok4.png')),
    // 다른 사람들의 정보를 추가로 계속해서 작성할 수 있습니다.
  ];
  List<Person> hyun = [
    Person(
        title: '이름', subtitle: '이지현', photo: Image.asset('images/hyun1.png')),
    Person(
        title: 'mbti',
        subtitle: 'INTJ',
        photo: Image.asset('images/hyun2.png')),
    Person(
        title: '장점',
        subtitle: '엄청난 참을성 존버!',
        photo: Image.asset('images/hyun3.png')),
    Person(
        title: '협업스타일',
        subtitle: '맡은바에 책임 다하기 ',
        photo: Image.asset('images/hyun4.png')),
    // 다른 사람들의 정보를 추가로 계속해서 작성할 수 있습니다.
  ];
  List<Person> sung = [
    Person(
        title: '이름', subtitle: '전지성', photo: Image.asset('images/sung1.png')),
    Person(
        title: 'mbti',
        subtitle: 'INTJ',
        photo: Image.asset('images/sung2.png')),
    Person(
        title: '장점',
        subtitle: '남들은 따라올 수 없는 참을성',
        photo: Image.asset('images/sung3.png')),
    Person(
        title: '협업스타일',
        subtitle: '시간을 갈아넣어서라도 어떻게든 하기 ',
        photo: Image.asset('images/sung4.png')),
    // 다른 사람들의 정보를 추가로 계속해서 작성할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sejun.length,
      itemBuilder: (context, index) => ListTile(
        leading: sejun[index].photo,
        title: Text(
          sejun[index].title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          sejun[index].subtitle,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
