import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // final _key = GlobalKey<FormState>();
  var todoController = TextEditingController();

  String? newValue;
  var initialTodo = [''];
  addTodo(String todo) {
    setState(() {
      initialTodo.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: initialTodo.length,
        itemBuilder: (context, index) {
          return index == 0
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      '"Add a task so that we remember when you forget"',
                      style: TextStyle(backgroundColor: Colors.yellow),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextFormField(
                        validator: (value) {
                          if (initialTodo.isEmpty) {
                            return "Task cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        controller: todoController,
                        onChanged: (value) {
                          newValue = value;
                        },
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide()),
                            hintText: "Add new task",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    todoController.clear();
                                  });
                                },
                                icon: const Icon(Icons.clear))),
                      ),
                    ),
                  ],
                )
              : ListTile(
                  title: Text(initialTodo[index]),
                  leading: const Icon(
                    Icons.work,
                    color: Color.fromARGB(255, 64, 226, 255),
                  ),
                  trailing: IconButton(
                      onPressed: () async {
                        setState(() {
                          initialTodo.removeLast();
                        });
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo(newValue.toString());

          todoController.clear();
        },
        backgroundColor: Colors.lightGreen,
        child: const Text("Add"),
      ),
    );
  }
}
