import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../provider/items.dart';
import 'custom_text_button.dart';

class ChoiceTextField extends StatefulWidget {
  final int id;

  ChoiceTextField({this.id});
  @override
  _ChoiceTextFieldState createState() => _ChoiceTextFieldState();
}

class _ChoiceTextFieldState extends State<ChoiceTextField> {
  final _controller = TextEditingController();
  String selected = '';

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(' Error!!!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final items = Provider.of<Items>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.55,
          child: TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            controller: _controller,
            onChanged: (value) {
              selected = value;
              if (widget.id == 0) items.addFirstChoice(selected);
            },
            onSubmitted: (value) {
              selected = value;
              if (widget.id == 0) items.addFirstChoice(selected);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              suffixIcon: IconButton(
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () {
                  _controller.clear();
                },
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        widget.id == 0
            ? Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  'Min # of choices =2',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : CustomTextButton('Add', () {
                if (_controller.value.text.isEmpty) {
                  _showErrorDialog('You didn\'t enter a value');
                } else if (widget.id == 1) {
                  if (items.firstChoices.isNotEmpty) {
                    items.addChoice(items.firstChoices.last);
                    items.addChoice(selected);
                  } else {
                    _showErrorDialog('Min # of choices = 2');
                  }
                } else if (items.choices.length == 1 || items.choices.isEmpty) {
                  _showErrorDialog('Min # of choices = 2');
                } else
                  items.addChoice(selected);
              }),
        // widget.id == 0
        //     ? SizedBox()
        //     : CustomTextButton('Delete', () {
        //         print(widget.id);
        //       }),
      ],
    );
  }
}
