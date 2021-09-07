import 'choice_textField.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../provider/items.dart';
import '../widgets/choice_textField.dart';

class Choices extends StatefulWidget {
  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final items = Provider.of<Items>(context, listen: true);
    return items.count == null
        ? Column(
            children: [
              const Text(
                'didn\'t choose # yet',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                  height: height * 0.3,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : Container(
            width: width * 0.9,
            child: ListView.builder(
              itemCount: items.count,
              shrinkWrap: true,
              itemBuilder: (_, index) => ChoiceTextField(
                id: index,
              ),
            ),
          );
  }
}
