import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  final String title;
  final String subtitle;
  final Widget photo;

  Person({required this.title, required this.subtitle, required this.photo});
}

class ProfileList extends StatelessWidget {
  final List<Person> personList;

  ProfileList({required this.personList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: personList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: personList[index].photo,
            title: Text(
              personList[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              personList[index].subtitle,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }
}
