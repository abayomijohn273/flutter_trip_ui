import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController _pageController;
  void _onScroll() {}
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          makePage(
            page: 1,
            image: "assets/images/one.jpg",
            title: "Yosemite National Park",
            description:
                "Yosemite National Park is in California's Sierra Nevada mountain. Yosemite National Park is in California's Sierra Nevada mountain. Yosemite National Park is in California's Sierra Nevada mountain",
          ),
          makePage(
            page: 2,
            image: "assets/images/two.jpg",
            title: "Golden Gate Bridge",
            description:
                "The Golden Gate Bridge is a suspension brigde spanning the Golden Gate. The Golden Gate Bridge is a suspension brigde spanning the Golden Gate. The Golden Gate Bridge is a suspension brigde spanning the Golden Gate",
          ),
          makePage(
            page: 3,
            image: "assets/images/three.jpg",
            title: "Sedonna",
            description:
                "Sedonna is regularly described as one of Ameria's most beautiful places. Sedonna is regularly described as one of Ameria's most beautiful places. Sedonna is regularly described as one of Ameria's most beautiful places.",
          ),
          makePage(
            page: 4,
            image: "assets/images/four.jpg",
            title: "Savannah",
            description:
                "Savannah, with its Spanish moss, Southern accents and creepy graveyards. Savannah, with its Spanish moss, Southern accents and creepy graveyards. Savannah, with its Spanish moss, Southern accents and creepy graveyards. ",
          ),
        ],
      ),
    );
  }

  Widget makePage({int page, String image, String title, String description}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        // I am using this gradient styling here because i am working view the program on chrome,
        // you can omit it if you are using emulator/simulator
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          stops: [0.3, 0.9],
          colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    page.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "/4",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        starIcon(Colors.yellow),
                        starIcon(Colors.yellow),
                        starIcon(Colors.yellow),
                        starIcon(Colors.yellow),
                        starIcon(Colors.grey),
                        Text(
                          "4.0",
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "(2300)",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          height: 1.9,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "READ MORE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget starIcon(Color color) {
    return Container(
      margin: EdgeInsets.only(
        right: 3,
      ),
      child: Icon(
        Icons.star,
        color: color,
        size: 15,
      ),
    );
  }
}
