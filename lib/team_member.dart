import 'package:flutter/material.dart';

class TeamMember {
  final String name;
  final String mbti;
  final String strengths;
  final String collaboration;
  final String blogLink;
  final String imagePath;
  final String backPath;

  TeamMember(
      {required this.name,
      required this.mbti,
      required this.strengths,
      required this.collaboration,
      required this.blogLink,
      required this.imagePath,
      required this.backPath});
}
