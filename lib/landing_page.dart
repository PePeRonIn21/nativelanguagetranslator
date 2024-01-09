import 'package:flutter/material.dart';
import 'login_page.dart';
import 'translate_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: Padding(
            padding: EdgeInsets.only(top: 5, left: 5),
            child: AppBar(
              title: Center(
                child: Text(
                  'Welcome Dave',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/profile_picture.jpg'),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Add logic for search button
                  },
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Account Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  // Add logic for menu item 1
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  // Add logic for menu item 2
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  ); // Add logic for menu item 2
                },
              ),
              // Add more ListTile widgets for additional menu items
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 190, 214, 219),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Start',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Translating!',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TranslatePage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                child: Text('Start',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Translate',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Add logic for "See all" text click
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
