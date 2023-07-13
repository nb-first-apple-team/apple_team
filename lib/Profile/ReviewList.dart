import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewPage extends StatefulWidget {
  final Map<int, String> reviewMap;
  final Function(Map<int, String>) onSaveReview;
  const ReviewPage(
      {Key? key, required this.onSaveReview, required this.reviewMap})
      : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  TextEditingController textEditingController = TextEditingController();
  List<String> savedItems = []; // 저장된 아이템 목록

  @override
  void initState() {
    super.initState();
    loadData(); // 앱 시작 시 데이터 불러오기
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('savedItems');
    if (json != null) {
      final List<dynamic> itemList = jsonDecode(json);
      setState(() {
        savedItems = itemList.map((item) => item.toString()).toList();
      });
    }
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(savedItems);
    await prefs.setString('savedItems', json);
  }

  @override
  void dispose() {
    saveData(); // 앱 종료 시 데이터 저장
    super.dispose();
  }

  void addItem(String item) {
    setState(() {
      savedItems.add(item);
    });
    saveData(); // 아이템 추가 후 데이터 저장
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: 'Enter an item',
          ),
          onSubmitted: (value) {
            addItem(value); // 입력 완료 후 아이템 추가
            textEditingController.clear(); // 입력 필드 초기화
          },
        ),
        SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          itemCount: savedItems.length,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.ac_unit_outlined),
            title: Text(savedItems[index]),
            trailing: Column(
              children: [
                Icon(Icons.favorite),
                Icon(Icons.favorite),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
