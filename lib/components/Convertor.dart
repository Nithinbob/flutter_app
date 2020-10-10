import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/con_data.dart';

class Convertor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String SelectedMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Coin Ticker'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Card(
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 28.0),
                  child: Text('1BTC = ? USD'),
                )),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: SelectedMenu,
              items:getListOfDropdownzitems(),
              onChanged: (value) {
                setState(() {
                  SelectedMenu = value;
                });
                print(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem>  getListOfDropdownzitems() {
    List<DropdownMenuItem<String>> list=[];

    for (String str in kCurrenciesList) {
  list.add(   DropdownMenuItem(
       child: Text(str),
       value: str,
     ));
 }
   return list;

 }
}
