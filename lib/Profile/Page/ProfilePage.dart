import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ProfileList.dart';
import '../ProfileTop.dart';
import '../ReviewList.dart';

class Profilepage extends StatefulWidget {
  final List<Person> personList;
  bool isButtonPress = true;

  Profilepage({Key? key, required this.personList, required this.isButtonPress})
      : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileTop(),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.isButtonPress = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 50),
                  primary: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.isButtonPress = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 50),
                  primary: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Review",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
            ],
          ),
          Expanded(
            child: widget.isButtonPress
                ? ProfileList(personList: widget.personList)
                : ReviewPage(),
          ),
        ],
      ),
    );
  }
}
