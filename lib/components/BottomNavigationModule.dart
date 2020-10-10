import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/shop_screen.dart';
import 'package:flutter_app/components/todoey.dart';
class BottomNavigationModule extends StatefulWidget {
  static  String id ='bottomNavigationModule';
  final String title;
  final String floatingbarTitle;
  final Widget mBody;
  final Function floatingBarClicked;
  final Widget appBar;
  final Color color;
  BottomNavigationModule(
      {this.title, this.floatingbarTitle, this.mBody, this.floatingBarClicked,this.appBar,this.color});
  @override
  _BottomNavigationModuleState createState() => _BottomNavigationModuleState();
}

class _BottomNavigationModuleState extends State<BottomNavigationModule> {

  @override
  Widget build(BuildContext context) {
    int _mIndex=0;
    Widget child;
    switch(_mIndex){
     //  case 0 :
     //  Navigator.pushNamed(context, ShopScreen.id);
     // break;
      case 1 :
        Navigator.pushNamed(context, ShopScreen.id);
      break;
    }
    return Scaffold(
      backgroundColor: widget.color,
      appBar: widget.appBar,
      body: widget.mBody,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          backgroundColor: Colors.lightBlueAccent,
          onPressed: widget.floatingBarClicked,
          icon: Icon(Icons.add),
          label: Text(
            widget.floatingbarTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap:(int index){
          setState((){
            _mIndex=index;
          });
        },
        currentIndex: _mIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.shop), title: Text('Shops')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Account')),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget with PreferredSizeWidget{
  const AppBarWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.lightBlueAccent,
      title: Center(
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
