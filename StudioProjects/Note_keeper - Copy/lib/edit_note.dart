import 'package:flutter/material.dart';
import 'package:note_keeper/task_model.dart';

class EditNote extends StatefulWidget {
  final TaskModel? task1;
  final bool isCreate;

  const EditNote({Key? key, this.task1, required this.isCreate}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TaskModel task;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  bool _validate = false;
  bool _val = false;

  @override
  void initState() {
    if (widget.task1 != null) {
      titleController.text = widget.task1!.title;
      descriptionController.text = widget.task1!.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(widget.isCreate ? "Create Note" : "Edit Note")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Title",
                  errorText: _validate ? 'Value Cant Be Empty' : null),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Description",
                  errorText: _val ? 'Value Cant Be Empty' : null),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                        task = TaskModel(title: titleController.text, description: descriptionController.text);
                        Navigator.pop(context, task);
                      } else {
                        setState(() {
                          titleController.text.isEmpty ? _validate = true : _validate = false;
                          descriptionController.text.isEmpty ? _val = true : _val = false;
                        });
                      }
                    },
                    child: Text(widget.isCreate ? "Save" : "update")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   _controller.text.isEmpty ? _validate = true : _validate = false;
                      // });
                    },
                    child: const Text("Delete"))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
