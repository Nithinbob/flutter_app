import 'package:flutter/material.dart';

class FirstAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(
            child: Text(
              "FlutterApp",
              style: TextStyle(fontSize: 15),
            ),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            //   image: NetworkImage(
            //       'https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Vikings_Season_6.jpg/220px-Vikings_Season_6.jpg'),
            // ),
            image: AssetImage('images/diamond.png'),),
        ),
        floatingActionButton: FloatingActionButton(
          child: Image(image: AssetImage('images/diamond.png'),),
          backgroundColor: Colors.blueGrey[900],
        ),
      ),
    );
  }
}

class MYLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'ID FORM',
              style: TextStyle(color: Colors.red, fontFamily: 'Ranchers'),
            ),
          ),
        ),
        body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 70,
                  backgroundImage: AssetImage('images/photo3.jpg'),
                ),
                Text(
                  'Nithin Aradhya',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ranchers',
                      fontSize: 30),
                ),
                Text(
                  'Mobile App Developer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Ranchers'),
                ),
                Text(
                  'Flutter',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Ranchers'),
                ),
                Text(
                  'Android',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Ranchers'),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 90),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.filter_drama,
                          size: 30,
                          color: Colors.red,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'VZCloud 4',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 80),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apps,
                          color: Colors.red,
                        ),
                        Text(
                          '  nithinaradhaya97@gmail.com',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.account_balance, color: Colors.red,),
        ),
      ),
    ));
  }
}

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Shopping'),
          ),
          backgroundColor: Colors.red,
        ),
        body: Image(
          image: AssetImage('images/photo1.png'),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
            )),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(child: Text('Hello World'), color: Colors.white),
        ),
      ),
    );
  }
}


class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100,
                height: 70,
                child: Text('row 1'),
                color: Colors.red,
                padding: EdgeInsets.all(20),
              ),
              Container(
                width: 100,
                height: 70,
                child: Text('row 2'),
                color: Colors.green,
                padding: EdgeInsets.all(20),
              ),
              Container(
                width: 100,
                height: 70,
                child: Text('row 3'),
                color: Colors.yellow,
                padding: EdgeInsets.all(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
