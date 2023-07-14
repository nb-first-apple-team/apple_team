import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Service.dart/TeamService.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final teamService = TeamService();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    teamService.loadReviews();
    Provider.of<TeamService>(context, listen: false).loadReviews();
  }

  @override
  Widget build(BuildContext context) {
    final teamService = Provider.of<TeamService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: teamService.reviews.length,
              itemBuilder: (context, index) {
                final review = teamService.reviews[index];
                return ListTile(
                  title: Text(review.author),
                  subtitle: Text(review.content),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => teamService.deleteReview(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 40,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                String author = '';
                String content = '';
                authorController.text = ''; // 텍스트 필드 초기화
                contentController.text = '';
                return AlertDialog(
                  title: const Text('Leave a Review'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        controller: authorController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Review',
                        ),
                        controller: contentController,
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 66, 172, 69),
                      ),
                      onPressed: () {
                        author = authorController.text;
                        content = contentController.text;
                        if (author.isNotEmpty && content.isNotEmpty) {
                          teamService.reviews.add(
                            Review(
                              author: author,
                              content: content,
                            ),
                          );
                          teamService.saveReviews();
                          teamService.loadReviews();
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: Colors.teal[200],
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
