import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Row(
          children: [
            Checkbox(
              value: widget.task.completed,
              onChanged: (value) {
                setState(() {
                  widget.task.completed = value!;
                });
              },
            ),
            Text(widget.task.title),
          ],
        ),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(task: widget.tasks[index]);
      },
    );
  }
}

class Task {
  Task({required this.title, required this.id});

  final String title;
  final int id;

  bool completed = false;
}
