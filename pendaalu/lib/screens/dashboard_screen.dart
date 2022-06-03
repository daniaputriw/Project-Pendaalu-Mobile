import 'package:flutter/material.dart';
import 'package:pendaalu/screens/splash_screen.dart';

import 'home_screen.dart';
import 'profile_screen.dart';
import 'pencarian_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;
  List<Widget> list = [
    HomeScreen(),
    ProfileScreen(),
    Pencarian(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pendaalu'),
          backgroundColor: Colors.cyan,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),);
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: list[index],
        drawer: MyDrawer(
          onTap: (ctx, i) {
            setState(() {
              index = i;
              Navigator.pop(ctx);
            });
          },
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'IPA',
    'IPS',
    'Data Alumni'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var data in searchTerms) {
      if (data.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(data);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var data in searchTerms) {
      if (data.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(data);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/profil.png"),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Admin',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'admin@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => onTap(context, 1),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Pencarian'),
              onTap: () => onTap(context, 2),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Tentang'),
              onTap: () => onTap(context, 2),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
