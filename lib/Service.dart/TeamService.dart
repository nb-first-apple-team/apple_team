import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TeamService extends ChangeNotifier {
  List<Review> reviews = [];

  loadReviews() async {
    final prefs = await SharedPreferences.getInstance();
    final reviewData = prefs.getString('reviews');
    if (reviewData != null) {
      final List<dynamic> jsonList = json.decode(reviewData);
      final List<Review> loadedReviews = jsonList.map((data) {
        return Review(
          author: data['author'],
          content: data['content'],
        );
      }).toList();
      reviews = loadedReviews;
    }
    notifyListeners();
  }

  saveReviews() async {
    final prefs = await SharedPreferences.getInstance();
    final List<dynamic> jsonList = reviews.map((review) {
      return {
        'author': review.author,
        'content': review.content,
      };
    }).toList();
    final reviewData = json.encode(jsonList);
    await prefs.setString('reviews', reviewData);
  }

  deleteReview(index) {
    reviews.removeAt(index);
    saveReviews();
    notifyListeners();
  }
}

class Review {
  final String author;
  final String content;

  Review({
    required this.author,
    required this.content,
  });
}

class TeamMember {
  final String name;
  final String mbti;
  final String strengths;
  final String collaboration;
  final String blogLink;
  final String imagePath;
  final String backPath;

  TeamMember({
    required this.name,
    required this.mbti,
    required this.strengths,
    required this.collaboration,
    required this.blogLink,
    required this.imagePath,
    required this.backPath,
  });
}
