import 'package:flutter/material.dart';
class DiscriptionPage extends StatefulWidget {
  const DiscriptionPage({super.key});

  @override
  State<DiscriptionPage> createState() => _DiscriptionState();
}

class _DiscriptionState extends State<DiscriptionPage> {

  final List<String> entries = [];
  TextEditingController dirController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Описание'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: dirController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Додаємо введений текст до списку
                setState(() {
                  entries.add(dirController.text);
                });
                dirController.clear();
              },
              child: Text('Зберегти'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(entries[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
