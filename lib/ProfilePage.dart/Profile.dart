import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/ProfilePage.dart/ProfileList.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileList(
            itemBuilder: (context, index) => ListTile(),
          ),
          Container(),
        ],
      ),
    );
  }
}
