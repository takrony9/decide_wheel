import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/items.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Items>(
      create: (context) => Items(),
      child: MaterialApp(
        title: 'Decide Wheel',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
