import 'package:flutter/material.dart';
import 'package:note_keeper/edit_note.dart';
import 'package:note_keeper/note_tile.dart';
import 'package:note_keeper/task_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<String> abc = ['All', 'Pending', 'Completed'];
  String itemSelected = 'All';
  List<TaskModel> taskList = [];
  List<TaskModel> tempList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
            icon: const Icon(Icons.arrow_drop_down, size: 30, color: Colors.black),
            value: itemSelected,
            items: abc.map((String abc) {
              return DropdownMenuItem<String>(
                value: abc,
                child: Text(abc),
              );
            }).toList(),
            onChanged: (String? newValue) {
              tempList.clear();
              switch (newValue) {
                case "All":
                  tempList.addAll(taskList);
                  break;
                case "Pending":
                  tempList = taskList.where((element) => element.isCompleted == false).toList();
                  break;
                case "Completed":
                  tempList = taskList.where((element) => element.isCompleted == true).toList();
                  break;
                default:
              }
              setState(() {
                itemSelected = newValue!;
              });
            },
          )
        ],
        title: const Text("Notes"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tempList.length,
          itemBuilder: (context, index) => NoteTile(
            task: tempList[index],
            onDelete: () {
              setState(() {
                taskList.remove(tempList[index]);
                tempList.remove(tempList[index]);
              });
            },
            onUpdate: () async {
              TaskModel result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNote(
                            task1: taskList.elementAt(index),
                            isCreate: false,
                          )));
              if (result != null) {
                setState(() {
                  taskList.removeAt(index);
                  taskList.insert(index, result);
                  tempList.clear();
                  tempList.addAll(taskList);
                });
              }
            },
          ),
          scrollDirection: Axis.vertical,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TaskModel result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EditNote(
                        isCreate: true,
                      )));
          if (result != null) {
            setState(() {
              taskList.add(result);
              tempList.clear();
              tempList.addAll(taskList);
              print(tempList.length);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
