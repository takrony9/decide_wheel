import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Wheel extends StatefulWidget {
  List items;
  Wheel(this.items);

  @override
  _WheelState createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  StreamController<int> _controller = StreamController<int>.broadcast();

  var selected;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.add(Random().nextInt(widget.items.length));
        });
      },
      child: Column(
        children: [
          Expanded(
            child: FortuneWheel(
              items: [
                for (var items in widget.items)
                  FortuneItem(
                    child: Text(items),
                  ),
              ],
              selected: _controller.stream,
              animateFirst: false,
            ),
          ),
        ],
      ),
    );
  }
}
