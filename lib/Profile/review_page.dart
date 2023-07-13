import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<String> reviewList = ['한마디 쓰기'];
  bool isLiked = false;
   void _deleteReview(int index) {
    setState(() {
      reviewList.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: reviewList.length,
        itemBuilder: (context, index) {
          String review = reviewList[index];

          return Card(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
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
                          isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                          color: isLiked ? Colors.pink : Colors.black,
                        ),
                          GestureDetector(
                          onTap: () {
                            _deleteReview(index);
                          },
                          child: Icon(CupertinoIcons.trash),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          String memo = '';
          setState(() {
            reviewList.add(memo);
          });
        },
      ),
    );
  }
}
