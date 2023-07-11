import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Profile/ProfileTop.dart';
import 'package:miniproject/Profile/ReviewList.dart';
import 'package:miniproject/Profile/Widget/ProfileLsit5.dart';

class Profile5 extends StatefulWidget {
  Profile5({Key? key}) : super(key: key);

  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5> {
  bool isButtonPress = true;

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
                ? ProfileList5(itemBuilder: (context, index) => ListTile())
                : ReviewPage(),
          )
        ],
      ),
    );
  }
}
