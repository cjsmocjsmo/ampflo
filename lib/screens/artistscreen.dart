import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'models/artistmodel.dart';

class ArtistScreen extends StatefulWidget {
  // ArtistScreen({Key? key, required this.title}) : super(key: key);
  ArtistScreen({Key? key}) : super(key: key);

  // final String title;

  @override
  _ArtistScreenState createState() => new _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  List<int> verticalData = [];
  // List<int> horizontalData = [];

  final int increment = 10;

  bool isLoadingVertical = false;
  // bool isLoadingHorizontal = false;

  @override
  void initState() {
    _loadMoreVertical();
    // _loadMoreHorizontal();
    super.initState();
  }

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 2));
    // verticalData = fetchArtist()
    increment = fetchArtist()

    verticalData.addAll(
        List.generate(increment, (index) => verticalData.length + index));

    setState(() {
      isLoadingVertical = false;
    });
  }

  // Future _loadMoreHorizontal() async {
  //   setState(() {
  //     isLoadingHorizontal = true;
  //   });

  //   // Add in an artificial delay
  //   await new Future.delayed(const Duration(seconds: 2));

  //   horizontalData.addAll(
  //       List.generate(increment, (index) => horizontalData.length + index));

  //   setState(() {
  //     isLoadingHorizontal = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artist Page"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/Main'
              );
            },
            icon: Icon(Icons.home),
            tooltip: "Go To Home Page"
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/'
              );
            },
            icon: Icon(Icons.exit_to_app_sharp),
            tooltip: "Exit App"
          ),
        ]
      ),
      body: LazyLoadScrollView(
        isLoading: isLoadingVertical,
        onEndOfPage: () => _loadMoreVertical(),
        child: Scrollbar(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Vertical ListView',
                  textAlign: TextAlign.center,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: verticalData.length,
                itemBuilder: (context, position) {
                  return DemoItem(position);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;

  const DemoItem(
    this.position, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    height: 40.0,
                    width: 40.0,
                  ),
                  SizedBox(width: 8.0),
                  Text("Item $position"),
                ],
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sed vulputate orci. Proin id scelerisque velit. Fusce at ligula ligula. Donec fringilla sapien odio, et faucibus tortor finibus sed. Aenean rutrum ipsum in sagittis auctor. Pellentesque mattis luctus consequat. Sed eget sapien ut nibh rhoncus cursus. Donec eget nisl aliquam, ornare sapien sit amet, lacinia quam."),
            ],
          ),
        ),
      ),
    );
  }
}
