import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/Helper/data_base_helper.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/models/task_data.dart';
import 'package:flutter_app/services/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      child:
      return FutureBuilder<List<Map<String, dynamic>>>(
          future: taskData.getList(),
          builder: (context, snapshots) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if(snapshots.hasData) {
                  return TaskTile(
                    taskTitle: snapshots.data[index][DataBaseHelper.columnName],
                    isChecked: false,
                    checkBoxCallback: (checkboxState) {
                      taskData.toggle(snapshots.data[index][DataBaseHelper
                          .columnName]);
                    },
                    remove: () async {
                      taskData.remove(snapshots.data[index][DataBaseHelper
                          .columnName],index);

                    },
                  );
                }else{
                  return Container();
                }
              },

              itemCount: snapshots.hasData ? snapshots.data.length: 0,
            );
          });
    });
  }
}
