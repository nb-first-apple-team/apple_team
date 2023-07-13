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
  bool isLiked = false;

    void _deleteReview(int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('reviewList', reviewList);}

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: reviewList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                TextField(
                  controller: textControllers[index],
                  onChanged: (value) {
                    reviewList[index] = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Review',
                  ),
                ),
                Container(
                  child: Column(children: [
                     Text(
                          "텍스트",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),),
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
                )]),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReview,
        child: Icon(Icons.add),
      ),
    );
  }
}