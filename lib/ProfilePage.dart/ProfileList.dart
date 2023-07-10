import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  ProfileList({super.key, required this.itemBuilder});
  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(),
    );
  }
}
