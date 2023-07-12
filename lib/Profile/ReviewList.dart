import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.ac_unit_outlined),
        title: TextField(
          decoration: InputDecoration(),
        ),
        trailing: Column(
          children: [
            Icon(Icons.favorite),
            Icon(Icons.favorite),
          ],
        ),
      ),
    );
  }
}
