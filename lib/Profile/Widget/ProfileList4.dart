import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  final String title;
  final String subtitle;
  final Widget photo;

  Person({required this.title, required this.subtitle, required this.photo});
}

class ProfileList4 extends StatelessWidget {
  ProfileList4({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);
  final IndexedWidgetBuilder itemBuilder;

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hyun.length,
      itemBuilder: (context, index) => ListTile(
        leading: hyun[index].photo,
        title: Text(
          hyun[index].title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          hyun[index].subtitle,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
