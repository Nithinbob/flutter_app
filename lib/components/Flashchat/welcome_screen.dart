import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'login_screen.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/components/Flashchat/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_Screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//       bottomNavigationBar: TabBar(
//         tabs: [
// Tab(text: 'Home Screen',),
//           Tab(text: 'Shop Screen',),
//           Tab(text: 'Settings Screen',)
//
//         ],
//       ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/sup.jpg'),
                      height: 120,
                    ),
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ), // FOR GAP purpose
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: "Log in",
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              title: 'Register',
            ),

                StreamBuilder<List<String>>(
                    stream: get(),
                    builder: (context, snapshots) {
                      List<Text> list1 = [];
                      snapshots.data.forEach((element) {
                        if(element!=null) {
                          list1.add(Text(element));
                        }
                      });
                        return  Column(children:list1);
                    }),
            MaterialButton(
              color: Colors.red,
                onPressed: (){
                A.add("a");
                print(A.list.length);
                // setState(() {
                //   list.add("AAA");
                // });

            },
            ),
]
        ),
      ),
    );
  }

  Stream<List<String>> get() async* {

yield A.getList();

  }
}

class A{
 static List<String>   list=[
   "Sweet child'o mine",
   "November Rain",
   "Angella",
   "Japaneses"
 ];
 static add(String a){
   list.add(a);
 }
 static List<String> getList(){
   return list;
 }

}