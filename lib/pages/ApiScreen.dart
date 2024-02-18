import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/user_model.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
   List<UserModel> usersList = [];

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    late List<dynamic> jsonList;
    try{
    var response = await Dio().get(
        "https://randomuser.me/api/?gender=female&inc=name,dob"
    );
    if(response.statusCode == 200 ){
    setState(() {
      jsonList = (response.data['results'] as List<dynamic>);
      for(final json in jsonList){
        usersList.add(UserModel.fromJson(json));
      }
    });
    }else{
      print(response.statusCode);
    }
    }catch(e){
    print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Data of API'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index){
          final name = usersList[index].name;

          return Card(
            child: ListTile(
              title: Text(
                '${name.title} ${name.first} ${name.last}'
              ),
              subtitle: Text(
                  usersList[index].dob.date),
            ),
          );
        },
        itemCount: usersList.length,
      ),
    );
  }
}
