import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Helper/NetworkHandler.dart';

class ListItem extends StatelessWidget {
  final int index;
  ListItem({this.index});
  @override
  Widget build(BuildContext context) {
   NetworkHandler().getShops();
    return Container(
      height: 80,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: Image.asset('images/photo1.png'),
          title: Text("Item ${index + 1}"),
        ),
      ),
    );
  }
}
