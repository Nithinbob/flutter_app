import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/models/task_data.dart';
import 'package:flutter_app/services/task_list.dart';
import 'package:provider/provider.dart';
class ModalBottomSheet extends StatefulWidget {
  final Function newTaskAdded;
  ModalBottomSheet(this.newTaskAdded);

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  String trackName;
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Add Task",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.lightBlueAccent,fontSize: 30,fontWeight: FontWeight.w700,
                  ),),

                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText){
                    setState(() {
                      trackName=newText;
                    });

                  },
                  // decoration: InputDecoration(hintText:"Create task"),
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  onPressed: (){
                    widget.newTaskAdded(trackName?? 'NO TEXT');
                    Navigator.pop(context);
                  },
                  child: Text('Add Task', style: TextStyle(color: Colors.white),),color: Colors.lightBlueAccent,

                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius:  BorderRadius.only(topRight:Radius.circular(25),topLeft: Radius.circular(25)),
          )
      ),
    );
  }
}


