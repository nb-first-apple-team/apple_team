import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Profile/ProfileList.dart';
import 'package:miniproject/Profile/ProfileTop.dart';
import 'package:miniproject/Profile/ReviewList.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isButtonPress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileTop(),
          SizedBox(
            height: 50,
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
