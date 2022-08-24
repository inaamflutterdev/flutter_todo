import 'package:flutter/material.dart';
import 'package:flutter_todo_list/todomodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get builder => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => TodoModel(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(BuildContext);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO Application'),
        leading: const Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: screenHeight / 2,
                width: screenWidth,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Consumer<TodoModel>(
                  builder: (context, todo, _) {
                    return ListView.builder(
                      itemCount: todo.taskList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 10),
                            title: Text(
                              todo.taskList[index].title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              todo.taskList[index].detail,
                              style: const TextStyle(color: Colors.black45),
                            ),
                            trailing: const Icon(
                              Icons.check_circle,
                              color: Colors.greenAccent,
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Provider.of<TodoModel>(context, listen: false).addTaskInList();
        },
      ),
    );
  }
}
