import 'dart:async';

import 'package:covid19_tracker/model/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Countries.dart';
import 'Indian.dart';
import 'dashboard.dart';
import 'newsPage.dart';

class SettingPage extends StatefulWidget {
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  bool isSwitched = false;
  Future<bool> Savesettings(bool swit) async {
    // TODO: implement initState

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSwitched', swit);
    print("hello" + isSwitched.toString());

    return prefs.commit();
  }

  Future<bool> Getsettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSwitched = prefs.getBool('isSwitched');
    return isSwitched;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      Getsettings().then(update);
    });
  }

  FutureOr update(bool value) {
    setState(() {
      isSwitched = value;
      print(" hello 2 " + isSwitched.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Concure'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Set Dark Mode",
                        style: TextStyle(fontSize: 20),
                      ),
                      ElevatedButton(
                        child: Text('News Page'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    ],
                  ),

                

                  // Switch(value: null, onChanged: null),
                  // Switch(
                  //     // value: isSwitched,
                  //     // onChanged: (value) {
                  //     //   isSwitched = value;
                  //     //   currentTheme.switchTheme();
                  //     //   setState(() {
                  //     //     Savesettings(isSwitched);
                  //     //   });
                  //     // },
                  //     // activeColor: Colors.orange,
                  //     // activeTrackColor: Colors.orangeAccent,
                  //     )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              // rippleColor: Colors.black87,
              // hoverColor: Colors.yellow,
              gap: 8,
              // activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              // tabBackgroundColor: Colors.yellow,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.apps,
                  iconSize: 30,
                  text: 'Home',
                  backgroundColor: Colors.red[100],
                  textColor: Colors.red,
                  iconActiveColor: Colors.red,
                  iconColor: Colors.red,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  },
                ),
                GButton(
                    icon: Icons.find_in_page,
                    iconColor: Colors.purpleAccent,
                    text: 'Countries',
                    backgroundColor: Colors.purple[100],
                    textColor: Colors.purple,
                    iconActiveColor: Colors.purpleAccent[200],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cont()),
                      );
                    }),
                GButton(
                  icon: Icons.countertops,
                  text: 'States',
                  iconColor: Colors.pink,
                  backgroundColor: Colors.pink[100],
                  textColor: Colors.pink,
                  iconActiveColor: Colors.redAccent,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Indian()));
//
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MytestApp()),
                    // );
                  },
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  iconColor: Colors.blue,
                  backgroundColor: Colors.blue[100],
                  textColor: Colors.blue[500],
                  iconActiveColor: Colors.blue[600],
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MytestApp()),
                    // );
                  },
                ),
              ],
              selectedIndex: 3,
              // onTabChange: (index) {
              //   setState(() {
              //     _selectedIndex = index;
              //   });
              // },
            ),
          ),
        ),
      ),
    );
  }
}
