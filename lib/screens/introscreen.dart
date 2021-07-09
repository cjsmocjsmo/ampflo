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

class IntroScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ampflo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.shade400,
        ),
        child: Column(
          children: <Widget>
          [
            Container(
              padding: const EdgeInsets.all(25.0),
              alignment: Alignment.center,
              child: Image.asset('images/two.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(25.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.lightGreen.shade900,
                    side: BorderSide(color: Colors.black, width: 2),
                    elevation: 20,
                    minimumSize: Size(150, 50)
                  ),
                  child: Text(
                    'Enter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Main'
                    );
                  },
                ),
            ),
            Container(
              child: Text(
                    'This is Intro screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )
                  ),
            )
          ]
        )
      )
    );
  }
}




// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = 'Form Validation Demo';

//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(appTitle),
//         ),
//         body: MyCustomForm(),
//       ),
//     );
//   }
// }

// // Create a Form widget.
// class MyCustomForm extends StatefulWidget {
//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }

// // Create a corresponding State class.
// // This class holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Validate returns true if the form is valid, or false otherwise.
//                 if (_formKey.currentState!.validate()) {
//                   // If the form is valid, display a snackbar. In the real world,
//                   // you'd often call a server or save the information in a database.
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }