import 'package:flutter/foundation.dart';

class TeamService with ChangeNotifier {
  List<Review> reviewList = [];

  void addReview(Review review) {
    reviewList.add(review);
    notifyListeners();
  }

  void updateReview(int index, String newText) {
    reviewList[index].text = newText;
    notifyListeners();
  }

  void deleteReview(int index) {
    reviewList.removeAt(index);
    notifyListeners();
  }
}

class Review {
  String text;

  Review({required this.text});
}
