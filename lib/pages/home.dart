import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Contetnt.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => ContentPage()),
              );
            },
            child: Text('콘텐트페이지이동'),
          )
        ],
      ),
    );
  }
}
