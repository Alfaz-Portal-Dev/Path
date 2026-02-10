import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(home: GhostPortal()));

class GhostPortal extends StatefulWidget {
  @override
  _GhostPortalState createState() => _GhostPortalState();
}

class _GhostPortalState extends State<GhostPortal> {
  int daysLeft = 7;
  bool isUnlocked = false;

  _checkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? time = prefs.getString('start_time');
    if (time != null) {
      int diff = DateTime.now().difference(DateTime.parse(time)).inDays;
      setState(() { daysLeft = 7 - diff; isUnlocked = true; });
    }
  }

  @override
  void initState() { super.initState(); _checkStatus(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("$daysLeft Days Left", style: TextStyle(color: Colors.purple, fontSize: 30)),
      ),
    );
  }
}
