import 'package:flutter/material.dart';
import 'package:sample/shared_preferences/homepage.dart';
import 'package:sample/shared_preferences/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var UnameController = TextEditingController();
  var PwdController = TextEditingController();

  static const String KEYNAME = 'Name';

  var namedValue = 'No Value Saved';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(21.0),
                child: Icon(Icons.add_circle, size: 100, color: Colors.blue),
              ),
              TextField(
                controller: UnameController,
                decoration: InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: PwdController,
                decoration: InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              ElevatedButton(
                  onPressed: () {
                    //it will navigate into the home page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text('Login')),
            ],
          ),
        ));
  }
}
