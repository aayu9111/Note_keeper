import 'package:demo_ui/login_screen.dart';
import 'package:demo_ui/page/chat.dart';
import 'package:demo_ui/page/feed.dart';
import 'package:demo_ui/page/home.dart';
import 'package:demo_ui/page/profile.dart';
import 'package:demo_ui/register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  final screens = [
    Home(),
    Feed(),
    Profile(),
    Chat(),
  ];

  List<String> data = [
    'A'
        'b'
        'c'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text(
        //     'Search',
        //   ),
        // ),
        drawer: Drawer(
            child: Column(children: [
          const ListTile(
            // contentPadding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            leading: Icon(
              color: Colors.black,
              size: 30,
              Icons.home_outlined,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
            ),
          ),
          const ListTile(
            // contentPadding: EdgeInsets.only(top: MediaQuery.of(context).padding.horizontal),
            leading: Icon(
              color: Colors.black,
              size: 30,
              Icons.favorite_border_sharp,
            ),
            title: Text(
              'Favourites',
              style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
            ),
          ),
          const ListTile(
            // contentPadding: EdgeInsets.only(top: MediaQuery.of(context).padding.horizontal),
            leading: Icon(
              color: Colors.black,
              size: 30,
              Icons.workspaces_outline,
            ),
            title: Text(
              'WorkFlow',
              style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
            ),
          ),
          const ListTile(
            // contentPadding: EdgeInsets.only(top: MediaQuery.of(context).padding.horizontal),
            leading: Icon(
              color: Colors.black,
              size: 30,
              Icons.update,
            ),
            title: Text(
              'Updates',
              style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const ListTile(
            // contentPadding: EdgeInsets.only(
            //   top: MediaQuery.of(context).padding.horizontal,
            // ),
            leading: Icon(
              color: Colors.black,
              size: 30,
              Icons.notification_add_outlined,
            ),
            title: Text(
              'Notification',
              style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                          child: const Text(
                            'YES',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: 'NotoSerifToto',
                                fontWeight: FontWeight.bold),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('NO',
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                  fontFamily: 'NotoSerifToto',
                                  fontWeight: FontWeight.bold)))
                    ],
                    backgroundColor: Colors.orangeAccent,
                    title: const Text(
                      'Logout ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSerifToto',
                        fontSize: 25,
                      ),
                    ),
                  );
                },
              );
            },
            leading: const Icon(
              color: Colors.black,
              size: 30,
              Icons.logout,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
            ),
          ),
        ])),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          iconSize: 35,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          // type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Feed', backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person', backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat', backgroundColor: Colors.orangeAccent)
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
