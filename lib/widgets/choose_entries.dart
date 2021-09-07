import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../provider/items.dart';

class ChooseEntries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Items>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: DropdownButton(
          dropdownColor: Colors.black12,
          focusColor: Colors.white,
          hint: Text('Choose # of entries'),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          underline: SizedBox(),
          isExpanded: true,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          value: items.count,
          onChanged: (value) {
            items.setCount(value);
          },
          items: items.index
              .map(
                (element) => DropdownMenuItem(
                  child: Text(element.toString()),
                  value: element,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
