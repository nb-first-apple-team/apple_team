import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Profile/ProfileList.dart';
import 'package:miniproject/Profile/ProfileTop.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileTop(),
          ProfileList(
            itemBuilder: (context, index) => ListTile(),
          ),
        ],
      ),
    );
  }
}
