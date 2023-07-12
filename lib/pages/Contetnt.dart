import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Profile/Page/ProfilePage2.dart';

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
                MaterialPageRoute(
                  builder: (context) => Profile(
                    personName: '세준',
                  ),
                ),
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
                MaterialPageRoute(
                    builder: (context) => Profile(
                          personName: '헤린',
                        )),
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
                MaterialPageRoute(
                    builder: (context) => Profile(
                          personName: '석현',
                        )),
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
                MaterialPageRoute(
                    builder: (context) => Profile(
                          personName: '지현',
                        )),
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
                MaterialPageRoute(
                    builder: (context) => Profile(
                          personName: '지성',
                        )),
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
