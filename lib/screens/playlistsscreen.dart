import 'package:flutter/material.dart';
import 'artistscreen.dart';

class PlayListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.lightGreen.shade900,
        title: Text(
          "PlayList Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.purple, //desired color
          ),
          child: MyDrawer(),
        ),
      // drawer: MyDrawer(),
      body: Container(
      decoration: BoxDecoration(
        color: Colors.purpleAccent.shade400,
      ),
      child: Column(
        children: <Widget>[
          buttonSection(context),
          buttonSection2(context),

          // Image.asset('images/two.jpg'),
          // Center(
          //   child: Column(
          //     children: <Widget>[
          //       Padding(
          //         padding: EdgeInsets.all(10.0),
          //         child: Text(
          //           "Currently Playing",
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.w600,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(10.0),
          //         child: Text(
                    
          //           "ZZ Top",
          //           style: TextStyle(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w600,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //       // Padding(
          //       //   padding: EdgeInsets.all(10.0),
          //       //   child: Text(
          //       //     "Fandango",
          //       //     style: TextStyle(
          //       //       fontSize: 14,
          //       //       fontWeight: FontWeight.w600,
          //       //       color: Colors.black,
          //       //     ),
          //       //   ),
          //       // ),
          //       // Padding(
          //       //   padding: EdgeInsets.all(10.0),
          //       //   child: Text(
          //       //     "Mexican Black Bird",
          //       //     style: TextStyle(
          //       //       fontSize: 14,
          //       //       fontWeight: FontWeight.w600,
          //       //       color: Colors.black,
          //       //     ),
          //       //   ),
          //       // )
          //     ]
          //   ) 
          // ),
        ]
      ),
    ));
  }
}

Column _buildAddButtonColumn(BuildContext context, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.add_sharp, color: Colors.amber[400]),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.amber[400],
          ),
        ),
      ),
    ],
  );
}


_buildAddRandomButtonColumn(BuildContext context, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: Icon(Icons.add_sharp, color: Colors.amber[400]),
        tooltip: 'Create Random Playlist',
        onPressed: () {
          Navigator.of(context).pushNamed('/AddRandomForm');
          
        },
      ),
      Text(label, style: TextStyle(color: Colors.amber[400])),
      // Icon(Icons.add_sharp, color: Colors.amber[400]),
      // Container(
      //   margin: const EdgeInsets.only(top: 8),
      //   child: Text(
      //     label,
      //     style: TextStyle(
      //       fontSize: 14,
      //       fontWeight: FontWeight.w600,
      //       color: Colors.amber[400],
      //     ),
      //   ),
      // ),
    ],
  );
}

Column _buildEditButtonColumn(BuildContext context, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.edit, color: Colors.amber[400]),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.amber[400],
          ),
        ),
      ),
    ],
  );
}

Column _buildDeleteButtonColumn(String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.delete, color: Colors.amber[400]),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.amber[400],
          ),
        ),
      ),
    ],
  );
}

Column _buildLoadButtonColumn(String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.sync, color: Colors.amber[400]),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.amber[400],
          ),
        ),
      ),
    ],
  );
}

Widget buttonSection(BuildContext context) => Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildAddButtonColumn(context, "ADD"),
      _buildAddRandomButtonColumn(context, 'ADD RANDOM'),
      // _buildButtonColumn(Icons.edit, 'EDIT'),
      // _buildButtonColumn(Icons.delete, 'DELETE'),
      // _buildButtonColumn(Icons.sync, 'LOAD'),
      // _buildButtonColumn(Icons.stop_sharp, 'STOP'),
      // _buildButtonColumn(Icons.skip_next_sharp, 'NEXT'),
    ],
  ),
);

Widget buttonSection2(BuildContext context) => Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // _buildButtonColumn(Icons.add_sharp, "ADD"),
      // _buildButtonColumn(Icons.add_sharp, 'ADD RANDOM'),
      _buildEditButtonColumn(context, 'EDIT'),
      _buildDeleteButtonColumn('DELETE'),
      _buildLoadButtonColumn('LOAD'),
    ],
  ),
);