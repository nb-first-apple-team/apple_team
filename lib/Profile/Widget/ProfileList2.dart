import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  final String title;
  final String subtitle;
  final Widget photo;

  Person({required this.title, required this.subtitle, required this.photo});
}

class ProfileList2 extends StatelessWidget {
  ProfileList2({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);
  final IndexedWidgetBuilder itemBuilder;

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hyerin.length,
      itemBuilder: (context, index) => ListTile(
        leading: hyerin[index].photo,
        title: Text(
          hyerin[index].title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          hyerin[index].subtitle,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
