import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Profile/Page/ProfilePage.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Text('프로필페이지'),
          )
        ],
      ),
    );
  }
}
