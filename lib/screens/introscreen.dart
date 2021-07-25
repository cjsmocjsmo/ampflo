import 'package:flutter/material.dart';
import 'mainscreen.dart';
// import 'albumscreen.dart';
// import 'artistscreen.dart';
// import 'playlistscreen.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   static const String _title = "Ampflo";

//   Widget build(BuildContext context) {
//     return MaterialApp(title: _title, initialRoute: '/', routes: {
//       // '/': (context) => MainScreen(),
//       '/': (context) => IntroScreen(),
//       '/Main': (context) => MainContentScreen(),
//       // '/Albums': (context) => AlbumScreen(),
//       // '/Artists': (context) => ArtistScreen(),
//       // '/PlayLists': (context) => PlayListScreen(),
//     });
//   }
// }

// class IntroScreen extends StatelessWidget {
//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Ampflo",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.lightGreen.shade900,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.lightGreenAccent.shade400,
//         ),
//         child: Column(
//           children: <Widget>
//           [
//             Container(
//               padding: const EdgeInsets.all(25.0),
//               alignment: Alignment.center,
//               child: Image.asset('images/two.jpg'),
//             ),
//             Container(
//               padding: const EdgeInsets.all(25.0),
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     onPrimary: Colors.white,
//                     primary: Colors.lightGreen.shade900,
//                     side: BorderSide(color: Colors.black, width: 2),
//                     elevation: 20,
//                     minimumSize: Size(150, 50)
//                   ),
//                   child: Text(
//                     'Enter',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     )
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/Main'
//                     );
//                   },
//                 ),
//             ),
//             Container(
//               child: Text(
//                     'This is Intro screen',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     )
//                   ),
//             )
//           ]
//         )
//       )
//     );
//   }
// }



class IntroScreen extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<IntroScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('AmpFlog'),

        // backgroundColor: Colors.lightGreen[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
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
                Navigator.pushNamed(
                  context,
                  '/Main'
                );
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

