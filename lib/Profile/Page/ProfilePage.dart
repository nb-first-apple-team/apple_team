import 'package:flutter/material.dart';
import '../../Service.dart/TeamService.dart';
import 'ProfilePage2.dart';
import '../ProfileTop.dart';
import 'package:miniproject/Profile/review_page.dart';

class Profilepage extends StatefulWidget {
  bool isButtonPress = true;
  final TeamMember teamMember;
  final List<Person> personList;

  Profilepage({
    Key? key,
    required this.personList,
    required this.isButtonPress,
    required this.teamMember,
  }) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileTop(teamMember: widget.teamMember),
            SizedBox(
              width: 10,
              height: 20,
            ),
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
                    primary: widget.isButtonPress
                        ? Colors.grey.shade600
                        : Colors.grey.shade400,
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
                    primary: widget.isButtonPress
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
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
            SizedBox(height: 30),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height - 390, // 적절한 높이를 지정해야합니다.
              child: widget.isButtonPress
                  ? ProfileList(personList: widget.personList)
                  : ReviewPage(),
            ),
          ],
        ),
      ),
    );
  }
}
