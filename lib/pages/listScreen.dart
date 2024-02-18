import 'package:flutter/material.dart';
import 'package:task_app/pages/discription.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String userToDo;
  late String discription;
  List<String> listOfSmth = [];
  List<String> discriptions = [];

  @override
  void initState() {
    super.initState();

    listOfSmth.addAll([]);
    discriptions.addAll([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text('List of smth'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listOfSmth.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(listOfSmth[index]),
            child: Card(
              child: ListTile(
                title: Text(listOfSmth[index]),
                subtitle: Text(discriptions[index]),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.purpleAccent[100],
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const DiscriptionPage()));
                  },
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                listOfSmth.removeAt(index);
                discriptions.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent[100],
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Добавить элемент'),
                content: TextField(
                  onChanged: (String value) {
                    userToDo = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        listOfSmth.add(userToDo);
                        discriptions.add('Описание $userToDo');
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Добавить'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

