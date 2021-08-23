import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'artistscreen.dart';
import 'package:transparent_image/transparent_image.dart';

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
      password = myController.text;
    }
  }
  var uname = false;
  var pword = false;

  var username = "None";
  var password = "None";
  
  Future<List<dynamic>> fetchRandPics() async {
    final String apiUrl = "http://192.168.0.91:9090/RandomPics";
    final result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('AmpFlo'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.purpleAccent[200],
        ),
        child: 
        Padding(
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
                    username = text;
                  }
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
              const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 35),
                primary: Colors.black,
              ),
              onPressed: () {
                if (uname != false && pword != false) {
                  // print(username);
                  // print(password);
                  Navigator.of(context).pop();
                  Navigator.pushNamed(
                    context,
                    '/Artists'
                  );
                }
              },
              child: const Text('AMPFLO'),
            ),
            FutureBuilder<List<dynamic>>(
            future: fetchRandPics(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: snapshot.data[index],
                          fit: BoxFit.cover,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10
                      ),
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            ],
          ),
        ),       
      ),
    );
  }
}