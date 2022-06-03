import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color(0xFF46C1BE),
              Color(0xFF45CAF5),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          ),
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              MyMenu(
                title: "Data Alumni",
                icon: Icons.groups,
                warna: Colors.brown,
              ),
              MyMenu(
                title: "Data IPA",
                icon: Icons.folder,
                warna: Colors.red,
              ),
              MyMenu(
                title: "Data IPS",
                icon: Icons.folder,
                warna: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({required this.title, required this.icon, required this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        splashColor: Color(0xFF45CAF5),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}
