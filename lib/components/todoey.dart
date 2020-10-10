import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/BottomNavigationModule.dart';
import 'package:flutter_app/components/shop_screen.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/models/task_data.dart';
import 'package:flutter_app/services/ModalBottomSheet.dart';
import 'package:flutter_app/services/task_list.dart';
import 'package:flutter_app/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        ShopScreen.id: (context) => ShopScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}

class HomeScreen extends StatelessWidget {
  static String id = "home_screen";
  @override
  Widget build(BuildContext context) {
   return BottomNavigationModule(
color: Colors.lightBlueAccent,
      title: "Task Screen",
      floatingbarTitle: 'Add a Task',
      floatingBarClicked: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ModalBottomSheet((taskName) {
                Provider.of<TaskData>(context, listen: false)
                    .changeTheList(taskName);
              });
            });
      },
      mBody: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 55, left: 30, bottom: 30),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 40,
                    ),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    kTodoey,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    // " ${Provider.of<TaskData>(context).gettaskListlength()} "
                    " tasks",
                    style: TextStyle(color: Colors.white),
                  ),
                  FlatButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ShopScreen()));
                        Navigator.pushNamed(context, ShopScreen.id);
                      },
                      child: Text("Click on Me")),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: TaskList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
