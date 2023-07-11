import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Profile/Page/ProfilePage2.dart';
import '../Profile/Page/ProfilePage5.dart';
import '../Profile/Page/ProfilePage.dart';
import '../Profile/Page/ProfilePage3.dart';
import '../Profile/Page/ProfilePage4.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: ListTile(
              title: Text('세준'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile2()),
              );
            },
            child: ListTile(
              title: Text('혜린'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile3()),
              );
            },
            child: ListTile(
              title: Text('석현'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile4()),
              );
            },
            child: ListTile(
              title: Text('지현'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile5()),
              );
            },
            child: ListTile(
              title: Text('지성'),
            ),
          ),
        ],
      ),
    );
  }
}
