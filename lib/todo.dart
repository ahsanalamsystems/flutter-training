import 'package:flutter/material.dart';
import 'package:lecture_one/providers/todo.provider.dart';
import 'package:provider/provider.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddToDoPageState createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  TextEditingController textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, todoProvider, child) {
      return Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: ListView(children: [
          Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textFieldController,
                      decoration: const InputDecoration(
                        labelText: 'Desscription',
                      ),
                      validator: (value) {
                        if ((value == null || value == '') ||
                            value.trim().isEmpty) {
                          return 'Kindly add description';
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            todoProvider.addTask(textFieldController.text);
                            textFieldController.text = '';
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ),
                    const Text(
                      'Tasks',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Visibility(
                      visible: todoProvider.todoList.isNotEmpty,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: todoProvider.todoList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: todoProvider.todoList[index].status
                                    ? const Color.fromARGB(255, 18, 240, 6)
                                    : null,
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
                                              Checkbox(
                                                  value: todoProvider
                                                      .todoList[index].status,
                                                  onChanged: (value) {
                                                    todoProvider
                                                        .changeStatus(index);
                                                  }),
                                              Text(todoProvider
                                                  .todoList[index].description)
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
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the dialog
                                                          },
                                                          child:
                                                              const Text('No'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            todoProvider
                                                                .deleteTask(
                                                                    index);

                                                            Navigator.of(
                                                                    context)
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
                    ),
                    Visibility(
                        visible: todoProvider.todoList.isEmpty,
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
