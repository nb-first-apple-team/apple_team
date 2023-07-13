import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<String> reviewList = [];
  List<TextEditingController> textControllers = [];
  List<bool> likedStatusList = [];

  void _deleteReview(int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      reviewList.removeAt(index); // 메모 삭제
      textControllers.removeAt(index); // TextEditingController 제거
      likedStatusList.removeAt(index); // 좋아요 상태 제거
    });
    await preferences.setStringList('reviewList', reviewList);
  }

  @override
  void initState() {
    super.initState();
    _loadReviewList();
  }

  void _loadReviewList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? savedReviewList = preferences.getStringList('reviewList');
    setState(() {
      reviewList = savedReviewList ?? [];
      textControllers = List.generate(
        reviewList.length,
        (index) => TextEditingController(text: reviewList[index]),
      );
      likedStatusList = List.generate(
        reviewList.length,
        (index) => false,
      );
    });
  }

  @override
  void dispose() {
    _saveReviewList();
    for (TextEditingController controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _saveReviewList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('reviewList', reviewList);
  }

  void _addReview() {
    setState(() {
      reviewList.add('');
      textControllers.add(TextEditingController(text: ''));
      likedStatusList.add(false);
    });
  }

  void _toggleLike(int index) {
    setState(() {
      likedStatusList[index] = !likedStatusList[index]; // 좋아요 상태를 토글
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: reviewList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textControllers[index],
                          onChanged: (value) {
                            reviewList[index] = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Review',
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "4:30",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _toggleLike(index); // 좋아요 토글
                              },
                              child: Icon(
                                likedStatusList[index]
                                    ? CupertinoIcons.heart_fill
                                    : CupertinoIcons.heart,
                                color: likedStatusList[index]
                                    ? Colors.pink
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _deleteReview(index); // 메모 삭제
                              },
                              child: Icon(CupertinoIcons.trash),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReview,
        child: Icon(Icons.add),
      ),
    );
  }
}
