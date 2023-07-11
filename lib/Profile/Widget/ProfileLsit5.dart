import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  final String title;
  final String subtitle;
  final Widget photo;

  Person({required this.title, required this.subtitle, required this.photo});
}

class ProfileList5 extends StatelessWidget {
  ProfileList5({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);
  final IndexedWidgetBuilder itemBuilder;

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
      itemCount: sung.length,
      itemBuilder: (context, index) => ListTile(
        leading: sung[index].photo,
        title: Text(
          sung[index].title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          sung[index].subtitle,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
