import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'review_page.dart';
import 'package:provider/provider.dart';
import 'package:miniproject/Service.dart/TeamService.dart'; // TeamService를 임포트합니다.
import 'review_page.dart'; // 새로운 파일을 임포트합니다.

class TeamService with ChangeNotifier {
 List<String> reviewList = [];

  void addReview(String memo) {
    reviewList.add(memo);
    notifyListeners();
}
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TeamService(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
          ),
          body: ReviewPage(), // ReviewPage 위젯을 사용합니다.
        ),
      ),
    );
  }
}