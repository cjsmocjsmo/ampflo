import 'package:flutter/material.dart';
import 'artistscreen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<IntroScreen> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    if (myController.text.length != 0) {
      pword = true;
    }
    
    print('Second text field: ${myController.text}');
  }
  var uname = false;
  var pword = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AmpFlo'),
      ),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.lightGreenAccent.shade400,
          color: Colors.purpleAccent[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Username',
                ),
                onChanged: (text) {
                  if (text.length != 0) {
                    uname = true;
                  }

                  print('First text field: $text');
                },
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                ),
                controller: myController,
              ),
              //button goes here
              const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 35),
                primary: Colors.black,
              ),
              onPressed: () {
                if (uname != false && pword != false) {
                  Navigator.pushNamed(
                    context,
                    '/Artists'
                  );
                }
                
              },
              child: const Text('AMPFLO'),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

