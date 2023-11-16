import 'package:flutter/material.dart';
import 'package:lecture_one/providers/todo.provider.dart';
import 'package:provider/provider.dart';

class CompletedTaskPage extends StatefulWidget {
  const CompletedTaskPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CompletedTaskPageState createState() => _CompletedTaskPageState();
}

class _CompletedTaskPageState extends State<CompletedTaskPage> {
  TextEditingController textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, todoProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Completed Task',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 11, 90, 181),
        ),
        body: ListView(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: todoProvider.completedTaskList.length,
                          itemBuilder: (context, index) {
                            final task = todoProvider.completedTaskList[index];
                            return Card(
                              color: const Color.fromARGB(255, 9, 215, 156),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              child: const Icon(
                                                Icons.check_circle_outline,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(task.description)
                                          ],
                                        ),
                                        GestureDetector(
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Delete Task'),
                                                    content: const Text(
                                                        'Are you sure you want to delete the task?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text('No'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          todoProvider
                                                              .deleteTask(
                                                                  task.id,
                                                                  'complete');

                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            'Delete'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                        )
                                      ]),
                                ),
                              ),
                            );
                          }),
                    ),
                    Visibility(
                        visible: todoProvider.completedTaskList.isEmpty,
                        child: const Text(
                          'No Task',
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ))
                  ],
                ),
              ))
        ]),
      );
    });
  }
}
