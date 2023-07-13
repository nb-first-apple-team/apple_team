import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Profile/Webview.dart';
import 'package:miniproject/team_member.dart';

class ProfileTop extends StatelessWidget {
  const ProfileTop({Key? key, required this.teamMember}) : super(key: key);

  final TeamMember teamMember;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Container(
                height: 240,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(teamMember.backPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 5), // Adjust the offset as needed
              child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage(teamMember.imagePath),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewScreen(url: teamMember.blogLink),
              ),
            );
          },
          child: Text(
            teamMember.blogLink,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
