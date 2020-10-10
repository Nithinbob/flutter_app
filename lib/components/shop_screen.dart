import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/BottomNavigationModule.dart';

import 'list_item.dart';

class ShopScreen extends StatelessWidget {
  static String id = "shop_Screen";

  @override
  Widget build(BuildContext context) {
    return BottomNavigationModule(floatingbarTitle: 'Add a new shop',
        title:'Shop Screen',
      mBody: ListViewScreen(),
      floatingBarClicked: (){},
      appBar: AppBarWidget(title: 'Shop Screen'),
      color: Colors.white,
    );
  }
}

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListItem(index: index);
      },
    );
  }
}
