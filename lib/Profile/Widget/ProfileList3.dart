import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  final String title;
  final String subtitle;
  final Widget photo;

  Person({required this.title, required this.subtitle, required this.photo});
}

class ProfileList3 extends StatelessWidget {
  ProfileList3({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);
  final IndexedWidgetBuilder itemBuilder;

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: seok.length,
      itemBuilder: (context, index) => ListTile(
        leading: seok[index].photo,
        title: Text(
          seok[index].title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          seok[index].subtitle,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
