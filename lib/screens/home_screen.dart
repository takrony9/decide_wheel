import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/choices.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/wheel.dart';
import '../provider/items.dart';
import '../widgets/choose_entries.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List x = [
    'Enter Choices',
    'Enter Choices',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final items = Provider.of<Items>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Decide Wheel'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 0.4,
              child: items.choices.isEmpty ? Wheel(x) : Wheel(items.choices),
            ),
            ChooseEntries(),
            Choices(),
          ],
        ),
      ),
    );
  }
}
