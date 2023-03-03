import 'package:flutter/material.dart';
import 'package:note_keeper/task_model.dart';

class NoteTile extends StatefulWidget {
  final TaskModel task;

  final void Function() onDelete;
  final void Function() onUpdate;

  const NoteTile({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.task.title,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: widget.onDelete,
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: widget.onUpdate,
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: const Icon(Icons.done),
                  onPressed: () => setState(() {
                    widget.task.isCompleted = true;
                  }),
                  color: widget.task.isCompleted ? Colors.green : Colors.grey,
                ),
              ],
            ),
            Text(widget.task.description),
          ],
        ),
      ),
    );
  }
}
