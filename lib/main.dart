import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Service.dart/TeamService.dart';

// <<<<<<< HEAD:lib/Service.dart/main.dart
import 'Service.dart/TeamService.dart';
import 'pages/home.dart';
// import 'Service.dart/Profile/TeamService.dart';
// import 'Service.dart/pages/home.dart';
// >>>>>>> VisitReviewList:lib/main.dart

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TeamService>(
          create: (context) => TeamService(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
