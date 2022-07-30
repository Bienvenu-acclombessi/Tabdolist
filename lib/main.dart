import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                child: Icon(Icons.android),
              ),
              Tab(
                child: Icon(Icons.flutter_dash),
              ),
              Tab(
                child: Icon(Icons.ios_share),
              )
            ]),
          ),
          body: TabBarView(
            children: [
              Card(
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/cat-3.jpg"),
                      FlatButton(
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext context) => SecondePage());
                          Navigator.of(context).push(route);
                        },
                        child: Text("Ajouter"),
                        color: Colors.yellow,
                      )
                    ],
                  )),
              Card(
                color: Colors.red,
                child: Column(
                  children: [
                    Image.asset("images/cat-2.jpg"),
                    FlatButton(
                      color: Colors.blue,
                      child: Text("formulaire"),
                      onPressed: () {
                        var route = MaterialPageRoute(
                            builder: (context) => Formulaire());
                        Navigator.of(context).push(route);
                      },
                    )
                  ],
                ),
              ),
              Card(
                color: Colors.orange,
                child: Container(
                    height: 400,
                    child: Column(children: [
                      Image.asset("images/cat-1.jpg"),
                      FlatButton(
                        color: Colors.blue,
                        child: Text("Filter"),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (context) => Backfilt());
                          Navigator.of(context).push(route);
                        },
                      )
                    ])),
              )
            ],
          )

          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    ));
  }
}

class SecondePage extends StatelessWidget {
  const SecondePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page de description"),
        ),
        body: Container(
            color: Colors.pink,
            child: ListView(
              children: [
                Image.asset("images/cat-2.jpg"),
                Expanded(child: Text("Lomerfy utvytgyt uyvfv tytfv")),
                Image.asset("images/cat-3.jpg"),
                Image.asset("images/cat-4.jpg"),
                Image.asset("images/cat-5.jpg"),
              ],
            ))
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Formulaire extends StatefulWidget {
  Formulaire({Key? key}) : super(key: key);

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  String name = " ";
  String passe = " ";
  String val = "Connexion";

  final GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  valide() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      setState(() {
        val = "Votre username est $name";
      });
    }
  }

  Widget caroul = Container(
    height: 200,
    child: Carousel(
      boxFit: BoxFit.fill,
      images: [
        AssetImage("images/cat-1.jpg"),
        AssetImage("images/cat-2.jpg"),
        AssetImage("images/cat-3.jpg"),
        AssetImage("images/cat-4.jpg"),
        AssetImage("images/cat-5.jpg")
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page de connexion"),
        ),
        body: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                color: Colors.pink,
                child: ListView(
                  children: [
                    caroul,
                    Text("val"),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'username',
                          icon: Icon(Icons.person),
                          hintText: "Username"),
                      keyboardType: TextInputType.name,
                      validator: (val) => val.toString().length == 0
                          ? "Veuiller remplir ce champ"
                          : null,
                      onSaved: (val) => name = val.toString(),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          icon: Icon(Icons.person),
                          hintText: "Username"),
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      validator: (val) => val.toString().length == 0
                          ? "Veuiller remplir ce champ"
                          : null,
                      onSaved: (val) => passe = val.toString(),
                    ),
                    RaisedButton(
                      onPressed: valide,
                      child: Text("Valider"),
                    ),
                  ],
                ),
              )
            ],
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

class Backfilt extends StatelessWidget {
  const Backfilt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page avec filter"),
        ),
        body: Stack(fit: StackFit.expand, children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/blog-4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 50,
            right: 50,
            bottom: 50,
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white.withOpacity(0.5),
                    child: Column(children: [
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        "Un sac pas comme les autres Bienvenu",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Caroudel()));
                          },
                          child: Text("Carousel"))
                    ]),
                  ),
                )),
          )
        ])
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Caroudel extends StatefulWidget {
  Caroudel({Key? key}) : super(key: key);

  @override
  State<Caroudel> createState() => _CaroudelState();
}

class _CaroudelState extends State<Caroudel> {
  List<String> listImagest = List.empty(growable: true);
  String a = "images/book-1.png";
  String b = "images/book-2.png";
  String c = "images/book-3.png";
  String d = "images/book-4.png";
  String e = "images/book-5.png";
  String f = "images/book-6.png";
  String g = "images/book-9.png";
  String h = "images/book-8.png";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listImagest.add(a);
    listImagest.add(b);
    listImagest.add(c);
    listImagest.add(d);
    listImagest.add(e);
    listImagest.add(f);
    listImagest.add(g);
    listImagest.add(h);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carousel"),
        ),
        body: Column(children: [
          CarouselSlider(
              items: listImagest.map((e) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("$e"),
                      ],
                    ));
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height - 100,
              ))
        ])
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
