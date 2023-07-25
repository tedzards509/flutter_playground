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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Checkbox(
                  value: widget.task.completed,
                  onChanged: (value) {
                    setState(() {
                      widget.task.completed = value!;
                    });
                  }),
            ),
            Text(
              widget.task.title,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    decoration: widget.task.completed
                        ? TextDecoration.lineThrough
                        : null,
                    color: widget.task.completed ? Colors.grey : null,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskListViewer extends StatefulWidget {
  const TaskListViewer({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TaskListViewer> createState() => _TaskListViewerState();
}

class _TaskListViewerState extends State<TaskListViewer> {
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
