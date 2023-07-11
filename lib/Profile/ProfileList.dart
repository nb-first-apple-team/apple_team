import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  ProfileList({Key? key, required this.itemBuilder}) : super(key: key);
  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.deblur),
      ),
    );
  }
}
