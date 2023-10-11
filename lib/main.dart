import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  // var PwdController = TextEditingController();
  static const String KEYNAME = 'Name';
  var namedValue = 'No Value Saved';
  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lOGIN'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            ElevatedButton(
              onPressed: () async {
                var name = '';

                var prefs = await SharedPreferences.getInstance();

                prefs.setString(KEYNAME, nameController.text.toString());
              },
              child: Text('Saved'),
            ),
            SizedBox(
              height: 11,
            ),
            Text(namedValue),
          ],
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getName = prefs.get(KEYNAME);

    namedValue = getName.toString() ?? 'No Value Saved';

    setState(() {});
  }
}
