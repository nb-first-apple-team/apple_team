import 'package:flutter/material.dart';
import 'package:miniproject/Profile/ProfileList.dart';
import 'package:miniproject/Profile/ProfileTop.dart';
import 'package:miniproject/Profile/ReviewList.dart';
import 'package:miniproject/team_member.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.teamMember}) : super(key: key);

  final TeamMember teamMember;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isButtonPress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.teamMember.name,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          ProfileTop(teamMember: widget.teamMember),
          SizedBox(
            width: 10,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButtonPress = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 50),
                  primary: isButtonPress
                      ? Colors.grey.shade400
                      : Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    color: isButtonPress ? Colors.white : Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButtonPress = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 50),
                  primary: !isButtonPress
                      ? Colors.grey.shade400
                      : Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Review",
                  style: TextStyle(
                    color: !isButtonPress ? Colors.white : Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: isButtonPress
                ? ProfileList(itemBuilder: (context, index) => ListTile())
                : ReviewPage(),
          ),
        ],
      ),
    );
  }
}
