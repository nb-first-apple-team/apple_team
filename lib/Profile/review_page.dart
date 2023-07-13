import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<String> reviewList = ['한마디 쓰기'];
  List<String> textFieldValues = [''];
  bool isLiked = false;

  void _deleteReview(int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('reviewList', reviewList);

    setState(() {
      reviewList.removeAt(index);
      textFieldValues.removeAt(index);
    });
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
      textFieldValues = List.generate(savedReviewList?.length ?? 0, (_) => '');
    });
  }

  @override
  void dispose() {
    _saveReviewList();
    super.dispose();
  }

  void _saveReviewList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('reviewList', reviewList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: reviewList.length,
        itemBuilder: (context, index) {
          String review = reviewList[index];

          return Card(
              child: Row(children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    textFieldValues[index] = value;
                  });
                },
                controller: TextEditingController(text: textFieldValues[index]),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              child: SizedBox(
                child: Column(
                  children: [
                    Text(
                      "텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      isLiked
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: isLiked ? Colors.pink : Colors.black,
                    ),
                    GestureDetector(
                      onTap: () {
                        _deleteReview(index);
                      },
                      child: Icon(CupertinoIcons.trash),
                    )
                  ],
                ),
              ),
            ),
          ]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          String memo = '';
          setState(() {
            reviewList.add(memo);
            textFieldValues.add('');
          });
        },
      ),
    );
  }
}
