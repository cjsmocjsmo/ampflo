import 'package:flutter/material.dart';



class AlbumScreen extends StatelessWidget {
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
                      '/Home'
                    );
                  },
                ),
            )
          ]
        )
      )
    );
  }
}