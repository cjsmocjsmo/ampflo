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
      password = myController.text;
    }
  }
  var uname = false;
  var pword = false;

  var username = "None";
  var password = "None";


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
              //button goes here
              const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 35),
                primary: Colors.black,
              ),
              onPressed: () {
                if (uname != false && pword != false) {
                  print(username);
                  print(password);
                  Navigator.of(context).pop();
                  Navigator.pushNamed(
                    context,
                    '/Artists'
                  );
                }
                
              },
              child: const Text('AMPFLO'),
            ),
           _MyIntroPage(),
            ],
             
          ),
        ),
        
      ),
    );
  }
}

List<String> images = [
  "images/Van_Halen_-_1984_thumb.jpg",
  "images/Van_Halen_-_5150_thumb.jpg",
  "images/Van_Halen_-_Balance_thumb.jpg",
  "images/Van_Halen_-_Diver_Down_thumb.jpg",
  "images/Van_Halen_-_Fair_Warning_thumb.jpg",
  "images/Weezer_-_The_Green_Album_thumb.jpg",
  "images/Whitesnake_-_Good_To_Be_Bad_thumb.jpg",
  "images/Zakk_Wylde_-_Pride_And_Glory_thumb.jpg",
  "images/ZZ_Top_-_Afterburner_thumb.jpg",
  "images/ZZ_Top_-_Antenna_thumb.jpg",
  "images/ZZ_Top_-_Deguello_thumb.jpg",
];


class _MyIntroPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(images[index], fit: BoxFit.cover);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10
      ),
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
    );
  }
}

//  Van_Halen_-_1984_thumb.jpg
//  Van_Halen_-_5150_thumb.jpg
//  Van_Halen_-_Balance_thumb.jpg
//  Van_Halen_-_Diver_Down_thumb.jpg
//  Van_Halen_-_Fair_Warning_thumb.jpg
//  Van_Halen_-_For_Unlawful_Carnal_Knowledge_thumb.jpg
//  Van_Halen_-_Live_Right_Here_Right_Now_Disc_1_thumb.jpg
//  Van_Halen_-_Live_Right_Here_Right_Now_Disc_2_thumb.jpg
//  Van_Halen_-_OU812_thumb.jpg
//  Van_Halen_-_The_Best_of_Both_Worlds_Disc_1_thumb.jpg
//  Van_Halen_-_The_Best_of_Both_Worlds_Disc_2_thumb.jpg
//  Van_Halen_-_The_Best_Of_Van_Halen,_Vol.1_thumb.jpg
//  Van_Halen_-_Van_Halen_III_thumb.jpg
//  Van_Halen_-_Van_Halen_II_thumb.jpg
//  Van_Halen_-_Van_Halen_thumb.jpg
//  Van_Halen_-_Women_and_Children_First_thumb.jpg
//  Van_Halen_-_Women_And_Children_First_thumb.jpg
//  Velvet_Revolver_-_Contraband_thumb.jpg
//  Velvet_Revolver_-_Libertad_thumb.jpg
//  Weezer_-_The_Green_Album_thumb.jpg
//  Whitesnake_-_Good_To_Be_Bad_thumb.jpg
//  Zakk_Wylde_-_Pride_And_Glory_thumb.jpg
//  ZZ_Top_-_Afterburner_thumb.jpg
//  ZZ_Top_-_Antenna_thumb.jpg
//  ZZ_Top_-_Deguello_thumb.jpg
//  ZZ_Top_-_El_Loco_thumb.jpg
//  ZZ_Top_-_Fandango_thumb.jpg
//  ZZ_Top_-_Mescalero_thumb.jpg
//  ZZ_Top_-_Recycler_thumb.jpg
//  ZZ_Top_-_Rhythmeen_thumb.jpg
//  ZZ_Top_-_Rio_Grande_Mud_thumb.jpg
//  ZZ_Top_-_Tejas_thumb.jpg
//  ZZ_Top_-_Tres_Hombres_thumb.jpg
//  ZZ_Top_-_XXX_thumb.jpg
//  ZZ_Top_-_Zz_Top's_First_Album_thumb.jpg
