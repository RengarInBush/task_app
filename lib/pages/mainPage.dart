import 'package:flutter/material.dart';
import 'package:task_app/pages/ApiScreen.dart';
import 'package:task_app/pages/listScreen.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder:(context) => const Home() ));
                  },
                  child: Text('List'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder:(context) => const ApiPage() ));
                },
                child: Text('API Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
